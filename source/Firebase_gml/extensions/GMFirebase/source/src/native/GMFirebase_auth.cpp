// Firebase Auth - core Auth surface: singleton accessor, language/emulator
// config, sign-in/sign-up/sign-out, password reset, provider discovery, and
// the AuthStateListener/IdTokenListener add/remove pair.
//
// Every Future<T>-returning SDK call below follows the same shape: fetch the
// Auth instance, fire the call, and attach an OnCompletion lambda that calls
// the GML callback, if one was supplied, with (error_code, error_message,
// ...results) - and does nothing else. The SDK's result reaches GML through
// that callback only; firebase_last_error_*() is written by the synchronous
// guards alone and never from a completion. GMFunction::call() is documented
// as thread-safe (it just appends to a mutex-guarded DispatchQueue), so it is
// called straight from these completion lambdas - which may run on Firebase's
// own worker threads - with no additional queueing of our own.
//
// The callback is only ever fired by that completion lambda. A failure before
// the SDK call - no Auth instance, a handle that does not resolve - is
// returned synchronously as a FirebaseError and the callback is not touched,
// so a caller that checks the return value never waits on a callback that
// cannot arrive.
#include "GMFirebase_common.h"
#include "firebase/auth.h"

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

// ============================================================
// Enum mirrors (see GM_FB_PIN_ENUM in GMFirebase_common.h)
// ============================================================

// FirebaseAuthError is the error_code every auth callback receives. One line
// per public SDK enumerator, so a value the SDK adds fails here until
// spec.gmidl declares it. The last eight values in the spec (79..86,
// InvalidEventHandler through TokenRefreshUnavailable) sit behind
// INTERNAL_EXPERIMENTAL in the public auth/types.h and cannot be named here,
// but the prebuilt SDK is compiled with that flag and its Android and iOS
// error tables (common_android.cc, auth_ios.mm) do emit them - UserCancelled
// (84) is what a dismissed federated sign-in returns - so the spec mirrors
// their ordinals.
GM_FB_PIN_ENUM(FirebaseAuthError::None, firebase::auth::kAuthErrorNone);
GM_FB_PIN_ENUM(FirebaseAuthError::Unimplemented, firebase::auth::kAuthErrorUnimplemented);
GM_FB_PIN_ENUM(FirebaseAuthError::Failure, firebase::auth::kAuthErrorFailure);
GM_FB_PIN_ENUM(FirebaseAuthError::InvalidCustomToken, firebase::auth::kAuthErrorInvalidCustomToken);
GM_FB_PIN_ENUM(FirebaseAuthError::CustomTokenMismatch, firebase::auth::kAuthErrorCustomTokenMismatch);
GM_FB_PIN_ENUM(FirebaseAuthError::InvalidCredential, firebase::auth::kAuthErrorInvalidCredential);
GM_FB_PIN_ENUM(FirebaseAuthError::UserDisabled, firebase::auth::kAuthErrorUserDisabled);
GM_FB_PIN_ENUM(FirebaseAuthError::AccountExistsWithDifferentCredentials, firebase::auth::kAuthErrorAccountExistsWithDifferentCredentials);
GM_FB_PIN_ENUM(FirebaseAuthError::OperationNotAllowed, firebase::auth::kAuthErrorOperationNotAllowed);
GM_FB_PIN_ENUM(FirebaseAuthError::EmailAlreadyInUse, firebase::auth::kAuthErrorEmailAlreadyInUse);
GM_FB_PIN_ENUM(FirebaseAuthError::RequiresRecentLogin, firebase::auth::kAuthErrorRequiresRecentLogin);
GM_FB_PIN_ENUM(FirebaseAuthError::CredentialAlreadyInUse, firebase::auth::kAuthErrorCredentialAlreadyInUse);
GM_FB_PIN_ENUM(FirebaseAuthError::InvalidEmail, firebase::auth::kAuthErrorInvalidEmail);
GM_FB_PIN_ENUM(FirebaseAuthError::WrongPassword, firebase::auth::kAuthErrorWrongPassword);
GM_FB_PIN_ENUM(FirebaseAuthError::TooManyRequests, firebase::auth::kAuthErrorTooManyRequests);
GM_FB_PIN_ENUM(FirebaseAuthError::UserNotFound, firebase::auth::kAuthErrorUserNotFound);
GM_FB_PIN_ENUM(FirebaseAuthError::ProviderAlreadyLinked, firebase::auth::kAuthErrorProviderAlreadyLinked);
GM_FB_PIN_ENUM(FirebaseAuthError::NoSuchProvider, firebase::auth::kAuthErrorNoSuchProvider);
GM_FB_PIN_ENUM(FirebaseAuthError::InvalidUserToken, firebase::auth::kAuthErrorInvalidUserToken);
GM_FB_PIN_ENUM(FirebaseAuthError::UserTokenExpired, firebase::auth::kAuthErrorUserTokenExpired);
GM_FB_PIN_ENUM(FirebaseAuthError::NetworkRequestFailed, firebase::auth::kAuthErrorNetworkRequestFailed);
GM_FB_PIN_ENUM(FirebaseAuthError::InvalidApiKey, firebase::auth::kAuthErrorInvalidApiKey);
GM_FB_PIN_ENUM(FirebaseAuthError::AppNotAuthorized, firebase::auth::kAuthErrorAppNotAuthorized);
GM_FB_PIN_ENUM(FirebaseAuthError::UserMismatch, firebase::auth::kAuthErrorUserMismatch);
GM_FB_PIN_ENUM(FirebaseAuthError::WeakPassword, firebase::auth::kAuthErrorWeakPassword);
GM_FB_PIN_ENUM(FirebaseAuthError::NoSignedInUser, firebase::auth::kAuthErrorNoSignedInUser);
GM_FB_PIN_ENUM(FirebaseAuthError::ApiNotAvailable, firebase::auth::kAuthErrorApiNotAvailable);
GM_FB_PIN_ENUM(FirebaseAuthError::ExpiredActionCode, firebase::auth::kAuthErrorExpiredActionCode);
GM_FB_PIN_ENUM(FirebaseAuthError::InvalidActionCode, firebase::auth::kAuthErrorInvalidActionCode);
GM_FB_PIN_ENUM(FirebaseAuthError::InvalidMessagePayload, firebase::auth::kAuthErrorInvalidMessagePayload);
GM_FB_PIN_ENUM(FirebaseAuthError::InvalidPhoneNumber, firebase::auth::kAuthErrorInvalidPhoneNumber);
GM_FB_PIN_ENUM(FirebaseAuthError::MissingPhoneNumber, firebase::auth::kAuthErrorMissingPhoneNumber);
GM_FB_PIN_ENUM(FirebaseAuthError::InvalidRecipientEmail, firebase::auth::kAuthErrorInvalidRecipientEmail);
GM_FB_PIN_ENUM(FirebaseAuthError::InvalidSender, firebase::auth::kAuthErrorInvalidSender);
GM_FB_PIN_ENUM(FirebaseAuthError::InvalidVerificationCode, firebase::auth::kAuthErrorInvalidVerificationCode);
GM_FB_PIN_ENUM(FirebaseAuthError::InvalidVerificationId, firebase::auth::kAuthErrorInvalidVerificationId);
GM_FB_PIN_ENUM(FirebaseAuthError::MissingVerificationCode, firebase::auth::kAuthErrorMissingVerificationCode);
GM_FB_PIN_ENUM(FirebaseAuthError::MissingVerificationId, firebase::auth::kAuthErrorMissingVerificationId);
GM_FB_PIN_ENUM(FirebaseAuthError::MissingEmail, firebase::auth::kAuthErrorMissingEmail);
GM_FB_PIN_ENUM(FirebaseAuthError::MissingPassword, firebase::auth::kAuthErrorMissingPassword);
GM_FB_PIN_ENUM(FirebaseAuthError::QuotaExceeded, firebase::auth::kAuthErrorQuotaExceeded);
GM_FB_PIN_ENUM(FirebaseAuthError::RetryPhoneAuth, firebase::auth::kAuthErrorRetryPhoneAuth);
GM_FB_PIN_ENUM(FirebaseAuthError::SessionExpired, firebase::auth::kAuthErrorSessionExpired);
GM_FB_PIN_ENUM(FirebaseAuthError::AppNotVerified, firebase::auth::kAuthErrorAppNotVerified);
GM_FB_PIN_ENUM(FirebaseAuthError::AppVerificationFailed, firebase::auth::kAuthErrorAppVerificationFailed);
GM_FB_PIN_ENUM(FirebaseAuthError::CaptchaCheckFailed, firebase::auth::kAuthErrorCaptchaCheckFailed);
GM_FB_PIN_ENUM(FirebaseAuthError::InvalidAppCredential, firebase::auth::kAuthErrorInvalidAppCredential);
GM_FB_PIN_ENUM(FirebaseAuthError::MissingAppCredential, firebase::auth::kAuthErrorMissingAppCredential);
GM_FB_PIN_ENUM(FirebaseAuthError::InvalidClientId, firebase::auth::kAuthErrorInvalidClientId);
GM_FB_PIN_ENUM(FirebaseAuthError::InvalidContinueUri, firebase::auth::kAuthErrorInvalidContinueUri);
GM_FB_PIN_ENUM(FirebaseAuthError::MissingContinueUri, firebase::auth::kAuthErrorMissingContinueUri);
GM_FB_PIN_ENUM(FirebaseAuthError::KeychainError, firebase::auth::kAuthErrorKeychainError);
GM_FB_PIN_ENUM(FirebaseAuthError::MissingAppToken, firebase::auth::kAuthErrorMissingAppToken);
GM_FB_PIN_ENUM(FirebaseAuthError::MissingIosBundleId, firebase::auth::kAuthErrorMissingIosBundleId);
GM_FB_PIN_ENUM(FirebaseAuthError::NotificationNotForwarded, firebase::auth::kAuthErrorNotificationNotForwarded);
GM_FB_PIN_ENUM(FirebaseAuthError::UnauthorizedDomain, firebase::auth::kAuthErrorUnauthorizedDomain);
GM_FB_PIN_ENUM(FirebaseAuthError::WebContextAlreadyPresented, firebase::auth::kAuthErrorWebContextAlreadyPresented);
GM_FB_PIN_ENUM(FirebaseAuthError::WebContextCancelled, firebase::auth::kAuthErrorWebContextCancelled);
GM_FB_PIN_ENUM(FirebaseAuthError::DynamicLinkNotActivated, firebase::auth::kAuthErrorDynamicLinkNotActivated);
GM_FB_PIN_ENUM(FirebaseAuthError::Cancelled, firebase::auth::kAuthErrorCancelled);
GM_FB_PIN_ENUM(FirebaseAuthError::InvalidProviderId, firebase::auth::kAuthErrorInvalidProviderId);
GM_FB_PIN_ENUM(FirebaseAuthError::WebInternalError, firebase::auth::kAuthErrorWebInternalError);
GM_FB_PIN_ENUM(FirebaseAuthError::WebStorateUnsupported, firebase::auth::kAuthErrorWebStorateUnsupported);
GM_FB_PIN_ENUM(FirebaseAuthError::TenantIdMismatch, firebase::auth::kAuthErrorTenantIdMismatch);
GM_FB_PIN_ENUM(FirebaseAuthError::UnsupportedTenantOperation, firebase::auth::kAuthErrorUnsupportedTenantOperation);
GM_FB_PIN_ENUM(FirebaseAuthError::InvalidLinkDomain, firebase::auth::kAuthErrorInvalidLinkDomain);
GM_FB_PIN_ENUM(FirebaseAuthError::RejectedCredential, firebase::auth::kAuthErrorRejectedCredential);
GM_FB_PIN_ENUM(FirebaseAuthError::PhoneNumberNotFound, firebase::auth::kAuthErrorPhoneNumberNotFound);
GM_FB_PIN_ENUM(FirebaseAuthError::InvalidTenantId, firebase::auth::kAuthErrorInvalidTenantId);
GM_FB_PIN_ENUM(FirebaseAuthError::MissingClientIdentifier, firebase::auth::kAuthErrorMissingClientIdentifier);
GM_FB_PIN_ENUM(FirebaseAuthError::MissingMultiFactorSession, firebase::auth::kAuthErrorMissingMultiFactorSession);
GM_FB_PIN_ENUM(FirebaseAuthError::MissingMultiFactorInfo, firebase::auth::kAuthErrorMissingMultiFactorInfo);
GM_FB_PIN_ENUM(FirebaseAuthError::InvalidMultiFactorSession, firebase::auth::kAuthErrorInvalidMultiFactorSession);
GM_FB_PIN_ENUM(FirebaseAuthError::MultiFactorInfoNotFound, firebase::auth::kAuthErrorMultiFactorInfoNotFound);
GM_FB_PIN_ENUM(FirebaseAuthError::AdminRestrictedOperation, firebase::auth::kAuthErrorAdminRestrictedOperation);
GM_FB_PIN_ENUM(FirebaseAuthError::UnverifiedEmail, firebase::auth::kAuthErrorUnverifiedEmail);
GM_FB_PIN_ENUM(FirebaseAuthError::SecondFactorAlreadyEnrolled, firebase::auth::kAuthErrorSecondFactorAlreadyEnrolled);
GM_FB_PIN_ENUM(FirebaseAuthError::MaximumSecondFactorCountExceeded, firebase::auth::kAuthErrorMaximumSecondFactorCountExceeded);
GM_FB_PIN_ENUM(FirebaseAuthError::UnsupportedFirstFactor, firebase::auth::kAuthErrorUnsupportedFirstFactor);
GM_FB_PIN_ENUM(FirebaseAuthError::EmailChangeNeedsVerification, firebase::auth::kAuthErrorEmailChangeNeedsVerification);

// ============================================================
// Auth singleton
// ============================================================

static firebase::auth::Auth* g_firebase_auth = nullptr;

firebase::auth::Auth* getFirebaseAuth()
{
	if (g_firebase_auth != nullptr)
		return g_firebase_auth;

	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase::App is not initialized");
		return nullptr;
	}

	firebase::InitResult init_result = firebase::kInitResultSuccess;
	g_firebase_auth = firebase::auth::Auth::GetAuth(app, &init_result);

	if (g_firebase_auth == nullptr || init_result != firebase::kInitResultSuccess)
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, firebaseInitResultMessage("failed to initialize firebase::auth::Auth", init_result));

	return g_firebase_auth;
}

bool firebase_auth_get_auth()
{
	return getFirebaseAuth() != nullptr;
}

// ============================================================
// Language / emulator configuration
// ============================================================

std::string firebase_auth_language_code()
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return std::string();

	return auth->language_code();
}

void firebase_auth_set_language_code(std::string_view language_code)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return;

	std::string language_code_str(language_code);
	auth->set_language_code(language_code_str.c_str());
}

void firebase_auth_use_app_language()
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return;

	auth->UseAppLanguage();
}

void firebase_auth_use_emulator(std::string_view host, double port)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return;

	auth->UseEmulator(std::string(host), static_cast<uint32_t>(port));
}

// ============================================================
// Current user / sign-out
// ============================================================

std::optional<uint64_t> firebase_auth_current_user()
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return std::nullopt;

	uint64_t user_ref = wrapFirebaseUser(auth, auth->current_user());
	if (user_ref == 0)
		return std::nullopt;

	return user_ref;
}

void firebase_auth_sign_out()
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return;

	auth->SignOut();
}

// ============================================================
// Provider discovery
// ============================================================

FirebaseError firebase_auth_fetch_providers_for_email(std::string_view email, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return FirebaseError::NotInitialized;

	std::string email_str(email);
	auth->FetchProvidersForEmail(email_str.c_str()).OnCompletion(
		[callback](const firebase::Future<firebase::auth::Auth::FetchProvidersResult>& f)
		{
			completeFuture(callback, f, [](const firebase::auth::Auth::FetchProvidersResult& result) { return result.providers; });
		});
	return FirebaseError::Ok;
}

// ============================================================
// Sign-in / sign-up
// ============================================================

FirebaseError firebase_auth_sign_in_with_custom_token(std::string_view custom_token, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return FirebaseError::NotInitialized;

	std::string token_str(custom_token);
	auth->SignInWithCustomToken(token_str.c_str()).OnCompletion(
		[callback, auth](const firebase::Future<firebase::auth::AuthResult>& f)
		{
			completeFuture(callback, f, [auth](const firebase::auth::AuthResult& result) -> std::optional<uint64_t>
			{
				return wrapFirebaseUser(auth, result.user);
			});
		});
	return FirebaseError::Ok;
}

FirebaseError firebase_auth_sign_in_with_credential(uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return FirebaseError::NotInitialized;

	firebase::auth::Credential credential;
	if (!resolveFirebaseAuthCredential(credential_ref, credential))
		return FirebaseError::InvalidHandle;

	auth->SignInWithCredential(credential).OnCompletion(
		[callback, auth](const firebase::Future<firebase::auth::User>& f)
		{
			completeFuture(callback, f, [auth](const firebase::auth::User& user) -> std::optional<uint64_t>
			{
				return wrapFirebaseUser(auth, user);
			});
		});
	return FirebaseError::Ok;
}

FirebaseError firebase_auth_sign_in_and_retrieve_data_with_credential(uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return FirebaseError::NotInitialized;

	firebase::auth::Credential credential;
	if (!resolveFirebaseAuthCredential(credential_ref, credential))
		return FirebaseError::InvalidHandle;

	auth->SignInAndRetrieveDataWithCredential(credential).OnCompletion(
		[callback, auth](const firebase::Future<firebase::auth::AuthResult>& f)
		{
			completeFuture(callback, f, [auth](const firebase::auth::AuthResult& result) -> std::optional<uint64_t>
			{
				return wrapFirebaseUser(auth, result.user);
			});
		});
	return FirebaseError::Ok;
}

FirebaseError firebase_auth_sign_in_anonymously(const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return FirebaseError::NotInitialized;

	auth->SignInAnonymously().OnCompletion(
		[callback, auth](const firebase::Future<firebase::auth::AuthResult>& f)
		{
			completeFuture(callback, f, [auth](const firebase::auth::AuthResult& result) -> std::optional<uint64_t>
			{
				return wrapFirebaseUser(auth, result.user);
			});
		});
	return FirebaseError::Ok;
}

FirebaseError firebase_auth_sign_in_with_email_and_password(std::string_view email, std::string_view password, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return FirebaseError::NotInitialized;

	std::string email_str(email);
	std::string password_str(password);
	auth->SignInWithEmailAndPassword(email_str.c_str(), password_str.c_str()).OnCompletion(
		[callback, auth](const firebase::Future<firebase::auth::AuthResult>& f)
		{
			completeFuture(callback, f, [auth](const firebase::auth::AuthResult& result) -> std::optional<uint64_t>
			{
				return wrapFirebaseUser(auth, result.user);
			});
		});
	return FirebaseError::Ok;
}

FirebaseError firebase_auth_create_user_with_email_and_password(std::string_view email, std::string_view password, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return FirebaseError::NotInitialized;

	std::string email_str(email);
	std::string password_str(password);
	auth->CreateUserWithEmailAndPassword(email_str.c_str(), password_str.c_str()).OnCompletion(
		[callback, auth](const firebase::Future<firebase::auth::AuthResult>& f)
		{
			completeFuture(callback, f, [auth](const firebase::auth::AuthResult& result) -> std::optional<uint64_t>
			{
				return wrapFirebaseUser(auth, result.user);
			});
		});
	return FirebaseError::Ok;
}

// ============================================================
// Password reset
// ============================================================

FirebaseError firebase_auth_send_password_reset_email(std::string_view email, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return FirebaseError::NotInitialized;

	std::string email_str(email);
	auth->SendPasswordResetEmail(email_str.c_str()).OnCompletion(
		[callback](const firebase::Future<void>& f)
		{
			completeFuture(callback, f);
		});
	return FirebaseError::Ok;
}

// ============================================================
// AuthStateListener / IdTokenListener
// ============================================================
// Each listener is a small heap-allocated subclass that owns its own
// gm::wire::GMFunction. GML receives a packed registry id, never the native
// address. The remove function resolves that id, unregisters the listener from
// Auth and from GMFirebase's pointer registry, then deletes it.

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
				uint64_t ref = wrapFirebaseUser(auth, auth->current_user());
				if (ref != 0)
					user_ref = ref;
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
				uint64_t ref = wrapFirebaseUser(auth, auth->current_user());
				if (ref != 0)
					user_ref = ref;
			}

			callback_.call(user_ref);
		}

	private:
		gm::wire::GMFunction callback_;
	};
}

std::optional<uint64_t> firebase_auth_add_state_listener(const gm::wire::GMFunction& callback)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return std::nullopt;

	GmAuthStateListener* listener = new GmAuthStateListener(callback);
	auth->AddAuthStateListener(listener);

	return registerFirebasePointer(listener, GM_FB_TYPE_AUTH_STATE_LISTENER);
}

void firebase_auth_remove_state_listener(uint64_t listener_ref)
{
	GmAuthStateListener* listener = nullptr;
	validate_fb_ref_ptr(listener_ref, GM_FB_TYPE_AUTH_STATE_LISTENER, GmAuthStateListener, listener);
	if (listener == nullptr)
		return;

	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth != nullptr)
		auth->RemoveAuthStateListener(listener);

	listener = static_cast<GmAuthStateListener*>(unregisterFirebasePointer(listener_ref, GM_FB_TYPE_AUTH_STATE_LISTENER));
	delete listener;
}

std::optional<uint64_t> firebase_auth_add_id_token_listener(const gm::wire::GMFunction& callback)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return std::nullopt;

	GmIdTokenListener* listener = new GmIdTokenListener(callback);
	auth->AddIdTokenListener(listener);

	return registerFirebasePointer(listener, GM_FB_TYPE_AUTH_ID_TOKEN_LISTENER);
}

void firebase_auth_remove_id_token_listener(uint64_t listener_ref)
{
	GmIdTokenListener* listener = nullptr;
	validate_fb_ref_ptr(listener_ref, GM_FB_TYPE_AUTH_ID_TOKEN_LISTENER, GmIdTokenListener, listener);
	if (listener == nullptr)
		return;

	firebase::auth::Auth* auth = getFirebaseAuth();
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
        const std::vector<std::string_view>& scopes,
        const gm::wire::GMValue& custom_parameters)
    {
        firebase::auth::FederatedOAuthProviderData data{std::string(provider_id)};
        data.scopes.reserve(scopes.size());
        for (std::string_view scope : scopes)
            data.scopes.emplace_back(scope);
        if (custom_parameters.is<gm::wire::GMObjectView>())
        {
            auto o = custom_parameters.as<gm::wire::GMObjectView>();
            for (const auto& pair : o)
                if (pair.second.is<std::string_view>())
                    data.custom_parameters.emplace(std::string(pair.first), std::string(pair.second.as<std::string_view>()));
        }
        return data;
    }

    // The result user is wrapped on the Auth the sign-in ran on.
    void completeAuthResultFuture(firebase::auth::Auth* auth, const firebase::Future<firebase::auth::AuthResult>& f,
        const std::optional<gm::wire::GMFunction>& callback)
    {
        completeFuture(callback, f, [auth](const firebase::auth::AuthResult& result) -> std::optional<gm_structs::FirebaseAuthResult>
        {
            return makeFirebaseAuthResult(wrapFirebaseUser(auth, result.user), result);
        });
    }
}

firebase::auth::FederatedOAuthProvider* resolveFederatedProvider(uint64_t provider_ref)
{
    firebase::auth::FederatedOAuthProvider* provider = nullptr;
    validate_fb_ref_ptr(provider_ref, GM_FB_TYPE_AUTH_FEDERATED_PROVIDER, firebase::auth::FederatedOAuthProvider, provider);
    return provider;
}

gm_structs::FirebaseAuthResult makeFirebaseAuthResult(uint64_t user_ref, const firebase::auth::AuthResult& result)
{
    gm_structs::FirebaseAuthResult out;
    if (result.user.is_valid())
        out.user = user_ref;
    if (result.credential.is_valid())
        out.credential = wrapFirebaseAuthCredential(result.credential);

    gm_structs::FirebaseAuthAdditionalUserInfo& info = out.additional_user_info;
    info.provider_id = result.additional_user_info.provider_id;
    info.user_name = result.additional_user_info.user_name;
    if (result.additional_user_info.updated_credential.is_valid())
        info.updated_credential = wrapFirebaseAuthCredential(result.additional_user_info.updated_credential);

    // The profile map has provider-defined keys, so it stays a dynamic struct.
    // A gmval field carries exactly one encoded value, hence the single <<.
    gm::wire::StructStream profile;
    for (const auto& kv : result.additional_user_info.profile)
    {
        const firebase::Variant& key = kv.first;
        if (key.type() == firebase::Variant::kTypeStaticString || key.type() == firebase::Variant::kTypeMutableString)
            addVariantToStruct(key.string_value(), kv.second, profile);
    }
    info.profile << profile;
    return out;
}

uint64_t firebase_auth_federated_oauth_provider_create(std::string_view provider_id,
    const std::vector<std::string_view>& scopes, const gm::wire::GMValue& custom_parameters)
{
    auto data = gmToFederatedProviderData(provider_id, scopes, custom_parameters);
    auto* provider = new firebase::auth::FederatedOAuthProvider(data);
    return registerFirebasePointer(provider, GM_FB_TYPE_AUTH_FEDERATED_PROVIDER);
}

void firebase_auth_federated_oauth_provider_set_data(uint64_t provider_ref, std::string_view provider_id,
    const std::vector<std::string_view>& scopes, const gm::wire::GMValue& custom_parameters)
{
    auto* provider = resolveFederatedProvider(provider_ref);
    if (!provider) return;
    provider->SetProviderData(gmToFederatedProviderData(provider_id, scopes, custom_parameters));
}

void firebase_auth_federated_oauth_provider_release(uint64_t provider_ref)
{
    auto* provider = static_cast<firebase::auth::FederatedOAuthProvider*>(
        unregisterFirebasePointer(provider_ref, GM_FB_TYPE_AUTH_FEDERATED_PROVIDER));
    delete provider;
}

FirebaseError firebase_auth_sign_in_with_provider(uint64_t provider_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    auto* auth = getFirebaseAuth();
    if (!auth) return FirebaseError::NotInitialized;
    auto* provider = resolveFederatedProvider(provider_ref);
    if (!provider) return FirebaseError::InvalidHandle;
    auth->SignInWithProvider(provider).OnCompletion([callback, auth](const firebase::Future<firebase::auth::AuthResult>& f)
    {
        completeAuthResultFuture(auth, f, callback);
    });
    return FirebaseError::Ok;
}

FirebaseError firebase_auth_sign_in_with_custom_token_result(std::string_view custom_token, const std::optional<gm::wire::GMFunction>& callback)
{
    auto* auth = getFirebaseAuth();
    if (!auth) return FirebaseError::NotInitialized;
    std::string token(custom_token);
    auth->SignInWithCustomToken(token.c_str()).OnCompletion([callback, auth](const firebase::Future<firebase::auth::AuthResult>& f)
    {
        completeAuthResultFuture(auth, f, callback);
    });
    return FirebaseError::Ok;
}

FirebaseError firebase_auth_sign_in_and_retrieve_data_with_credential_result(uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    auto* auth = getFirebaseAuth();
    if (!auth) return FirebaseError::NotInitialized;
    firebase::auth::Credential credential;
    if (!resolveFirebaseAuthCredential(credential_ref, credential)) return FirebaseError::InvalidHandle;
    auth->SignInAndRetrieveDataWithCredential(credential).OnCompletion([callback, auth](const firebase::Future<firebase::auth::AuthResult>& f)
    {
        completeAuthResultFuture(auth, f, callback);
    });
    return FirebaseError::Ok;
}

FirebaseError firebase_auth_sign_in_anonymously_result(const std::optional<gm::wire::GMFunction>& callback)
{
    auto* auth = getFirebaseAuth();
    if (!auth) return FirebaseError::NotInitialized;
    auth->SignInAnonymously().OnCompletion([callback, auth](const firebase::Future<firebase::auth::AuthResult>& f)
    {
        completeAuthResultFuture(auth, f, callback);
    });
    return FirebaseError::Ok;
}

FirebaseError firebase_auth_sign_in_with_email_and_password_result(std::string_view email, std::string_view password,
    const std::optional<gm::wire::GMFunction>& callback)
{
    auto* auth = getFirebaseAuth();
    if (!auth) return FirebaseError::NotInitialized;
    std::string e(email), p(password);
    auth->SignInWithEmailAndPassword(e.c_str(), p.c_str()).OnCompletion([callback, auth](const firebase::Future<firebase::auth::AuthResult>& f)
    {
        completeAuthResultFuture(auth, f, callback);
    });
    return FirebaseError::Ok;
}

FirebaseError firebase_auth_create_user_with_email_and_password_result(std::string_view email, std::string_view password,
    const std::optional<gm::wire::GMFunction>& callback)
{
    auto* auth = getFirebaseAuth();
    if (!auth) return FirebaseError::NotInitialized;
    std::string e(email), p(password);
    auth->CreateUserWithEmailAndPassword(e.c_str(), p.c_str()).OnCompletion([callback, auth](const firebase::Future<firebase::auth::AuthResult>& f)
    {
        completeAuthResultFuture(auth, f, callback);
    });
    return FirebaseError::Ok;
}

uint64_t firebase_auth_get_app()
{
    auto* auth = getFirebaseAuth();
    return auth ? wrapFirebaseApp(&auth->app()) : 0;
}

uint64_t firebase_auth_get_current_instance_handle()
{
    return getFirebaseAuth() ? registerFirebasePointer(getFirebaseAuth(), GM_FB_TYPE_AUTH) : 0;
}

uint64_t firebase_auth_get_instance_for_app(uint64_t app_ref)
{
    auto* app = resolveFirebaseApp(app_ref); if (!app) return 0;
    firebase::InitResult init_result = firebase::kInitResultSuccess;
    auto* auth = firebase::auth::Auth::GetAuth(app, &init_result);
    if (!auth || init_result != firebase::kInitResultSuccess)
    {
        setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, firebaseInitResultMessage("Auth::GetAuth(app) failed", init_result)); return 0;
    }
    return registerFirebasePointer(auth, GM_FB_TYPE_AUTH);
}

bool firebase_auth_use_instance(uint64_t auth_ref)
{
    auto* auth = static_cast<firebase::auth::Auth*>(resolveFirebasePointer(auth_ref, GM_FB_TYPE_AUTH));
    if (!auth) return false;
    g_firebase_auth = auth;
    return true;
}

uint64_t firebase_auth_instance_get_app(uint64_t auth_ref)
{
    auto* auth = static_cast<firebase::auth::Auth*>(resolveFirebasePointer(auth_ref, GM_FB_TYPE_AUTH));
    return auth ? wrapFirebaseApp(&auth->app()) : 0;
}
