package com.google.android.gms.internal;

import com.facebook.internal.AnalyticsEvents;
import com.facebook.internal.NativeProtocol;
/* loaded from: classes.dex */
public enum zzoe {
    CLIENT_LOGIN_DISABLED("ClientLoginDisabled"),
    DEVICE_MANAGEMENT_REQUIRED("DeviceManagementRequiredOrSyncDisabled"),
    SOCKET_TIMEOUT("SocketTimeout"),
    SUCCESS("Ok"),
    UNKNOWN_ERROR("UNKNOWN_ERR"),
    NETWORK_ERROR(NativeProtocol.ERROR_NETWORK_ERROR),
    SERVICE_UNAVAILABLE("ServiceUnavailable"),
    INTNERNAL_ERROR("InternalError"),
    BAD_AUTHENTICATION("BadAuthentication"),
    EMPTY_CONSUMER_PKG_OR_SIG("EmptyConsumerPackageOrSig"),
    NEEDS_2F("InvalidSecondFactor"),
    NEEDS_POST_SIGN_IN_FLOW("PostSignInFlowRequired"),
    NEEDS_BROWSER("NeedsBrowser"),
    UNKNOWN(AnalyticsEvents.PARAMETER_DIALOG_OUTCOME_VALUE_UNKNOWN),
    NOT_VERIFIED("NotVerified"),
    TERMS_NOT_AGREED("TermsNotAgreed"),
    ACCOUNT_DISABLED("AccountDisabled"),
    CAPTCHA("CaptchaRequired"),
    ACCOUNT_DELETED("AccountDeleted"),
    SERVICE_DISABLED(NativeProtocol.ERROR_SERVICE_DISABLED),
    NEED_PERMISSION("NeedPermission"),
    NEED_REMOTE_CONSENT("NeedRemoteConsent"),
    INVALID_SCOPE("INVALID_SCOPE"),
    USER_CANCEL("UserCancel"),
    PERMISSION_DENIED(NativeProtocol.ERROR_PERMISSION_DENIED),
    INVALID_AUDIENCE("INVALID_AUDIENCE"),
    UNREGISTERED_ON_API_CONSOLE("UNREGISTERED_ON_API_CONSOLE"),
    THIRD_PARTY_DEVICE_MANAGEMENT_REQUIRED("ThirdPartyDeviceManagementRequired"),
    DM_INTERNAL_ERROR("DeviceManagementInternalError"),
    DM_SYNC_DISABLED("DeviceManagementSyncDisabled"),
    DM_ADMIN_BLOCKED("DeviceManagementAdminBlocked"),
    DM_ADMIN_PENDING_APPROVAL("DeviceManagementAdminPendingApproval"),
    DM_STALE_SYNC_REQUIRED("DeviceManagementStaleSyncRequired"),
    DM_DEACTIVATED("DeviceManagementDeactivated"),
    DM_REQUIRED("DeviceManagementRequired"),
    ALREADY_HAS_GMAIL("ALREADY_HAS_GMAIL"),
    BAD_PASSWORD("WeakPassword"),
    BAD_REQUEST("BadRequest"),
    BAD_USERNAME("BadUsername"),
    DELETED_GMAIL("DeletedGmail"),
    EXISTING_USERNAME("ExistingUsername"),
    LOGIN_FAIL("LoginFail"),
    NOT_LOGGED_IN("NotLoggedIn"),
    NO_GMAIL("NoGmail"),
    REQUEST_DENIED("RequestDenied"),
    SERVER_ERROR("ServerError"),
    USERNAME_UNAVAILABLE("UsernameUnavailable"),
    GPLUS_OTHER("GPlusOther"),
    GPLUS_NICKNAME("GPlusNickname"),
    GPLUS_INVALID_CHAR("GPlusInvalidChar"),
    GPLUS_INTERSTITIAL("GPlusInterstitial"),
    GPLUS_PROFILE_ERROR("ProfileUpgradeError");
    
    private final String kW;

    zzoe(String str) {
        this.kW = str;
    }

    public static boolean zza(zzoe zzoeVar) {
        return BAD_AUTHENTICATION.equals(zzoeVar) || CAPTCHA.equals(zzoeVar) || NEED_PERMISSION.equals(zzoeVar) || NEED_REMOTE_CONSENT.equals(zzoeVar) || NEEDS_BROWSER.equals(zzoeVar) || USER_CANCEL.equals(zzoeVar) || DEVICE_MANAGEMENT_REQUIRED.equals(zzoeVar) || DM_INTERNAL_ERROR.equals(zzoeVar) || DM_SYNC_DISABLED.equals(zzoeVar) || DM_ADMIN_BLOCKED.equals(zzoeVar) || DM_ADMIN_PENDING_APPROVAL.equals(zzoeVar) || DM_STALE_SYNC_REQUIRED.equals(zzoeVar) || DM_DEACTIVATED.equals(zzoeVar) || DM_REQUIRED.equals(zzoeVar) || THIRD_PARTY_DEVICE_MANAGEMENT_REQUIRED.equals(zzoeVar);
    }

    public static boolean zzb(zzoe zzoeVar) {
        return NETWORK_ERROR.equals(zzoeVar) || SERVICE_UNAVAILABLE.equals(zzoeVar);
    }

    public static final zzoe zzgi(String str) {
        zzoe zzoeVar = null;
        zzoe[] values = values();
        int length = values.length;
        int i = 0;
        while (i < length) {
            zzoe zzoeVar2 = values[i];
            if (!zzoeVar2.kW.equals(str)) {
                zzoeVar2 = zzoeVar;
            }
            i++;
            zzoeVar = zzoeVar2;
        }
        return zzoeVar;
    }
}
