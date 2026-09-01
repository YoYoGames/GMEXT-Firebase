// Firebase Auth - core Auth surface, ported into GMFirebaseCore: singleton
// accessor, language/emulator config, sign-in/sign-up/sign-out, password
// reset, provider discovery, the AuthStateListener/IdTokenListener add/remove
// pair, full AuthResult materialization, and federated OAuth providers.
//
// This is GMFirebaseAuth's former GMFirebase_auth.cpp, moved here because
// only GMFirebaseCore now statically links the Firebase C++ SDK (see
// GMFirebase_core_auth_api.h for why). Bodies are unchanged; only the names
// moved into the gmfb_auth:: namespace to match GMFirebaseCoreAuthAPI's
// fields, and gm::wire::GMFunction/GMValue/StructStream still cross straight
// through since they're ordinary C++ classes safe to share across this
// repo's DLLs.
#include "GMFirebase_core_auth_impl.h"
#include "GMFirebase_common.h"
#include "firebase/auth.h"
#include "core/GMExtUtils.h"

using namespace gm::wire;

namespace gmfb_auth
{
    // ============================================================
    // Auth singleton
    // ============================================================

    namespace
    {
        firebase::auth::Auth* g_firebase_auth = nullptr;
    }

    firebase::auth::Auth* getAuth()
    {
        if (g_firebase_auth != nullptr)
            return g_firebase_auth;

        firebase::App* app = getFirebaseApp();
        LOG_INFO("gmfb_auth::getAuth: getFirebaseApp() -> %p", (void*)app);
        if (app == nullptr)
        {
            LOG_ERROR("gmfb_auth::getAuth: no firebase::App - was firebase_app_initialize() called?");
            setFirebaseLastError(-1, "firebase::App is not initialized");
            return nullptr;
        }

        firebase::InitResult init_result = firebase::kInitResultSuccess;
        g_firebase_auth = firebase::auth::Auth::GetAuth(app, &init_result);

        if (g_firebase_auth == nullptr || init_result != firebase::kInitResultSuccess)
        {
            LOG_ERROR("gmfb_auth::getAuth: Auth::GetAuth() failed, init_result=%d", static_cast<int>(init_result));
            setFirebaseLastError(static_cast<int>(init_result), "failed to initialize firebase::auth::Auth");
        }
        else
        {
            LOG_INFO("gmfb_auth::getAuth: firebase::auth::Auth=%p ready", (void*)g_firebase_auth);
        }

        return g_firebase_auth;
    }

    bool get_auth()
    {
        return getAuth() != nullptr;
    }

    // ============================================================
    // Language / emulator configuration
    // ============================================================

    std::string language_code()
    {
        firebase::auth::Auth* auth = getAuth();
        if (auth == nullptr)
            return std::string();

        return auth->language_code();
    }

    void set_language_code(std::string_view language_code)
    {
        firebase::auth::Auth* auth = getAuth();
        if (auth == nullptr)
            return;

        std::string language_code_str(language_code);
        auth->set_language_code(language_code_str.c_str());
    }

    void use_app_language()
    {
        firebase::auth::Auth* auth = getAuth();
        if (auth == nullptr)
            return;

        auth->UseAppLanguage();
    }

    void use_emulator(std::string_view host, double port)
    {
        firebase::auth::Auth* auth = getAuth();
        if (auth == nullptr)
            return;

        auth->UseEmulator(std::string(host), static_cast<uint32_t>(port));
    }

    // ============================================================
    // Current user / sign-out
    // ============================================================

    std::optional<uint64_t> current_user()
    {
        firebase::auth::Auth* auth = getAuth();
        if (auth == nullptr)
            return std::nullopt;

        firebase::auth::User user = auth->current_user();
        if (!user.is_valid())
            return std::nullopt;

        return wrapUser(user);
    }

    void sign_out()
    {
        firebase::auth::Auth* auth = getAuth();
        if (auth == nullptr)
            return;

        auth->SignOut();
    }

    // ============================================================
    // Provider discovery
    // ============================================================

    void fetch_providers_for_email(std::string_view email, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::auth::Auth* auth = getAuth();
        if (auth == nullptr)
        {
            if (callback)
                callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()), gm::wire::ArrayStream{});
            return;
        }

        std::string email_str(email);
        auth->FetchProvidersForEmail(email_str.c_str()).OnCompletion(
            [callback](const firebase::Future<firebase::auth::Auth::FetchProvidersResult>& f)
            {
                int code = f.error();
                const char* message = f.error_message();
                setFirebaseLastError(code, message != nullptr ? message : "");

                if (!callback)
                    return;

                gm::wire::ArrayStream providers;
                if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
                {
                    for (const std::string& provider_id : f.result()->providers)
                        providers.push(std::string_view{ provider_id });
                }

                callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""), providers);
            });
    }

    // ============================================================
    // Sign-in / sign-up
    // ============================================================

    void sign_in_with_custom_token(std::string_view custom_token, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::auth::Auth* auth = getAuth();
        if (auth == nullptr)
        {
            if (callback)
                callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()), std::optional<uint64_t>{});
            return;
        }

        std::string token_str(custom_token);
        auth->SignInWithCustomToken(token_str.c_str()).OnCompletion(
            [callback](const firebase::Future<firebase::auth::AuthResult>& f)
            {
                int code = f.error();
                const char* message = f.error_message();
                setFirebaseLastError(code, message != nullptr ? message : "");

                if (!callback)
                    return;

                std::optional<uint64_t> user_ref;
                if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
                    user_ref = wrapUser(f.result()->user);

                callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""), user_ref);
            });
    }

    void sign_in_with_credential(uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::auth::Auth* auth = getAuth();
        firebase::auth::Credential credential;
        bool credential_ok = resolveCredential(credential_ref, credential);

        if (auth == nullptr || !credential_ok)
        {
            if (callback)
                callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()), std::optional<uint64_t>{});
            return;
        }

        auth->SignInWithCredential(credential).OnCompletion(
            [callback](const firebase::Future<firebase::auth::User>& f)
            {
                int code = f.error();
                const char* message = f.error_message();
                setFirebaseLastError(code, message != nullptr ? message : "");

                if (!callback)
                    return;

                std::optional<uint64_t> user_ref;
                if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
                    user_ref = wrapUser(*f.result());

                callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""), user_ref);
            });
    }

    void sign_in_and_retrieve_data_with_credential(uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::auth::Auth* auth = getAuth();
        firebase::auth::Credential credential;
        bool credential_ok = resolveCredential(credential_ref, credential);

        if (auth == nullptr || !credential_ok)
        {
            if (callback)
                callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()), std::optional<uint64_t>{});
            return;
        }

        auth->SignInAndRetrieveDataWithCredential(credential).OnCompletion(
            [callback](const firebase::Future<firebase::auth::AuthResult>& f)
            {
                int code = f.error();
                const char* message = f.error_message();
                setFirebaseLastError(code, message != nullptr ? message : "");

                if (!callback)
                    return;

                std::optional<uint64_t> user_ref;
                if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
                    user_ref = wrapUser(f.result()->user);

                callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""), user_ref);
            });
    }

    void sign_in_anonymously(const std::optional<gm::wire::GMFunction>& callback)
    {
        LOG_INFO("gmfb_auth::sign_in_anonymously: called");
        firebase::auth::Auth* auth = getAuth();
        if (auth == nullptr)
        {
            LOG_ERROR("gmfb_auth::sign_in_anonymously: getAuth() returned null, aborting");
            if (callback)
                callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()), std::optional<uint64_t>{});
            return;
        }

        LOG_INFO("gmfb_auth::sign_in_anonymously: firebase::auth::Auth=%p, calling SignInAnonymously()", (void*)auth);
        auth->SignInAnonymously().OnCompletion(
            [callback](const firebase::Future<firebase::auth::AuthResult>& f)
            {
                int code = f.error();
                const char* message = f.error_message();
                LOG_INFO("gmfb_auth::sign_in_anonymously: completed, error_code=%d, message=%s",
                    code, message != nullptr ? message : "");
                setFirebaseLastError(code, message != nullptr ? message : "");

                if (!callback)
                    return;

                std::optional<uint64_t> user_ref;
                if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
                    user_ref = wrapUser(f.result()->user);

                callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""), user_ref);
            });
    }

    void sign_in_with_email_and_password(std::string_view email, std::string_view password, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::auth::Auth* auth = getAuth();
        if (auth == nullptr)
        {
            if (callback)
                callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()), std::optional<uint64_t>{});
            return;
        }

        std::string email_str(email);
        std::string password_str(password);
        auth->SignInWithEmailAndPassword(email_str.c_str(), password_str.c_str()).OnCompletion(
            [callback](const firebase::Future<firebase::auth::AuthResult>& f)
            {
                int code = f.error();
                const char* message = f.error_message();
                setFirebaseLastError(code, message != nullptr ? message : "");

                if (!callback)
                    return;

                std::optional<uint64_t> user_ref;
                if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
                    user_ref = wrapUser(f.result()->user);

                callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""), user_ref);
            });
    }

    void create_user_with_email_and_password(std::string_view email, std::string_view password, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::auth::Auth* auth = getAuth();
        if (auth == nullptr)
        {
            if (callback)
                callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()), std::optional<uint64_t>{});
            return;
        }

        std::string email_str(email);
        std::string password_str(password);
        auth->CreateUserWithEmailAndPassword(email_str.c_str(), password_str.c_str()).OnCompletion(
            [callback](const firebase::Future<firebase::auth::AuthResult>& f)
            {
                int code = f.error();
                const char* message = f.error_message();
                setFirebaseLastError(code, message != nullptr ? message : "");

                if (!callback)
                    return;

                std::optional<uint64_t> user_ref;
                if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
                    user_ref = wrapUser(f.result()->user);

                callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""), user_ref);
            });
    }

    // ============================================================
    // Password reset
    // ============================================================

    void send_password_reset_email(std::string_view email, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::auth::Auth* auth = getAuth();
        if (auth == nullptr)
        {
            if (callback)
                callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()));
            return;
        }

        std::string email_str(email);
        auth->SendPasswordResetEmail(email_str.c_str()).OnCompletion(
            [callback](const firebase::Future<void>& f)
            {
                int code = f.error();
                const char* message = f.error_message();
                setFirebaseLastError(code, message != nullptr ? message : "");

                if (callback)
                    callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""));
            });
    }

    // ============================================================
    // AuthStateListener / IdTokenListener
    // ============================================================
    // Each listener is a small heap-allocated subclass that owns its own
    // gm::wire::GMFunction. GML receives a packed registry id, never the native
    // address. The remove function resolves that id, unregisters the listener
    // from Auth and from GMFirebase's pointer registry, then deletes it.

    namespace
    {
        class GmAuthStateListener : public firebase::auth::AuthStateListener
        {
        public:
            explicit GmAuthStateListener(gm::wire::GMFunction callback) : callback_(std::move(callback)) {}

            void OnAuthStateChanged(firebase::auth::Auth* auth) override
            {
                std::optional<uint64_t> user_ref;
                if (auth != nullptr)
                {
                    firebase::auth::User user = auth->current_user();
                    if (user.is_valid())
                        user_ref = wrapUser(user);
                }

                callback_.call(user_ref);
            }

        private:
            gm::wire::GMFunction callback_;
        };

        class GmIdTokenListener : public firebase::auth::IdTokenListener
        {
        public:
            explicit GmIdTokenListener(gm::wire::GMFunction callback) : callback_(std::move(callback)) {}

            void OnIdTokenChanged(firebase::auth::Auth* auth) override
            {
                std::optional<uint64_t> user_ref;
                if (auth != nullptr)
                {
                    firebase::auth::User user = auth->current_user();
                    if (user.is_valid())
                        user_ref = wrapUser(user);
                }

                callback_.call(user_ref);
            }

        private:
            gm::wire::GMFunction callback_;
        };
    }

    std::optional<uint64_t> add_state_listener(const gm::wire::GMFunction& callback)
    {
        firebase::auth::Auth* auth = getAuth();
        if (auth == nullptr)
            return std::nullopt;

        GmAuthStateListener* listener = new GmAuthStateListener(callback);
        auth->AddAuthStateListener(listener);

        return registerFirebasePointer(listener, GM_FB_TYPE_AUTH_STATE_LISTENER);
    }

    void remove_state_listener(uint64_t listener_ref)
    {
        GmAuthStateListener* listener = nullptr;
        validate_fb_ref_ptr(listener_ref, GM_FB_TYPE_AUTH_STATE_LISTENER, GmAuthStateListener, listener);
        if (listener == nullptr)
            return;

        firebase::auth::Auth* auth = getAuth();
        if (auth != nullptr)
            auth->RemoveAuthStateListener(listener);

        listener = static_cast<GmAuthStateListener*>(unregisterFirebasePointer(listener_ref, GM_FB_TYPE_AUTH_STATE_LISTENER));
        delete listener;
    }

    std::optional<uint64_t> add_id_token_listener(const gm::wire::GMFunction& callback)
    {
        firebase::auth::Auth* auth = getAuth();
        if (auth == nullptr)
            return std::nullopt;

        GmIdTokenListener* listener = new GmIdTokenListener(callback);
        auth->AddIdTokenListener(listener);

        return registerFirebasePointer(listener, GM_FB_TYPE_AUTH_ID_TOKEN_LISTENER);
    }

    void remove_id_token_listener(uint64_t listener_ref)
    {
        GmIdTokenListener* listener = nullptr;
        validate_fb_ref_ptr(listener_ref, GM_FB_TYPE_AUTH_ID_TOKEN_LISTENER, GmIdTokenListener, listener);
        if (listener == nullptr)
            return;

        firebase::auth::Auth* auth = getAuth();
        if (auth != nullptr)
            auth->RemoveIdTokenListener(listener);

        listener = static_cast<GmIdTokenListener*>(unregisterFirebasePointer(listener_ref, GM_FB_TYPE_AUTH_ID_TOKEN_LISTENER));
        delete listener;
    }

    // ============================================================
    // Full AuthResult materialization + Federated OAuth providers
    // ============================================================

    namespace
    {
        firebase::auth::FederatedOAuthProviderData gmToFederatedProviderData(
            std::string_view provider_id,
            const gm::wire::GMValue& scopes,
            const gm::wire::GMValue& custom_parameters)
        {
            firebase::auth::FederatedOAuthProviderData data{std::string(provider_id)};
            if (scopes.is<gm::wire::GMArrayView>())
            {
                auto a = scopes.as<gm::wire::GMArrayView>();
                for (const auto& v : a)
                    if (v.is<std::string_view>()) data.scopes.emplace_back(v.as<std::string_view>());
            }
            if (custom_parameters.is<gm::wire::GMObjectView>())
            {
                auto o = custom_parameters.as<gm::wire::GMObjectView>();
                for (const auto& pair : o)
                    if (pair.second.is<std::string_view>())
                        data.custom_parameters.emplace(std::string(pair.first), std::string(pair.second.as<std::string_view>()));
            }
            return data;
        }

        firebase::auth::FederatedOAuthProvider* resolveFederatedProvider(uint64_t provider_ref)
        {
            firebase::auth::FederatedOAuthProvider* provider = nullptr;
            validate_fb_ref_ptr(provider_ref, GM_FB_TYPE_AUTH_FEDERATED_PROVIDER, firebase::auth::FederatedOAuthProvider, provider);
            return provider;
        }

        void completeAuthResultFuture(const firebase::Future<firebase::auth::AuthResult>& f,
            const std::optional<gm::wire::GMFunction>& callback)
        {
            int code = f.error();
            const char* message = f.error_message();
            setFirebaseLastError(code, message ? message : "");
            if (!callback) return;

            if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
                callback->call(static_cast<double>(code), std::string_view{ message ? message : "" }, makeAuthResultStruct(*f.result()));
            else
                callback->call(static_cast<double>(code), std::string_view{ message ? message : "" }, std::optional<std::uint8_t>{});
        }
    }

    gm::wire::StructStream makeAuthResultStruct(const firebase::auth::AuthResult& result)
    {
        gm::wire::StructStream out;
        uint64_t user_ref = result.user.is_valid() ? wrapUser(result.user) : 0;
        uint64_t credential_ref = result.credential.is_valid() ? wrapCredential(result.credential) : 0;
        uint64_t updated_credential_ref = result.additional_user_info.updated_credential.is_valid()
            ? wrapCredential(result.additional_user_info.updated_credential) : 0;

        out.add("user", static_cast<double>(user_ref));
        out.add("credential", static_cast<double>(credential_ref));
        out.add("provider_id", std::string_view{ result.additional_user_info.provider_id });
        out.add("user_name", std::string_view{ result.additional_user_info.user_name });
        out.add("updated_credential", static_cast<double>(updated_credential_ref));

        gm::wire::StructStream profile;
        for (const auto& kv : result.additional_user_info.profile)
        {
            const firebase::Variant& key = kv.first;
            if (key.type() == firebase::Variant::kTypeStaticString || key.type() == firebase::Variant::kTypeMutableString)
                addVariantToStruct(key.string_value(), kv.second, profile);
        }
        out.add("profile", profile);
        return out;
    }

    uint64_t federated_oauth_provider_create(std::string_view provider_id,
        const gm::wire::GMValue& scopes, const gm::wire::GMValue& custom_parameters)
    {
        auto data = gmToFederatedProviderData(provider_id, scopes, custom_parameters);
        auto* provider = new firebase::auth::FederatedOAuthProvider(data);
        return registerFirebasePointer(provider, GM_FB_TYPE_AUTH_FEDERATED_PROVIDER);
    }

    void federated_oauth_provider_set_data(uint64_t provider_ref, std::string_view provider_id,
        const gm::wire::GMValue& scopes, const gm::wire::GMValue& custom_parameters)
    {
        auto* provider = resolveFederatedProvider(provider_ref);
        if (!provider) return;
        provider->SetProviderData(gmToFederatedProviderData(provider_id, scopes, custom_parameters));
    }

    void federated_oauth_provider_release(uint64_t provider_ref)
    {
        auto* provider = static_cast<firebase::auth::FederatedOAuthProvider*>(
            unregisterFirebasePointer(provider_ref, GM_FB_TYPE_AUTH_FEDERATED_PROVIDER));
        delete provider;
    }

    void sign_in_with_provider(uint64_t provider_ref, const std::optional<gm::wire::GMFunction>& callback)
    {
        auto* auth = getAuth();
        auto* provider = resolveFederatedProvider(provider_ref);
        if (!auth || !provider)
        {
            if (callback) callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), firebase_last_error_message(), std::optional<std::uint8_t>{});
            return;
        }
        auth->SignInWithProvider(provider).OnCompletion([callback](const firebase::Future<firebase::auth::AuthResult>& f)
        {
            completeAuthResultFuture(f, callback);
        });
    }

    void sign_in_with_custom_token_result(std::string_view custom_token, const std::optional<gm::wire::GMFunction>& callback)
    {
        auto* auth = getAuth();
        if (!auth) return;
        std::string token(custom_token);
        auth->SignInWithCustomToken(token.c_str()).OnCompletion([callback](const firebase::Future<firebase::auth::AuthResult>& f)
        {
            completeAuthResultFuture(f, callback);
        });
    }

    void sign_in_and_retrieve_data_with_credential_result(uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
    {
        auto* auth = getAuth();
        firebase::auth::Credential credential;
        if (!auth || !resolveCredential(credential_ref, credential)) return;
        auth->SignInAndRetrieveDataWithCredential(credential).OnCompletion([callback](const firebase::Future<firebase::auth::AuthResult>& f)
        {
            completeAuthResultFuture(f, callback);
        });
    }

    void sign_in_anonymously_result(const std::optional<gm::wire::GMFunction>& callback)
    {
        auto* auth = getAuth();
        if (!auth) return;
        auth->SignInAnonymously().OnCompletion([callback](const firebase::Future<firebase::auth::AuthResult>& f)
        {
            completeAuthResultFuture(f, callback);
        });
    }

    void sign_in_with_email_and_password_result(std::string_view email, std::string_view password,
        const std::optional<gm::wire::GMFunction>& callback)
    {
        auto* auth = getAuth();
        if (!auth) return;
        std::string e(email), p(password);
        auth->SignInWithEmailAndPassword(e.c_str(), p.c_str()).OnCompletion([callback](const firebase::Future<firebase::auth::AuthResult>& f)
        {
            completeAuthResultFuture(f, callback);
        });
    }

    void create_user_with_email_and_password_result(std::string_view email, std::string_view password,
        const std::optional<gm::wire::GMFunction>& callback)
    {
        auto* auth = getAuth();
        if (!auth) return;
        std::string e(email), p(password);
        auth->CreateUserWithEmailAndPassword(e.c_str(), p.c_str()).OnCompletion([callback](const firebase::Future<firebase::auth::AuthResult>& f)
        {
            completeAuthResultFuture(f, callback);
        });
    }

    uint64_t get_app()
    {
        auto* auth = getAuth();
        return auth ? wrapFirebaseApp(&auth->app()) : 0;
    }

    uint64_t get_current_instance_handle()
    {
        return getAuth() ? registerFirebasePointer(getAuth(), GM_FB_TYPE_AUTH) : 0;
    }

    uint64_t get_instance_for_app(uint64_t app_ref)
    {
        auto* app = resolveFirebaseApp(app_ref); if (!app) return 0;
        firebase::InitResult init_result = firebase::kInitResultSuccess;
        auto* auth = firebase::auth::Auth::GetAuth(app, &init_result);
        if (!auth || init_result != firebase::kInitResultSuccess)
        {
            setFirebaseLastError(static_cast<int>(init_result), "Auth::GetAuth(app) failed"); return 0;
        }
        return registerFirebasePointer(auth, GM_FB_TYPE_AUTH);
    }

    double use_instance(uint64_t auth_ref)
    {
        auto* auth = static_cast<firebase::auth::Auth*>(resolveFirebasePointer(auth_ref, GM_FB_TYPE_AUTH));
        if (!auth) return 0.0;
        g_firebase_auth = auth;
        return 1.0;
    }

    uint64_t instance_get_app(uint64_t auth_ref)
    {
        auto* auth = static_cast<firebase::auth::Auth*>(resolveFirebasePointer(auth_ref, GM_FB_TYPE_AUTH));
        return auth ? wrapFirebaseApp(&auth->app()) : 0;
    }
}
