package com.vkontakte.android.auth;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.preference.PreferenceManager;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.internal.NativeProtocol;
import com.facebook.internal.ServerProtocol;
import com.my.tracker.MyTracker;
import com.vk.core.network.Network;
import com.vkontakte.android.CaptchaActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.ShortcutManagerWrapper;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.execute.GetWallInfo;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import com.vkontakte.android.utils.L;
import io.sentry.DefaultSentryClientFactory;
import java.io.UnsupportedEncodingException;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;
/* loaded from: classes2.dex */
public class VKAuth {
    public static final String ACCOUNT_TYPE = "com.vkontakte.account";
    public static final int API_ID = 2274003;
    public static final String API_SECRET = "hHbZxrka2uZ6jB1inYsH";
    public static final int AUTH_CODE_CANCELED = 4;
    public static final int AUTH_CODE_INCORRECT_LOGIN_DATA = 3;
    private static final int AUTH_CODE_NEED_VALIDATION = 7;
    private static final int AUTH_CODE_PRECESSING = 5;
    private static final int AUTH_CODE_RETRY_WITH_CAPTCHA = 6;
    public static final int AUTH_CODE_SERVER_ERROR = 0;
    public static final int AUTH_CODE_USER_WAS_ADDED = 1;
    public static final int AUTH_CODE_USER_WAS_AUTH = 2;
    public static final int VALIDATION_TYPE_APP = 2;
    public static final int VALIDATION_TYPE_LIBVERIFY = 3;
    public static final int VALIDATION_TYPE_PHONE = 4;
    public static final int VALIDATION_TYPE_SMS = 1;
    public static final int VALIDATION_TYPE_URL = 0;
    private static Handler authHandler = null;
    private static Handler callbackHandler = null;
    private static String oauthUrl = null;

    /* loaded from: classes2.dex */
    public interface AuthListener {
        void onAuthFinish(int i, @Nullable AuthAnswer authAnswer);

        void onAuthNeedValidation(VKAuthState vKAuthState, AuthAnswer authAnswer);

        void onAuthStart();
    }

    private static String getOauthUrl() {
        if (oauthUrl == null) {
            SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(VKApplication.context);
            oauthUrl = "https://" + prefs.getString("oauthHost", "oauth.vk.com") + "/token";
        }
        return oauthUrl;
    }

    public static synchronized Handler getAuthHandler() {
        Handler handler;
        synchronized (VKAuth.class) {
            if (authHandler == null) {
                HandlerThread handlerThread = new HandlerThread("Auth thread");
                handlerThread.start();
                authHandler = new Handler(handlerThread.getLooper());
            }
            handler = authHandler;
        }
        return handler;
    }

    public static synchronized Handler getCallbackHandler() {
        Handler handler;
        synchronized (VKAuth.class) {
            if (callbackHandler == null) {
                callbackHandler = new Handler(Looper.getMainLooper());
            }
            handler = callbackHandler;
        }
        return handler;
    }

    public static void authAsync(VKAuthState state, AuthListener authListener) {
        Handler callbackHandler2 = getCallbackHandler();
        authListener.getClass();
        callbackHandler2.post(VKAuth$$Lambda$1.lambdaFactory$(authListener));
        getAuthHandler().post(VKAuth$$Lambda$2.lambdaFactory$(state, authListener));
    }

    public static /* synthetic */ void lambda$authAsync$3(VKAuthState state, AuthListener authListener) {
        AuthResult result;
        while (true) {
            result = auth(state);
            if (result.code == 5 && result.authAnswer != null) {
                VKAuthUtils.sleep(Math.max(200L, Math.min(20000L, result.authAnswer.timeOut)));
            } else if (result.code != 6 || result.authAnswer == null) {
                break;
            } else {
                Intent intent = new Intent(VKApplication.context, CaptchaActivity.class);
                intent.addFlags(268435456);
                intent.putExtra("url", result.authAnswer.captcha_img);
                VKApplication.context.startActivity(intent);
                while (!CaptchaActivity.isReady) {
                    VKAuthUtils.sleep(200L);
                }
                CaptchaActivity.isReady = false;
                String captchaSid = result.authAnswer.captcha_sid;
                String captchaKey = CaptchaActivity.lastKey;
                if (TextUtils.isEmpty(captchaKey)) {
                    getCallbackHandler().post(VKAuth$$Lambda$4.lambdaFactory$(authListener, result));
                    return;
                }
                state.setCaptchaInfo(captchaSid, captchaKey);
            }
        }
        if (result.code == 7) {
            getCallbackHandler().post(VKAuth$$Lambda$5.lambdaFactory$(authListener, state, result));
        } else {
            getCallbackHandler().post(VKAuth$$Lambda$6.lambdaFactory$(authListener, result));
        }
    }

    public static /* synthetic */ void lambda$null$0(AuthListener authListener, AuthResult resultFinal) {
        authListener.onAuthFinish(4, resultFinal.authAnswer);
    }

    private static AuthResult auth(@NonNull VKAuthState helper) {
        AuthAnswer authAnswer;
        try {
            if (helper.canSkipAuth()) {
                authAnswer = new AuthAnswer(helper);
            } else {
                authAnswer = authInternal(helper);
            }
            if (authAnswer.isSuccess()) {
                VKAccount account = new VKAccount();
                account.uid = authAnswer.userId;
                account.accessToken = authAnswer.accessToken;
                account.secret = authAnswer.secret;
                if (helper.isNeedStoreAfterAuth()) {
                    GetWallInfo.Result result = loadWallInfoResult(account);
                    if (result == null) {
                        return new AuthResult(0, authAnswer);
                    }
                    MyTracker.trackLoginEvent();
                    VKAccountManager.storeNewAccount(account, result);
                    ShortcutManagerWrapper.getInstance().respondToUserLogin(VKApplication.context);
                    return new AuthResult(1, authAnswer);
                }
                return new AuthResult(2, authAnswer);
            } else if ("need_captcha".equals(authAnswer.error)) {
                return new AuthResult(6, authAnswer);
            } else {
                if ("need_validation".equals(authAnswer.error)) {
                    return new AuthResult(7, authAnswer);
                }
                if ("need_authcheck".equals(authAnswer.error)) {
                    L.e("Error need auth check");
                    return new AuthResult(0, null);
                } else if ("invalid_client".equals(authAnswer.error)) {
                    L.e("Error need auth check");
                    return new AuthResult(3, authAnswer);
                } else if (authAnswer.processing) {
                    return new AuthResult(5, authAnswer);
                } else {
                    return new AuthResult(3, authAnswer);
                }
            }
        } catch (UnsupportedEncodingException e) {
            return new AuthResult(0, null);
        } catch (RuntimeException e2) {
            return new AuthResult(0, null);
        } catch (JSONException e3) {
            return new AuthResult(0, null);
        }
    }

    public static boolean logout() {
        VKAccount vkAccount = VKAccountManager.getCurrent();
        String accessToken = vkAccount.accessToken;
        String secret = vkAccount.secret;
        ShortcutManagerWrapper.getInstance().respondToUserLogout(VKApplication.context);
        if (VKAccountManager.clearCurrent()) {
            L.d("logout");
            VKSession.cleanSession(accessToken, secret);
            return true;
        }
        return false;
    }

    public static boolean ensureLoggedIn(Context act) {
        if (VKAccountManager.getCurrent().isReal()) {
            return true;
        }
        new VKAlertDialog.Builder(act).setTitle(R.string.auth_required_title).setMessage(R.string.auth_required).setPositiveButton(R.string.reg_continue, VKAuth$$Lambda$3.lambdaFactory$(act)).setNegativeButton(R.string.close, (DialogInterface.OnClickListener) null).show();
        return false;
    }

    private static GetWallInfo.Result loadWallInfoResult(VKAccount account) {
        Container<GetWallInfo.Result> container = new Container<>();
        VKAPIRequest<GetWallInfo.Result> wallInfo = new GetWallInfo().setCallback(container).param("access_token", account.accessToken);
        wallInfo.param("sig", wallInfo.getSig(account.secret)).persistWithToken().execSync();
        return (GetWallInfo.Result) container.object;
    }

    @NonNull
    private static AuthAnswer authInternal(@NonNull VKAuthState helper) throws RuntimeException, UnsupportedEncodingException, JSONException {
        Uri.Builder uriBuilder = Uri.parse(getOauthUrl()).buildUpon().appendQueryParameter("scope", "nohttps,all").appendQueryParameter("client_id", String.valueOf((int) API_ID)).appendQueryParameter("client_secret", API_SECRET).appendQueryParameter("2fa_supported", AppEventsConstants.EVENT_PARAM_VALUE_YES);
        String trustedHash = getTrustedHash();
        if (!TextUtils.isEmpty(trustedHash)) {
            uriBuilder.appendQueryParameter("trusted_hash", trustedHash);
        }
        helper.visit(uriBuilder);
        String url = uriBuilder.build().toString();
        L.d("Auth url:", url);
        byte[] r = Network.getURL(url);
        if (r == null) {
            throw new RuntimeException("Server returned null");
        }
        String sAnswer = new String(r, "UTF-8");
        L.d("Auth Result:", sAnswer);
        AuthAnswer authAnswer = new AuthAnswer((JSONObject) new JSONTokener(sAnswer).nextValue());
        if (!TextUtils.isEmpty(authAnswer.trusted_hash)) {
            storeTrustedHash(authAnswer.trusted_hash);
        }
        return authAnswer;
    }

    private static String getTrustedHash() {
        return VKApplication.context.getSharedPreferences("2fa", 0).getString("trusted_hash", null);
    }

    private static void storeTrustedHash(String hash) {
        VKApplication.context.getSharedPreferences("2fa", 0).edit().putString("trusted_hash", hash).apply();
    }

    /* loaded from: classes2.dex */
    public static class AuthAnswer {
        private static final String ERROR_INVALID_CLIENT = "invalid_client";
        private static final String ERROR_NEED_AUTH_CHECK = "need_authcheck";
        private static final String ERROR_NEED_CAPTCHA = "need_captcha";
        private static final String ERROR_NEED_VALIDATE = "need_validation";
        public final String accessToken;
        private final int auth_by_app;
        private final String captcha_img;
        private final String captcha_sid;
        public final String changePasswordHash;
        public final String concatError;
        private final String error;
        public final String errorDescription;
        public final String phoneMask;
        private final String phone_hidden;
        private final boolean processing;
        public final String redirectUrl;
        public final String secret;
        private final long timeOut;
        private final String trusted_hash;
        public final int userId;
        private final String user_first_name;
        private final String user_last_name;
        private final String user_photo;
        public final int validateType;
        public final String validationSid;
        private final String validation_type;

        private AuthAnswer(@NonNull VKAuthState helper) {
            this.accessToken = helper.accessToken;
            this.secret = helper.secret;
            this.userId = helper.userId;
            this.processing = false;
            this.auth_by_app = 0;
            this.timeOut = 0;
            this.changePasswordHash = null;
            this.phone_hidden = null;
            this.user_photo = null;
            this.user_last_name = null;
            this.user_first_name = null;
            this.phoneMask = null;
            this.validationSid = null;
            this.validation_type = null;
            this.redirectUrl = null;
            this.captcha_img = null;
            this.captcha_sid = null;
            this.concatError = null;
            this.errorDescription = null;
            this.error = null;
            this.trusted_hash = null;
            this.validateType = 0;
        }

        private AuthAnswer(JSONObject jo) {
            String str = null;
            this.accessToken = jo.optString("access_token");
            this.secret = jo.optString("secret");
            this.userId = jo.optInt("user_id");
            this.trusted_hash = jo.optString("trusted_hash");
            this.processing = jo.has("processing");
            this.timeOut = jo.optLong(DefaultSentryClientFactory.TIMEOUT_OPTION, 200L);
            this.error = jo.optString("error");
            this.errorDescription = jo.optString(NativeProtocol.BRIDGE_ARG_ERROR_DESCRIPTION);
            this.concatError = this.error + " / " + this.errorDescription;
            this.captcha_sid = jo.optString("captcha_sid");
            this.captcha_img = jo.optString("captcha_img");
            this.redirectUrl = jo.optString(ServerProtocol.DIALOG_PARAM_REDIRECT_URI);
            this.validation_type = jo.optString("validation_type");
            this.validationSid = jo.optString("validation_sid");
            this.phoneMask = jo.optString("phone_mask");
            String valueOf = String.valueOf(this.validation_type);
            char c = 65535;
            switch (valueOf.hashCode()) {
                case -272281108:
                    if (valueOf.equals("2fa_libverify")) {
                        c = 2;
                        break;
                    }
                    break;
                case 106642798:
                    if (valueOf.equals(SignupPhoneFragment.KEY_PHONE)) {
                        c = 3;
                        break;
                    }
                    break;
                case 143225679:
                    if (valueOf.equals("2fa_app")) {
                        c = 1;
                        break;
                    }
                    break;
                case 143242887:
                    if (valueOf.equals("2fa_sms")) {
                        c = 0;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    this.validateType = 1;
                    break;
                case 1:
                    this.validateType = 2;
                    break;
                case 2:
                    this.validateType = 3;
                    break;
                case 3:
                    this.validateType = 4;
                    break;
                default:
                    this.validateType = 0;
                    break;
            }
            JSONObject info = jo.optJSONObject("user_info");
            this.user_first_name = info == null ? null : info.optString("first_name");
            this.user_last_name = info == null ? null : info.optString("last_name");
            this.user_photo = info != null ? info.optString("photo") : str;
            this.phone_hidden = jo.optString("phone_hidden");
            this.auth_by_app = jo.optInt("auth_by_app");
            this.changePasswordHash = jo.optString("change_password_hash");
        }

        public boolean isSuccess() {
            return this.userId != 0 && !TextUtils.isEmpty(this.accessToken) && !TextUtils.isEmpty(this.secret);
        }
    }

    /* loaded from: classes2.dex */
    public static class Container<T> implements Callback<T> {
        T object;

        private Container() {
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(T result) {
            this.object = result;
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            this.object = null;
        }
    }

    /* loaded from: classes2.dex */
    public static class AuthResult {
        @Nullable
        public final AuthAnswer authAnswer;
        public final int code;

        public AuthResult(int code, @Nullable AuthAnswer authAnswer) {
            this.code = code;
            this.authAnswer = authAnswer;
        }
    }
}
