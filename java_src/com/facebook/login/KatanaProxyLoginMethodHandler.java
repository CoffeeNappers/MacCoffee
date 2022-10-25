package com.facebook.login;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.AccessToken;
import com.facebook.AccessTokenSource;
import com.facebook.FacebookException;
import com.facebook.internal.AnalyticsEvents;
import com.facebook.internal.NativeProtocol;
import com.facebook.internal.ServerProtocol;
import com.facebook.internal.Utility;
import com.facebook.login.LoginClient;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class KatanaProxyLoginMethodHandler extends LoginMethodHandler {
    public static final Parcelable.Creator<KatanaProxyLoginMethodHandler> CREATOR = new Parcelable.Creator() { // from class: com.facebook.login.KatanaProxyLoginMethodHandler.1
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public KatanaProxyLoginMethodHandler mo247createFromParcel(Parcel source) {
            return new KatanaProxyLoginMethodHandler(source);
        }

        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public KatanaProxyLoginMethodHandler[] mo248newArray(int size) {
            return new KatanaProxyLoginMethodHandler[size];
        }
    };

    /* JADX INFO: Access modifiers changed from: package-private */
    public KatanaProxyLoginMethodHandler(LoginClient loginClient) {
        super(loginClient);
    }

    @Override // com.facebook.login.LoginMethodHandler
    String getNameForLogging() {
        return "katana_proxy_auth";
    }

    @Override // com.facebook.login.LoginMethodHandler
    boolean tryAuthorize(LoginClient.Request request) {
        String e2e = LoginClient.getE2E();
        Intent intent = NativeProtocol.createProxyAuthIntent(this.loginClient.getActivity(), request.getApplicationId(), request.getPermissions(), e2e, request.isRerequest(), request.hasPublishPermission(), request.getDefaultAudience());
        addLoggingExtra("e2e", e2e);
        return tryIntent(intent, LoginClient.getLoginRequestCode());
    }

    @Override // com.facebook.login.LoginMethodHandler
    boolean onActivityResult(int requestCode, int resultCode, Intent data) {
        LoginClient.Result outcome;
        LoginClient.Request request = this.loginClient.getPendingRequest();
        if (data == null) {
            outcome = LoginClient.Result.createCancelResult(request, "Operation canceled");
        } else if (resultCode == 0) {
            outcome = handleResultCancel(request, data);
        } else if (resultCode != -1) {
            outcome = LoginClient.Result.createErrorResult(request, "Unexpected resultCode from authorization.", null);
        } else {
            outcome = handleResultOk(request, data);
        }
        if (outcome != null) {
            this.loginClient.completeAndValidate(outcome);
            return true;
        }
        this.loginClient.tryNextHandler();
        return true;
    }

    private LoginClient.Result handleResultOk(LoginClient.Request request, Intent data) {
        Bundle extras = data.getExtras();
        String error = getError(extras);
        String errorCode = extras.getString(NativeProtocol.BRIDGE_ARG_ERROR_CODE);
        String errorMessage = getErrorMessage(extras);
        String e2e = extras.getString("e2e");
        if (!Utility.isNullOrEmpty(e2e)) {
            logWebLoginCompleted(e2e);
        }
        if (error == null && errorCode == null && errorMessage == null) {
            try {
                AccessToken token = createAccessTokenFromWebBundle(request.getPermissions(), extras, AccessTokenSource.FACEBOOK_APPLICATION_WEB, request.getApplicationId());
                return LoginClient.Result.createTokenResult(request, token);
            } catch (FacebookException ex) {
                return LoginClient.Result.createErrorResult(request, null, ex.getMessage());
            }
        } else if (ServerProtocol.errorsProxyAuthDisabled.contains(error)) {
            return null;
        } else {
            if (ServerProtocol.errorsUserCanceled.contains(error)) {
                return LoginClient.Result.createCancelResult(request, null);
            }
            return LoginClient.Result.createErrorResult(request, error, errorMessage, errorCode);
        }
    }

    private LoginClient.Result handleResultCancel(LoginClient.Request request, Intent data) {
        Bundle extras = data.getExtras();
        String error = getError(extras);
        String errorCode = extras.getString(NativeProtocol.BRIDGE_ARG_ERROR_CODE);
        if (ServerProtocol.errorConnectionFailure.equals(errorCode)) {
            String errorMessage = getErrorMessage(extras);
            return LoginClient.Result.createErrorResult(request, error, errorMessage, errorCode);
        }
        return LoginClient.Result.createCancelResult(request, error);
    }

    private String getError(Bundle extras) {
        String error = extras.getString("error");
        if (error == null) {
            return extras.getString(NativeProtocol.BRIDGE_ARG_ERROR_TYPE);
        }
        return error;
    }

    private String getErrorMessage(Bundle extras) {
        String errorMessage = extras.getString(AnalyticsEvents.PARAMETER_SHARE_ERROR_MESSAGE);
        if (errorMessage == null) {
            return extras.getString(NativeProtocol.BRIDGE_ARG_ERROR_DESCRIPTION);
        }
        return errorMessage;
    }

    protected boolean tryIntent(Intent intent, int requestCode) {
        if (intent == null) {
            return false;
        }
        try {
            this.loginClient.getFragment().startActivityForResult(intent, requestCode);
            return true;
        } catch (ActivityNotFoundException e) {
            return false;
        }
    }

    KatanaProxyLoginMethodHandler(Parcel source) {
        super(source);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.facebook.login.LoginMethodHandler, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
    }
}
