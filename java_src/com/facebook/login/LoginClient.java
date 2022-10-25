package com.facebook.login;

import android.app.Activity;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import com.facebook.AccessToken;
import com.facebook.FacebookException;
import com.facebook.GraphResponse;
import com.facebook.R;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.internal.CallbackManagerImpl;
import com.facebook.internal.NativeProtocol;
import com.facebook.internal.Utility;
import com.facebook.internal.Validate;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.AuthCheckFragment;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class LoginClient implements Parcelable {
    public static final Parcelable.Creator<LoginClient> CREATOR = new Parcelable.Creator() { // from class: com.facebook.login.LoginClient.1
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public LoginClient mo249createFromParcel(Parcel source) {
            return new LoginClient(source);
        }

        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public LoginClient[] mo250newArray(int size) {
            return new LoginClient[size];
        }
    };
    BackgroundProcessingListener backgroundProcessingListener;
    boolean checkedInternetPermission;
    int currentHandler;
    Fragment fragment;
    LoginMethodHandler[] handlersToTry;
    Map<String, String> loggingExtras;
    private LoginLogger loginLogger;
    OnCompletedListener onCompletedListener;
    Request pendingRequest;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public interface BackgroundProcessingListener {
        void onBackgroundProcessingStarted();

        void onBackgroundProcessingStopped();
    }

    /* loaded from: classes.dex */
    public interface OnCompletedListener {
        void onCompleted(Result result);
    }

    public LoginClient(Fragment fragment) {
        this.currentHandler = -1;
        this.fragment = fragment;
    }

    public Fragment getFragment() {
        return this.fragment;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setFragment(Fragment fragment) {
        if (this.fragment != null) {
            throw new FacebookException("Can't set fragment once it is already set.");
        }
        this.fragment = fragment;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public FragmentActivity getActivity() {
        return this.fragment.getActivity();
    }

    public Request getPendingRequest() {
        return this.pendingRequest;
    }

    public static int getLoginRequestCode() {
        return CallbackManagerImpl.RequestCodeOffset.Login.toRequestCode();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void startOrContinueAuth(Request request) {
        if (!getInProgress()) {
            authorize(request);
        }
    }

    void authorize(Request request) {
        if (request != null) {
            if (this.pendingRequest != null) {
                throw new FacebookException("Attempted to authorize while a request is pending.");
            }
            if (AccessToken.getCurrentAccessToken() == null || checkInternetPermission()) {
                this.pendingRequest = request;
                this.handlersToTry = getHandlersToTry(request);
                tryNextHandler();
            }
        }
    }

    boolean getInProgress() {
        return this.pendingRequest != null && this.currentHandler >= 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void cancelCurrentHandler() {
        if (this.currentHandler >= 0) {
            getCurrentHandler().cancel();
        }
    }

    private LoginMethodHandler getCurrentHandler() {
        if (this.currentHandler >= 0) {
            return this.handlersToTry[this.currentHandler];
        }
        return null;
    }

    public boolean onActivityResult(int requestCode, int resultCode, Intent data) {
        if (this.pendingRequest != null) {
            return getCurrentHandler().onActivityResult(requestCode, resultCode, data);
        }
        return false;
    }

    private LoginMethodHandler[] getHandlersToTry(Request request) {
        ArrayList<LoginMethodHandler> handlers = new ArrayList<>();
        LoginBehavior behavior = request.getLoginBehavior();
        if (behavior.allowsKatanaAuth()) {
            handlers.add(new GetTokenLoginMethodHandler(this));
            handlers.add(new KatanaProxyLoginMethodHandler(this));
        }
        if (behavior.allowsWebViewAuth()) {
            handlers.add(new WebViewLoginMethodHandler(this));
        }
        LoginMethodHandler[] result = new LoginMethodHandler[handlers.size()];
        handlers.toArray(result);
        return result;
    }

    boolean checkInternetPermission() {
        if (this.checkedInternetPermission) {
            return true;
        }
        int permissionCheck = checkPermission("android.permission.INTERNET");
        if (permissionCheck != 0) {
            Activity activity = getActivity();
            String errorType = activity.getString(R.string.com_facebook_internet_permission_error_title);
            String errorDescription = activity.getString(R.string.com_facebook_internet_permission_error_message);
            complete(Result.createErrorResult(this.pendingRequest, errorType, errorDescription));
            return false;
        }
        this.checkedInternetPermission = true;
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void tryNextHandler() {
        if (this.currentHandler >= 0) {
            logAuthorizationMethodComplete(getCurrentHandler().getNameForLogging(), "skipped", null, null, getCurrentHandler().methodLoggingExtras);
        }
        while (this.handlersToTry != null && this.currentHandler < this.handlersToTry.length - 1) {
            this.currentHandler++;
            boolean started = tryCurrentHandler();
            if (started) {
                return;
            }
        }
        if (this.pendingRequest != null) {
            completeWithFailure();
        }
    }

    private void completeWithFailure() {
        complete(Result.createErrorResult(this.pendingRequest, "Login attempt failed.", null));
    }

    private void addLoggingExtra(String key, String value, boolean accumulate) {
        if (this.loggingExtras == null) {
            this.loggingExtras = new HashMap();
        }
        if (this.loggingExtras.containsKey(key) && accumulate) {
            value = this.loggingExtras.get(key) + "," + value;
        }
        this.loggingExtras.put(key, value);
    }

    boolean tryCurrentHandler() {
        boolean tried = false;
        LoginMethodHandler handler = getCurrentHandler();
        if (handler.needsInternetPermission() && !checkInternetPermission()) {
            addLoggingExtra("no_internet_permission", AppEventsConstants.EVENT_PARAM_VALUE_YES, false);
        } else {
            tried = handler.tryAuthorize(this.pendingRequest);
            if (tried) {
                getLogger().logAuthorizationMethodStart(this.pendingRequest.getAuthId(), handler.getNameForLogging());
            } else {
                addLoggingExtra("not_tried", handler.getNameForLogging(), true);
            }
        }
        return tried;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void completeAndValidate(Result outcome) {
        if (outcome.token != null && AccessToken.getCurrentAccessToken() != null) {
            validateSameFbidAndFinish(outcome);
        } else {
            complete(outcome);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void complete(Result outcome) {
        LoginMethodHandler handler = getCurrentHandler();
        if (handler != null) {
            logAuthorizationMethodComplete(handler.getNameForLogging(), outcome, handler.methodLoggingExtras);
        }
        if (this.loggingExtras != null) {
            outcome.loggingExtras = this.loggingExtras;
        }
        this.handlersToTry = null;
        this.currentHandler = -1;
        this.pendingRequest = null;
        this.loggingExtras = null;
        notifyOnCompleteListener(outcome);
    }

    OnCompletedListener getOnCompletedListener() {
        return this.onCompletedListener;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setOnCompletedListener(OnCompletedListener onCompletedListener) {
        this.onCompletedListener = onCompletedListener;
    }

    BackgroundProcessingListener getBackgroundProcessingListener() {
        return this.backgroundProcessingListener;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setBackgroundProcessingListener(BackgroundProcessingListener backgroundProcessingListener) {
        this.backgroundProcessingListener = backgroundProcessingListener;
    }

    int checkPermission(String permission) {
        return getActivity().checkCallingOrSelfPermission(permission);
    }

    void validateSameFbidAndFinish(Result pendingResult) {
        Result result;
        if (pendingResult.token == null) {
            throw new FacebookException("Can't validate without a token");
        }
        AccessToken previousToken = AccessToken.getCurrentAccessToken();
        AccessToken newToken = pendingResult.token;
        if (previousToken != null && newToken != null) {
            try {
                if (previousToken.getUserId().equals(newToken.getUserId())) {
                    result = Result.createTokenResult(this.pendingRequest, pendingResult.token);
                    complete(result);
                }
            } catch (Exception ex) {
                complete(Result.createErrorResult(this.pendingRequest, "Caught exception", ex.getMessage()));
                return;
            }
        }
        result = Result.createErrorResult(this.pendingRequest, "User logged in as different Facebook user.", null);
        complete(result);
    }

    private static AccessToken createFromTokenWithRefreshedPermissions(AccessToken token, Collection<String> grantedPermissions, Collection<String> declinedPermissions) {
        return new AccessToken(token.getToken(), token.getApplicationId(), token.getUserId(), grantedPermissions, declinedPermissions, token.getSource(), token.getExpires(), token.getLastRefresh());
    }

    private LoginLogger getLogger() {
        if (this.loginLogger == null || !this.loginLogger.getApplicationId().equals(this.pendingRequest.getApplicationId())) {
            this.loginLogger = new LoginLogger(getActivity(), this.pendingRequest.getApplicationId());
        }
        return this.loginLogger;
    }

    private void notifyOnCompleteListener(Result outcome) {
        if (this.onCompletedListener != null) {
            this.onCompletedListener.onCompleted(outcome);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void notifyBackgroundProcessingStart() {
        if (this.backgroundProcessingListener != null) {
            this.backgroundProcessingListener.onBackgroundProcessingStarted();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void notifyBackgroundProcessingStop() {
        if (this.backgroundProcessingListener != null) {
            this.backgroundProcessingListener.onBackgroundProcessingStopped();
        }
    }

    private void logAuthorizationMethodComplete(String method, Result result, Map<String, String> loggingExtras) {
        logAuthorizationMethodComplete(method, result.code.getLoggingValue(), result.errorMessage, result.errorCode, loggingExtras);
    }

    private void logAuthorizationMethodComplete(String method, String result, String errorMessage, String errorCode, Map<String, String> loggingExtras) {
        if (this.pendingRequest == null) {
            getLogger().logUnexpectedError("fb_mobile_login_method_complete", "Unexpected call to logCompleteLogin with null pendingAuthorizationRequest.", method);
        } else {
            getLogger().logAuthorizationMethodComplete(this.pendingRequest.getAuthId(), method, result, errorMessage, errorCode, loggingExtras);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String getE2E() {
        JSONObject e2e = new JSONObject();
        try {
            e2e.put("init", System.currentTimeMillis());
        } catch (JSONException e) {
        }
        return e2e.toString();
    }

    /* loaded from: classes.dex */
    public static class Request implements Parcelable {
        public static final Parcelable.Creator<Request> CREATOR = new Parcelable.Creator() { // from class: com.facebook.login.LoginClient.Request.1
            @Override // android.os.Parcelable.Creator
            /* renamed from: createFromParcel */
            public Request mo251createFromParcel(Parcel source) {
                return new Request(source);
            }

            @Override // android.os.Parcelable.Creator
            /* renamed from: newArray */
            public Request[] mo252newArray(int size) {
                return new Request[size];
            }
        };
        private final String applicationId;
        private final String authId;
        private final DefaultAudience defaultAudience;
        private boolean isRerequest;
        private final LoginBehavior loginBehavior;
        private Set<String> permissions;

        /* JADX INFO: Access modifiers changed from: package-private */
        public Request(LoginBehavior loginBehavior, Set<String> permissions, DefaultAudience defaultAudience, String applicationId, String authId) {
            this.isRerequest = false;
            this.loginBehavior = loginBehavior;
            this.permissions = permissions == null ? new HashSet<>() : permissions;
            this.defaultAudience = defaultAudience;
            this.applicationId = applicationId;
            this.authId = authId;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public Set<String> getPermissions() {
            return this.permissions;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public void setPermissions(Set<String> permissions) {
            Validate.notNull(permissions, NativeProtocol.RESULT_ARGS_PERMISSIONS);
            this.permissions = permissions;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public LoginBehavior getLoginBehavior() {
            return this.loginBehavior;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public DefaultAudience getDefaultAudience() {
            return this.defaultAudience;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public String getApplicationId() {
            return this.applicationId;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public String getAuthId() {
            return this.authId;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public boolean isRerequest() {
            return this.isRerequest;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public void setRerequest(boolean isRerequest) {
            this.isRerequest = isRerequest;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public boolean hasPublishPermission() {
            for (String permission : this.permissions) {
                if (LoginManager.isPublishPermission(permission)) {
                    return true;
                }
            }
            return false;
        }

        private Request(Parcel parcel) {
            DefaultAudience defaultAudience = null;
            this.isRerequest = false;
            String enumValue = parcel.readString();
            this.loginBehavior = enumValue != null ? LoginBehavior.valueOf(enumValue) : null;
            ArrayList<String> permissionsList = new ArrayList<>();
            parcel.readStringList(permissionsList);
            this.permissions = new HashSet(permissionsList);
            String enumValue2 = parcel.readString();
            this.defaultAudience = enumValue2 != null ? DefaultAudience.valueOf(enumValue2) : defaultAudience;
            this.applicationId = parcel.readString();
            this.authId = parcel.readString();
            this.isRerequest = parcel.readByte() != 0;
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            String str = null;
            dest.writeString(this.loginBehavior != null ? this.loginBehavior.name() : null);
            dest.writeStringList(new ArrayList(this.permissions));
            if (this.defaultAudience != null) {
                str = this.defaultAudience.name();
            }
            dest.writeString(str);
            dest.writeString(this.applicationId);
            dest.writeString(this.authId);
            dest.writeByte((byte) (this.isRerequest ? 1 : 0));
        }
    }

    /* loaded from: classes.dex */
    public static class Result implements Parcelable {
        public static final Parcelable.Creator<Result> CREATOR = new Parcelable.Creator() { // from class: com.facebook.login.LoginClient.Result.1
            @Override // android.os.Parcelable.Creator
            /* renamed from: createFromParcel */
            public Result mo253createFromParcel(Parcel source) {
                return new Result(source);
            }

            @Override // android.os.Parcelable.Creator
            /* renamed from: newArray */
            public Result[] mo254newArray(int size) {
                return new Result[size];
            }
        };
        final Code code;
        final String errorCode;
        final String errorMessage;
        public Map<String, String> loggingExtras;
        final Request request;
        final AccessToken token;

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes.dex */
        public enum Code {
            SUCCESS("success"),
            CANCEL("cancel"),
            ERROR("error");
            
            private final String loggingValue;

            Code(String loggingValue) {
                this.loggingValue = loggingValue;
            }

            /* JADX INFO: Access modifiers changed from: package-private */
            public String getLoggingValue() {
                return this.loggingValue;
            }
        }

        Result(Request request, Code code, AccessToken token, String errorMessage, String errorCode) {
            Validate.notNull(code, AuthCheckFragment.KEY_CODE);
            this.request = request;
            this.token = token;
            this.errorMessage = errorMessage;
            this.code = code;
            this.errorCode = errorCode;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static Result createTokenResult(Request request, AccessToken token) {
            return new Result(request, Code.SUCCESS, token, null, null);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static Result createCancelResult(Request request, String message) {
            return new Result(request, Code.CANCEL, null, message, null);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static Result createErrorResult(Request request, String errorType, String errorDescription) {
            return createErrorResult(request, errorType, errorDescription, null);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static Result createErrorResult(Request request, String errorType, String errorDescription, String errorCode) {
            String message = TextUtils.join(": ", Utility.asListNoNulls(errorType, errorDescription));
            return new Result(request, Code.ERROR, null, message, errorCode);
        }

        private Result(Parcel parcel) {
            this.code = Code.valueOf(parcel.readString());
            this.token = (AccessToken) parcel.readParcelable(AccessToken.class.getClassLoader());
            this.errorMessage = parcel.readString();
            this.errorCode = parcel.readString();
            this.request = (Request) parcel.readParcelable(Request.class.getClassLoader());
            this.loggingExtras = Utility.readStringMapFromParcel(parcel);
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            dest.writeString(this.code.name());
            dest.writeParcelable(this.token, flags);
            dest.writeString(this.errorMessage);
            dest.writeString(this.errorCode);
            dest.writeParcelable(this.request, flags);
            Utility.writeStringMapToParcel(dest, this.loggingExtras);
        }
    }

    /* loaded from: classes.dex */
    private static class PermissionsPair {
        List<String> declinedPermissions;
        List<String> grantedPermissions;

        public PermissionsPair(List<String> grantedPermissions, List<String> declinedPermissions) {
            this.grantedPermissions = grantedPermissions;
            this.declinedPermissions = declinedPermissions;
        }

        public List<String> getGrantedPermissions() {
            return this.grantedPermissions;
        }

        public List<String> getDeclinedPermissions() {
            return this.declinedPermissions;
        }
    }

    private static PermissionsPair handlePermissionResponse(GraphResponse response) {
        JSONObject result;
        JSONArray data;
        String status;
        if (response.getError() != null || (result = response.getJSONObject()) == null || (data = result.optJSONArray("data")) == null || data.length() == 0) {
            return null;
        }
        List<String> grantedPermissions = new ArrayList<>(data.length());
        List<String> declinedPermissions = new ArrayList<>(data.length());
        for (int i = 0; i < data.length(); i++) {
            JSONObject object = data.optJSONObject(i);
            String permission = object.optString("permission");
            if (permission != null && !permission.equals(ServerKeys.INSTALLED) && (status = object.optString("status")) != null) {
                if (status.equals("granted")) {
                    grantedPermissions.add(permission);
                } else if (status.equals("declined")) {
                    declinedPermissions.add(permission);
                }
            }
        }
        return new PermissionsPair(grantedPermissions, declinedPermissions);
    }

    public LoginClient(Parcel source) {
        this.currentHandler = -1;
        Object[] o = source.readParcelableArray(LoginMethodHandler.class.getClassLoader());
        this.handlersToTry = new LoginMethodHandler[o.length];
        for (int i = 0; i < o.length; i++) {
            this.handlersToTry[i] = (LoginMethodHandler) o[i];
            this.handlersToTry[i].setLoginClient(this);
        }
        this.currentHandler = source.readInt();
        this.pendingRequest = (Request) source.readParcelable(Request.class.getClassLoader());
        this.loggingExtras = Utility.readStringMapFromParcel(source);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeParcelableArray(this.handlersToTry, flags);
        dest.writeInt(this.currentHandler);
        dest.writeParcelable(this.pendingRequest, flags);
        Utility.writeStringMapToParcel(dest, this.loggingExtras);
    }
}
