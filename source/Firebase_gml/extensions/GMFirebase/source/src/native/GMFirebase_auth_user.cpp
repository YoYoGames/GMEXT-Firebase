// Firebase Auth - User wrapper functions.
//
// firebase::auth::User is a view, not a value: its only member is the
// AuthData* of the Auth instance it came from, the copy constructor copies
// that pointer, and every accessor reads the instance's single current user
// through it (user_desktop.cc, user_android.cc, user_ios.mm all agree, and
// User::operator== compares nothing but is_valid()). So every User an Auth
// hands out - Auth::current_user(), AuthResult::user, Future<User> - is the
// same view, and a per-handle copy would only pretend otherwise. The
// extension keeps one heap User per Auth instance and returns the same packed
// id for every wrap of a valid user from that Auth. A user ref therefore
// reports whoever is signed in now, is_valid() is false while nobody is, and
// firebase_auth_user_release() has nothing to free: the view lives as long as
// the Auth, which is never destroyed.
//
// Every asynchronous entry point returns a FirebaseError: Ok once the SDK call
// is in flight and the completion lambda owns the callback, or a failure code
// with the callback untouched. Two things fail before the SDK: a handle that
// does not resolve, and a User the SDK no longer considers signed in - for the
// latter every User method returns an invalid Future whose OnCompletion() is a
// silent no-op, which is what firebaseFutureArmed() catches.
#include "GMFirebase_common.h"
#include "firebase/auth.h"

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

namespace
{
	// One view per Auth instance. Inserts come from SDK completion threads and
	// listener callbacks as well as the GML thread, so the map takes the shared
	// value-registry lock; the User* itself is never freed, so it is safe to
	// hand out after the lock drops.
	std::map<firebase::auth::Auth*, firebase::auth::User*> g_auth_user_views;
}

uint64_t wrapFirebaseUser(firebase::auth::Auth* auth, const firebase::auth::User& user)
{
	if (auth == nullptr || !user.is_valid())
		return 0;

	firebase::auth::User* view = nullptr;
	{
		std::lock_guard<std::mutex> lock(g_firebase_value_registry_mutex);
		auto it = g_auth_user_views.find(auth);
		if (it == g_auth_user_views.end())
			it = g_auth_user_views.emplace(auth, new firebase::auth::User(user)).first;
		view = it->second;
	}

	// The pointer registry dedups by address, so this is the same id every time.
	return registerFirebasePointer(view, GM_FB_TYPE_AUTH_USER);
}

// Kept for API compatibility. The handle is the Auth instance's shared view
// and other GML holders may still be using it, so nothing is unregistered;
// resolving it still records the error for a bad ref.
void firebase_auth_user_release(uint64_t user_ref)
{
	resolveFirebasePointer(user_ref, GM_FB_TYPE_AUTH_USER);
}

// ============================================================
// Basic properties
// ============================================================

// undefined for a handle that does not resolve (InvalidHandle is already
// recorded); is_valid inside the struct is the SDK's own answer.
std::optional<gm_structs::FirebaseAuthUserInfo> firebase_auth_user_get_info(uint64_t user_ref)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return std::nullopt;

	gm_structs::FirebaseAuthUserInfo out{};
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

FirebaseError firebase_auth_user_get_token(uint64_t user_ref, bool force_refresh, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return FirebaseError::InvalidHandle;

	firebase::Future<std::string> future = user->GetToken(force_refresh);
	if (!firebaseFutureArmed(future, "firebase_auth_user_get_token")) return FirebaseError::InvalidHandle;
	future.OnCompletion(
		[callback](const firebase::Future<std::string>& f)
		{
			completeFuture(callback, f, [](const std::string& token) { return std::string_view{ token }; });
		});
	return FirebaseError::Ok;
}

// ============================================================
// Profile mutation
// ============================================================

FirebaseError firebase_auth_user_update_password(uint64_t user_ref, std::string_view password, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return FirebaseError::InvalidHandle;

	std::string password_str(password);
	firebase::Future<void> future = user->UpdatePassword(password_str.c_str());
	if (!firebaseFutureArmed(future, "firebase_auth_user_update_password")) return FirebaseError::InvalidHandle;
	future.OnCompletion(
		[callback](const firebase::Future<void>& f)
		{
			completeFuture(callback, f);
		});
	return FirebaseError::Ok;
}

// Note: UserProfile::display_name/photo_url are `const char*` where the SDK
// treats nullptr as "leave unchanged" and "" as "clear this field". GML has
// no null string, so an empty incoming string here is forwarded as "" (clear
// the field) rather than "leave unchanged" - callers that only want to touch
// one field should re-supply the other field's current value (as returned by
// firebase_auth_user_display_name()/firebase_auth_user_photo_url()).
FirebaseError firebase_auth_user_update_profile(uint64_t user_ref, std::string_view display_name, std::string_view photo_url, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return FirebaseError::InvalidHandle;

	std::string display_name_str(display_name);
	std::string photo_url_str(photo_url);

	firebase::auth::User::UserProfile profile;
	profile.display_name = display_name_str.c_str();
	profile.photo_url = photo_url_str.c_str();

	firebase::Future<void> future = user->UpdateUserProfile(profile);
	if (!firebaseFutureArmed(future, "firebase_auth_user_update_profile")) return FirebaseError::InvalidHandle;
	future.OnCompletion(
		[callback](const firebase::Future<void>& f)
		{
			completeFuture(callback, f);
		});
	return FirebaseError::Ok;
}

// ============================================================
// Email verification
// ============================================================

FirebaseError firebase_auth_user_send_email_verification(uint64_t user_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return FirebaseError::InvalidHandle;

	firebase::Future<void> future = user->SendEmailVerification();
	if (!firebaseFutureArmed(future, "firebase_auth_user_send_email_verification")) return FirebaseError::InvalidHandle;
	future.OnCompletion(
		[callback](const firebase::Future<void>& f)
		{
			completeFuture(callback, f);
		});
	return FirebaseError::Ok;
}

FirebaseError firebase_auth_user_send_email_verification_before_updating_email(uint64_t user_ref, std::string_view new_email, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return FirebaseError::InvalidHandle;

	std::string new_email_str(new_email);
	firebase::Future<void> future = user->SendEmailVerificationBeforeUpdatingEmail(new_email_str.c_str());
	if (!firebaseFutureArmed(future, "firebase_auth_user_send_email_verification_before_updating_email")) return FirebaseError::InvalidHandle;
	future.OnCompletion(
		[callback](const firebase::Future<void>& f)
		{
			completeFuture(callback, f);
		});
	return FirebaseError::Ok;
}

// ============================================================
// Reauthenticate / link / unlink
// ============================================================

FirebaseError firebase_auth_user_reauthenticate(uint64_t user_ref, uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return FirebaseError::InvalidHandle;

	firebase::auth::Credential credential;
	if (!resolveFirebaseAuthCredential(credential_ref, credential))
		return FirebaseError::InvalidHandle;

	firebase::Future<void> future = user->Reauthenticate(credential);
	if (!firebaseFutureArmed(future, "firebase_auth_user_reauthenticate")) return FirebaseError::InvalidHandle;
	future.OnCompletion(
		[callback](const firebase::Future<void>& f)
		{
			completeFuture(callback, f);
		});
	return FirebaseError::Ok;
}

FirebaseError firebase_auth_user_reauthenticate_and_retrieve_data(uint64_t user_ref, uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return FirebaseError::InvalidHandle;

	firebase::auth::Credential credential;
	if (!resolveFirebaseAuthCredential(credential_ref, credential))
		return FirebaseError::InvalidHandle;

	firebase::Future<firebase::auth::AuthResult> future = user->ReauthenticateAndRetrieveData(credential);
	if (!firebaseFutureArmed(future, "firebase_auth_user_reauthenticate_and_retrieve_data")) return FirebaseError::InvalidHandle;
	future.OnCompletion(
		[callback, user_ref](const firebase::Future<firebase::auth::AuthResult>& f)
		{
			completeFuture(callback, f, [user_ref](const firebase::auth::AuthResult&) -> std::optional<uint64_t> { return user_ref; });
		});
	return FirebaseError::Ok;
}

FirebaseError firebase_auth_user_link_with_credential(uint64_t user_ref, uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return FirebaseError::InvalidHandle;

	firebase::auth::Credential credential;
	if (!resolveFirebaseAuthCredential(credential_ref, credential))
		return FirebaseError::InvalidHandle;

	firebase::Future<firebase::auth::AuthResult> future = user->LinkWithCredential(credential);
	if (!firebaseFutureArmed(future, "firebase_auth_user_link_with_credential")) return FirebaseError::InvalidHandle;
	future.OnCompletion(
		[callback, user_ref](const firebase::Future<firebase::auth::AuthResult>& f)
		{
			completeFuture(callback, f, [user_ref](const firebase::auth::AuthResult&) -> std::optional<uint64_t> { return user_ref; });
		});
	return FirebaseError::Ok;
}

FirebaseError firebase_auth_user_unlink(uint64_t user_ref, std::string_view provider_id, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return FirebaseError::InvalidHandle;

	std::string provider_id_str(provider_id);
	firebase::Future<firebase::auth::AuthResult> future = user->Unlink(provider_id_str.c_str());
	if (!firebaseFutureArmed(future, "firebase_auth_user_unlink")) return FirebaseError::InvalidHandle;
	future.OnCompletion(
		[callback, user_ref](const firebase::Future<firebase::auth::AuthResult>& f)
		{
			completeFuture(callback, f, [user_ref](const firebase::auth::AuthResult&) -> std::optional<uint64_t> { return user_ref; });
		});
	return FirebaseError::Ok;
}

// ============================================================
// Reload / delete
// ============================================================

FirebaseError firebase_auth_user_reload(uint64_t user_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return FirebaseError::InvalidHandle;

	firebase::Future<void> future = user->Reload();
	if (!firebaseFutureArmed(future, "firebase_auth_user_reload")) return FirebaseError::InvalidHandle;
	future.OnCompletion(
		[callback](const firebase::Future<void>& f)
		{
			completeFuture(callback, f);
		});
	return FirebaseError::Ok;
}

FirebaseError firebase_auth_user_delete(uint64_t user_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::User* user = nullptr;
	validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
	if (user == nullptr)
		return FirebaseError::InvalidHandle;

	firebase::Future<void> future = user->Delete();
	if (!firebaseFutureArmed(future, "firebase_auth_user_delete")) return FirebaseError::InvalidHandle;
	future.OnCompletion(
		[callback](const firebase::Future<void>& f)
		{
			completeFuture(callback, f);
		});
	return FirebaseError::Ok;
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

std::optional<gm_structs::FirebaseAuthProviderUserInfo> firebase_auth_user_provider_data_at(uint64_t user_ref, double index)
{
    firebase::auth::User* user = nullptr;
    validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
    if (user == nullptr)
        return std::nullopt;

    auto providers = user->provider_data();
    size_t i = index < 0.0 ? providers.size() : static_cast<size_t>(index);
    if (i >= providers.size())
        return std::nullopt;

    const auto& p = providers[i];
    gm_structs::FirebaseAuthProviderUserInfo info;
    info.uid = p.uid();
    info.email = p.email();
    info.display_name = p.display_name();
    info.photo_url = p.photo_url();
    info.provider_id = p.provider_id();
    info.phone_number = p.phone_number();
    return info;
}

namespace
{
    // The result user is the same view the method ran on, so the handle the
    // caller resolved is forwarded rather than wrapped again.
    void completeUserAuthResult(uint64_t user_ref, const firebase::Future<firebase::auth::AuthResult>& f,
        const std::optional<gm::wire::GMFunction>& callback)
    {
        completeFuture(callback, f, [user_ref](const firebase::auth::AuthResult& result) -> std::optional<gm_structs::FirebaseAuthResult>
        {
            return makeFirebaseAuthResult(user_ref, result);
        });
    }
}

FirebaseError firebase_auth_user_reauthenticate_with_provider(uint64_t user_ref, uint64_t provider_ref,
    const std::optional<gm::wire::GMFunction>& callback)
{
    firebase::auth::User* user = nullptr;
    validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
    auto* provider = resolveFederatedProvider(provider_ref);
    if (!user || !provider) return FirebaseError::InvalidHandle;
    firebase::Future<firebase::auth::AuthResult> future = user->ReauthenticateWithProvider(provider);
    if (!firebaseFutureArmed(future, "firebase_auth_user_reauthenticate_with_provider")) return FirebaseError::InvalidHandle;
    future.OnCompletion([callback, user_ref](const firebase::Future<firebase::auth::AuthResult>& f)
    {
        completeUserAuthResult(user_ref, f, callback);
    });
    return FirebaseError::Ok;
}

FirebaseError firebase_auth_user_link_with_provider(uint64_t user_ref, uint64_t provider_ref,
    const std::optional<gm::wire::GMFunction>& callback)
{
    firebase::auth::User* user = nullptr;
    validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
    auto* provider = resolveFederatedProvider(provider_ref);
    if (!user || !provider) return FirebaseError::InvalidHandle;
    firebase::Future<firebase::auth::AuthResult> future = user->LinkWithProvider(provider);
    if (!firebaseFutureArmed(future, "firebase_auth_user_link_with_provider")) return FirebaseError::InvalidHandle;
    future.OnCompletion([callback, user_ref](const firebase::Future<firebase::auth::AuthResult>& f)
    {
        completeUserAuthResult(user_ref, f, callback);
    });
    return FirebaseError::Ok;
}

FirebaseError firebase_auth_user_reauthenticate_and_retrieve_data_result(uint64_t user_ref, uint64_t credential_ref,
    const std::optional<gm::wire::GMFunction>& callback)
{
    firebase::auth::User* user = nullptr;
    validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
    firebase::auth::Credential credential;
    if (!user || !resolveFirebaseAuthCredential(credential_ref, credential)) return FirebaseError::InvalidHandle;
    firebase::Future<firebase::auth::AuthResult> future = user->ReauthenticateAndRetrieveData(credential);
    if (!firebaseFutureArmed(future, "firebase_auth_user_reauthenticate_and_retrieve_data_result")) return FirebaseError::InvalidHandle;
    future.OnCompletion([callback, user_ref](const firebase::Future<firebase::auth::AuthResult>& f)
    {
        completeUserAuthResult(user_ref, f, callback);
    });
    return FirebaseError::Ok;
}

FirebaseError firebase_auth_user_link_with_credential_result(uint64_t user_ref, uint64_t credential_ref,
    const std::optional<gm::wire::GMFunction>& callback)
{
    firebase::auth::User* user = nullptr;
    validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
    firebase::auth::Credential credential;
    if (!user || !resolveFirebaseAuthCredential(credential_ref, credential)) return FirebaseError::InvalidHandle;
    firebase::Future<firebase::auth::AuthResult> future = user->LinkWithCredential(credential);
    if (!firebaseFutureArmed(future, "firebase_auth_user_link_with_credential_result")) return FirebaseError::InvalidHandle;
    future.OnCompletion([callback, user_ref](const firebase::Future<firebase::auth::AuthResult>& f)
    {
        completeUserAuthResult(user_ref, f, callback);
    });
    return FirebaseError::Ok;
}

FirebaseError firebase_auth_user_update_phone_number_credential(uint64_t user_ref, uint64_t phone_credential_ref,
    const std::optional<gm::wire::GMFunction>& callback)
{
    firebase::auth::User* user = nullptr;
    validate_fb_ref_ptr(user_ref, GM_FB_TYPE_AUTH_USER, firebase::auth::User, user);
    firebase::auth::PhoneAuthCredential credential;
    if (!user || !firebase_auth_resolve_phone_credential(phone_credential_ref, credential)) return FirebaseError::InvalidHandle;
    firebase::Future<firebase::auth::User> future = user->UpdatePhoneNumberCredential(credential);
    if (!firebaseFutureArmed(future, "firebase_auth_user_update_phone_number_credential")) return FirebaseError::InvalidHandle;
    future.OnCompletion([callback, user_ref](const firebase::Future<firebase::auth::User>& f)
    {
        completeFuture(callback, f, [user_ref](const firebase::auth::User&) -> std::optional<uint64_t> { return user_ref; });
    });
    return FirebaseError::Ok;
}
