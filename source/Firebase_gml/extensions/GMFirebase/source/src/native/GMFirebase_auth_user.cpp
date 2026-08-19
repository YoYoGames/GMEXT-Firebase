// Firebase Auth - User wrapper functions.
//
// firebase::auth::User is a pimpl-style value type: Auth::current_user(),
// every Future<AuthResult>::result()->user, and Future<User>::result() all
// hand it back BY VALUE, never as a User*. There is no SDK-owned User* to
// reuse as a native identity. wrapFirebaseUser() heap-allocates a private copy
// and registers it under a 32-bit id; only the packed id crosses into GML.
// firebase_auth_user_release() is how GML frees that copy once it is done
// with it. This does NOT touch any SDK-internal session state - User's copy
// ctor/dtor only manage the lightweight pimpl handle, so deleting our copy
// never signs anyone out or invalidates the underlying AuthData Auth itself
// still owns.
#include "GMFirebase_common.h"
#include "firebase/auth.h"

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

uint64_t wrapFirebaseUser(const firebase::auth::User& user)
{
	firebase::auth::User* copy = new firebase::auth::User(user);
	return registerFirebasePointer(copy, GM_FB_TYPE_AUTH_USER);
}

void firebase_auth_user_release(uint64_t user_ref)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return;

	user = static_cast<firebase::auth::User*>(unregisterFirebasePointer(user_ref, GM_FB_TYPE_AUTH_USER));
	delete user;
}

// ============================================================
// Basic properties
// ============================================================

gm_structs::FirebaseAuthUserInfo firebase_auth_user_get_info(uint64_t user_ref)
{
	gm_structs::FirebaseAuthUserInfo out{};
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return out;

	out.uid = user->uid();
	out.email = user->email();
	out.display_name = user->display_name();
	out.photo_url = user->photo_url();
	out.provider_id = user->provider_id();
	out.phone_number = user->phone_number();
	out.is_email_verified = user->is_email_verified();
	out.is_anonymous = user->is_anonymous();
	out.is_valid = user->is_valid();
	out.creation_timestamp = static_cast<double>(user->metadata().creation_timestamp);
	out.last_sign_in_timestamp = static_cast<double>(user->metadata().last_sign_in_timestamp);
	return out;
}

bool firebase_auth_user_is_valid(uint64_t user_ref)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return false;

	return user->is_valid();
}

std::string firebase_auth_user_uid(uint64_t user_ref)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return std::string();

	return user->uid();
}

std::string firebase_auth_user_email(uint64_t user_ref)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return std::string();

	return user->email();
}

std::string firebase_auth_user_display_name(uint64_t user_ref)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return std::string();

	return user->display_name();
}

std::string firebase_auth_user_photo_url(uint64_t user_ref)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return std::string();

	return user->photo_url();
}

std::string firebase_auth_user_provider_id(uint64_t user_ref)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return std::string();

	return user->provider_id();
}

std::string firebase_auth_user_phone_number(uint64_t user_ref)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return std::string();

	return user->phone_number();
}

bool firebase_auth_user_is_email_verified(uint64_t user_ref)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return false;

	return user->is_email_verified();
}

bool firebase_auth_user_is_anonymous(uint64_t user_ref)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return false;

	return user->is_anonymous();
}

double firebase_auth_user_creation_timestamp(uint64_t user_ref)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return 0.0;

	// GML has no uint64 - every Firebase numeric value crosses the wire as a
	// double, same convention as everywhere else in this extension. A UTC
	// milliseconds timestamp comfortably fits a double's 53 mantissa bits
	// until the year ~287396.
	return static_cast<double>(user->metadata().creation_timestamp);
}

double firebase_auth_user_last_sign_in_timestamp(uint64_t user_ref)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return 0.0;

	return static_cast<double>(user->metadata().last_sign_in_timestamp);
}

// ============================================================
// Token
// ============================================================

void firebase_auth_user_get_token(uint64_t user_ref, bool force_refresh, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
	{
		if (callback)
			callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()), std::string());
		return;
	}

	user->GetToken(force_refresh).OnCompletion(
		[callback](const firebase::Future<std::string>& f)
		{
			int code = f.error();
			const char* message = f.error_message();
			setFirebaseLastError(code, message != nullptr ? message : "");

			if (!callback)
				return;

			std::string token = (code == firebase::auth::kAuthErrorNone && f.result() != nullptr) ? *f.result() : std::string();
			callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""), token);
		});
}

// ============================================================
// Profile mutation
// ============================================================

void firebase_auth_user_update_password(uint64_t user_ref, std::string_view password, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
	{
		if (callback)
			callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()));
		return;
	}

	std::string password_str(password);
	user->UpdatePassword(password_str.c_str()).OnCompletion(
		[callback](const firebase::Future<void>& f)
		{
			int code = f.error();
			const char* message = f.error_message();
			setFirebaseLastError(code, message != nullptr ? message : "");

			if (callback)
				callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""));
		});
}

// Note: UserProfile::display_name/photo_url are `const char*` where the SDK
// treats nullptr as "leave unchanged" and "" as "clear this field". GML has
// no null string, so an empty incoming string here is forwarded as "" (clear
// the field) rather than "leave unchanged" - callers that only want to touch
// one field should re-supply the other field's current value (as returned by
// firebase_auth_user_display_name()/firebase_auth_user_photo_url()).
void firebase_auth_user_update_profile(uint64_t user_ref, std::string_view display_name, std::string_view photo_url, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
	{
		if (callback)
			callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()));
		return;
	}

	std::string display_name_str(display_name);
	std::string photo_url_str(photo_url);

	firebase::auth::User::UserProfile profile;
	profile.display_name = display_name_str.c_str();
	profile.photo_url = photo_url_str.c_str();

	user->UpdateUserProfile(profile).OnCompletion(
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
// Email verification
// ============================================================

void firebase_auth_user_send_email_verification(uint64_t user_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
	{
		if (callback)
			callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()));
		return;
	}

	user->SendEmailVerification().OnCompletion(
		[callback](const firebase::Future<void>& f)
		{
			int code = f.error();
			const char* message = f.error_message();
			setFirebaseLastError(code, message != nullptr ? message : "");

			if (callback)
				callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""));
		});
}

void firebase_auth_user_send_email_verification_before_updating_email(uint64_t user_ref, std::string_view new_email, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
	{
		if (callback)
			callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()));
		return;
	}

	std::string new_email_str(new_email);
	user->SendEmailVerificationBeforeUpdatingEmail(new_email_str.c_str()).OnCompletion(
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
// Reauthenticate / link / unlink
// ============================================================

void firebase_auth_user_reauthenticate(uint64_t user_ref, uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	firebase::auth::Credential credential;
	bool credential_ok = resolveFirebaseAuthCredential(credential_ref, credential);

	if (user == nullptr || !credential_ok)
	{
		if (callback)
			callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()));
		return;
	}

	user->Reauthenticate(credential).OnCompletion(
		[callback](const firebase::Future<void>& f)
		{
			int code = f.error();
			const char* message = f.error_message();
			setFirebaseLastError(code, message != nullptr ? message : "");

			if (callback)
				callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""));
		});
}

void firebase_auth_user_reauthenticate_and_retrieve_data(uint64_t user_ref, uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	firebase::auth::Credential credential;
	bool credential_ok = resolveFirebaseAuthCredential(credential_ref, credential);

	if (user == nullptr || !credential_ok)
	{
		if (callback)
			callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()), std::optional<uint64_t>{});
		return;
	}

	user->ReauthenticateAndRetrieveData(credential).OnCompletion(
		[callback](const firebase::Future<firebase::auth::AuthResult>& f)
		{
			int code = f.error();
			const char* message = f.error_message();
			setFirebaseLastError(code, message != nullptr ? message : "");

			if (!callback)
				return;

			std::optional<uint64_t> user_ref_out;
			if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
				user_ref_out = wrapFirebaseUser(f.result()->user);

			callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""), user_ref_out);
		});
}

void firebase_auth_user_link_with_credential(uint64_t user_ref, uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	firebase::auth::Credential credential;
	bool credential_ok = resolveFirebaseAuthCredential(credential_ref, credential);

	if (user == nullptr || !credential_ok)
	{
		if (callback)
			callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()), std::optional<uint64_t>{});
		return;
	}

	user->LinkWithCredential(credential).OnCompletion(
		[callback](const firebase::Future<firebase::auth::AuthResult>& f)
		{
			int code = f.error();
			const char* message = f.error_message();
			setFirebaseLastError(code, message != nullptr ? message : "");

			if (!callback)
				return;

			std::optional<uint64_t> user_ref_out;
			if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
				user_ref_out = wrapFirebaseUser(f.result()->user);

			callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""), user_ref_out);
		});
}

void firebase_auth_user_unlink(uint64_t user_ref, std::string_view provider_id, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
	{
		if (callback)
			callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()), std::optional<uint64_t>{});
		return;
	}

	std::string provider_id_str(provider_id);
	user->Unlink(provider_id_str.c_str()).OnCompletion(
		[callback](const firebase::Future<firebase::auth::AuthResult>& f)
		{
			int code = f.error();
			const char* message = f.error_message();
			setFirebaseLastError(code, message != nullptr ? message : "");

			if (!callback)
				return;

			std::optional<uint64_t> user_ref_out;
			if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
				user_ref_out = wrapFirebaseUser(f.result()->user);

			callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""), user_ref_out);
		});
}

// ============================================================
// Reload / delete
// ============================================================

void firebase_auth_user_reload(uint64_t user_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
	{
		if (callback)
			callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()));
		return;
	}

	user->Reload().OnCompletion(
		[callback](const firebase::Future<void>& f)
		{
			int code = f.error();
			const char* message = f.error_message();
			setFirebaseLastError(code, message != nullptr ? message : "");

			if (callback)
				callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""));
		});
}

void firebase_auth_user_delete(uint64_t user_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
	{
		if (callback)
			callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()));
		return;
	}

	user->Delete().OnCompletion(
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
// Provider data / federated provider / phone-number operations
// ============================================================

double firebase_auth_user_provider_data_count(uint64_t user_ref)
{
    firebase::auth::User* user = nullptr;
    validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
    return user ? static_cast<double>(user->provider_data().size()) : 0.0;
}

gm::wire::DataStream firebase_auth_user_provider_data_at(uint64_t user_ref, double index)
{
    gm::wire::StructStream info;
    firebase::auth::User* user = nullptr;
    validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
    if (user != nullptr)
    {
        auto providers = user->provider_data();
        size_t i = index < 0.0 ? providers.size() : static_cast<size_t>(index);
        if (i < providers.size())
        {
            const auto& p = providers[i];
            info.add("uid", std::string_view{ p.uid() });
            info.add("email", std::string_view{ p.email() });
            info.add("display_name", std::string_view{ p.display_name() });
            info.add("photo_url", std::string_view{ p.photo_url() });
            info.add("provider_id", std::string_view{ p.provider_id() });
            info.add("phone_number", std::string_view{ p.phone_number() });
        }
    }
    gm::wire::DataStream out;
    out << info;
    return out;
}

namespace
{
    firebase::auth::FederatedOAuthProvider* resolveUserFederatedProvider(uint64_t provider_ref)
    {
        firebase::auth::FederatedOAuthProvider* provider = nullptr;
        validate_fb_ref_ptr(provider_ref, GM_FB_TYPE_AUTH_FEDERATED_PROVIDER, firebase::auth::FederatedOAuthProvider, provider);
        return provider;
    }

    void completeUserAuthResult(const firebase::Future<firebase::auth::AuthResult>& f,
        const std::optional<gm::wire::GMFunction>& callback)
    {
        const int code = f.error();
        const char* message = f.error_message();
        setFirebaseLastError(code, message ? message : "");
        if (!callback) return;
        if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
            callback->call(static_cast<double>(code), std::string_view{ message ? message : "" }, makeFirebaseAuthResultStruct(*f.result()));
        else
            callback->call(static_cast<double>(code), std::string_view{ message ? message : "" }, std::optional<std::uint8_t>{});
    }
}

void firebase_auth_user_reauthenticate_with_provider(uint64_t user_ref, uint64_t provider_ref,
    const std::optional<gm::wire::GMFunction>& callback)
{
    firebase::auth::User* user = nullptr;
    validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
    auto* provider = resolveUserFederatedProvider(provider_ref);
    if (!user || !provider) return;
    user->ReauthenticateWithProvider(provider).OnCompletion([callback](const firebase::Future<firebase::auth::AuthResult>& f)
    {
        completeUserAuthResult(f, callback);
    });
}

void firebase_auth_user_link_with_provider(uint64_t user_ref, uint64_t provider_ref,
    const std::optional<gm::wire::GMFunction>& callback)
{
    firebase::auth::User* user = nullptr;
    validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
    auto* provider = resolveUserFederatedProvider(provider_ref);
    if (!user || !provider) return;
    user->LinkWithProvider(provider).OnCompletion([callback](const firebase::Future<firebase::auth::AuthResult>& f)
    {
        completeUserAuthResult(f, callback);
    });
}

void firebase_auth_user_reauthenticate_and_retrieve_data_result(uint64_t user_ref, uint64_t credential_ref,
    const std::optional<gm::wire::GMFunction>& callback)
{
    firebase::auth::User* user = nullptr;
    validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
    firebase::auth::Credential credential;
    if (!user || !resolveFirebaseAuthCredential(credential_ref, credential)) return;
    user->ReauthenticateAndRetrieveData(credential).OnCompletion([callback](const firebase::Future<firebase::auth::AuthResult>& f)
    {
        completeUserAuthResult(f, callback);
    });
}

void firebase_auth_user_link_with_credential_result(uint64_t user_ref, uint64_t credential_ref,
    const std::optional<gm::wire::GMFunction>& callback)
{
    firebase::auth::User* user = nullptr;
    validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
    firebase::auth::Credential credential;
    if (!user || !resolveFirebaseAuthCredential(credential_ref, credential)) return;
    user->LinkWithCredential(credential).OnCompletion([callback](const firebase::Future<firebase::auth::AuthResult>& f)
    {
        completeUserAuthResult(f, callback);
    });
}

void firebase_auth_user_update_phone_number_credential(uint64_t user_ref, uint64_t phone_credential_ref,
    const std::optional<gm::wire::GMFunction>& callback)
{
    firebase::auth::User* user = nullptr;
    validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
    firebase::auth::PhoneAuthCredential credential;
    if (!user || !firebase_auth_resolve_phone_credential(phone_credential_ref, credential)) return;
    user->UpdatePhoneNumberCredential(credential).OnCompletion([callback](const firebase::Future<firebase::auth::User>& f)
    {
        const int code = f.error();
        const char* message = f.error_message();
        setFirebaseLastError(code, message ? message : "");
        if (!callback) return;
        std::optional<uint64_t> out;
        if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
            out = wrapFirebaseUser(*f.result());
        callback->call(static_cast<double>(code), std::string_view{ message ? message : "" }, out);
    });
}
