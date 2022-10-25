package com.vkontakte.android.api;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.View;
import android.widget.TextView;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.common.util.UriUtil;
import com.facebook.internal.NativeProtocol;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.L;
import io.fabric.sdk.android.services.common.CommonUtils;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.functions.Cancellable;
import io.reactivex.schedulers.Schedulers;
import java.io.IOException;
import java.lang.reflect.Method;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Set;
import me.grishka.appkit.api.APIRequest;
import me.grishka.appkit.api.ErrorResponse;
import okhttp3.Call;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class VKAPIRequest<T> extends APIRequest implements Cancellable {
    public static final int ERROR_ALBUM_ACCESS = 200;
    public static final int ERROR_ALBUM_FULL = 300;
    public static final int ERROR_APP_DISABLED = 2;
    public static final int ERROR_AUDIO_ACCESS = 201;
    public static final int ERROR_BAD_REQUEST = 8;
    public static final int ERROR_BAD_SIGNATURE = 4;
    public static final int ERROR_CALLBACK_EXCEPTION = -3;
    public static final int ERROR_CAPTCHA_NEEDED = 14;
    public static final int ERROR_CONFIRM_REQUIRED = 24;
    public static final int ERROR_FLAG_LOCALIZED = 1073741824;
    public static final int ERROR_FLOOD = 9;
    public static final int ERROR_GROUP_ACCESS = 203;
    public static final int ERROR_HTTPS_REQUIRED = 16;
    public static final int ERROR_INTERNAL = 10;
    public static final int ERROR_IO = -1;
    public static final int ERROR_MALFORMED_RESPONSE = -2;
    public static final int ERROR_METHOD_DISABLED = 23;
    public static final int ERROR_NEED_VALIDATION = 17;
    public static final int ERROR_NOT_FOUND = 104;
    public static final int ERROR_NOT_STANDALONE = 20;
    public static final int ERROR_NO_ACCESS = 15;
    public static final int ERROR_NO_METHOD = 3;
    public static final int ERROR_NO_PERMISSION = 7;
    public static final int ERROR_PARAM = 100;
    public static final int ERROR_TEST_MODE = 11;
    public static final int ERROR_TOKEN_CONFIRMATION_REQUARED = 25;
    public static final int ERROR_TOO_MANY_REQS = 6;
    public static final int ERROR_UNKNOWN = 1;
    public static final int ERROR_USER_AUTH = 5;
    public static final int ERROR_VIDEO_ALREADY_ADDED = 800;
    private static final Handler HANDLER_UI = new Handler(Looper.getMainLooper());
    private static final char[] hex = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
    protected Callback<? super T> callback;
    Call httpCall;
    public long initTime;
    private String method;
    public boolean persistent;
    public Method persistentMethod;
    public JSONObject persistentUserData;
    public boolean persistentWithToken;
    public Handler uiHandler;
    public LinkedHashMap<String, String> params = new LinkedHashMap<>();
    private boolean cancel = false;
    ProgressDialog progressDialog = null;
    public boolean background = false;
    protected boolean ignoreValidation = false;
    public boolean handleAuthErrorsManually = false;
    public boolean unreliable3rdPartyRequest = false;

    public VKAPIRequest(String method) {
        this.method = method;
        this.params.put("method", method);
        this.params.put("v", "5.82");
        this.params.put("lang", Global.getDeviceLang());
        this.params.put(UriUtil.HTTPS_SCHEME, AppEventsConstants.EVENT_PARAM_VALUE_YES);
    }

    private static CharSequence convert(byte[] b) {
        StringBuilder ret = new StringBuilder();
        for (byte aB : b) {
            ret.append(hex[(aB & 240) >> 4]);
            ret.append(hex[aB & 15]);
        }
        return ret;
    }

    public static String md5(String h) {
        try {
            MessageDigest md = MessageDigest.getInstance(CommonUtils.MD5_INSTANCE);
            byte[] s = md.digest(h.getBytes("UTF-8"));
            return convert(s).toString();
        } catch (Exception ex) {
            L.e(ex, new Object[0]);
            return "";
        }
    }

    public String getSig() {
        return getSig(VKAccountManager.getCurrent().getSecret());
    }

    public String getSig(String secret) {
        String src = "/method/" + this.params.get("method") + "?";
        Set<String> e = this.params.keySet();
        ArrayList<String> parts = new ArrayList<>();
        for (String key : e) {
            if (!key.equals("method")) {
                parts.add(key + "=" + this.params.get(key));
            }
        }
        return md5((src + TextUtils.join("&", parts)) + secret);
    }

    public String getMethod() {
        return this.method;
    }

    public VKAPIRequest<T> param(String name, String value) {
        if (value != null) {
            this.params.put(name, value);
        }
        return this;
    }

    public VKAPIRequest<T> param(String name, int value) {
        if (value != 0) {
            this.params.put(name, Integer.toString(value));
        }
        return this;
    }

    public VKAPIRequest<T> param(String name, long value) {
        if (value != 0) {
            this.params.put(name, Long.toString(value));
        }
        return this;
    }

    public VKAPIRequest<T> params(CharSequence name, String[] values) {
        return param(name.toString(), TextUtils.join(",", values));
    }

    public VKAPIRequest<T> params(CharSequence name, Object[] values) {
        return param(name.toString(), TextUtils.join(",", values));
    }

    public VKAPIRequest<T> params(CharSequence name, Iterable values) {
        return param(name.toString(), TextUtils.join(",", values));
    }

    public VKAPIRequest<T> params(CharSequence name, int[] values) {
        StringBuilder sb = new StringBuilder();
        boolean firstTime = true;
        for (int i : values) {
            if (firstTime) {
                firstTime = false;
            } else {
                sb.append(",");
            }
            sb.append(i);
        }
        return param(name.toString(), sb.toString());
    }

    public VKAPIRequest<T> setBackground(boolean bg) {
        this.background = bg;
        return this;
    }

    public VKAPIRequest<T> ignoreValidation(boolean b) {
        this.ignoreValidation = b;
        return this;
    }

    public VKAPIRequest<T> exec() {
        APIController.executeRequest(this);
        return this;
    }

    public VKAPIRequest<T> exec(View v) {
        this.uiHandler = HANDLER_UI;
        APIController.executeRequest(this);
        return this;
    }

    public VKAPIRequest<T> exec(Context v) {
        this.uiHandler = HANDLER_UI;
        APIController.executeRequest(this);
        return this;
    }

    public VKAPIRequest<T> exec(Looper v) {
        this.uiHandler = HANDLER_UI;
        APIController.executeRequest(this);
        return this;
    }

    public VKAPIRequest<T> exec(Object o) {
        this.uiHandler = HANDLER_UI;
        APIController.executeRequest(this);
        return this;
    }

    public boolean execSync() {
        JSONObject o = APIController.runRequest(this);
        if (o == null) {
            invokeCallback(new VKErrorResponse(-2, "Response parse failed"));
            return false;
        }
        Object result = parseResponse(o);
        try {
            invokeCallback(result);
            if (APIController.API_DEBUG) {
                Log.v("vk", "[" + this.params.get("method") + "] Request done in " + (System.currentTimeMillis() - this.initTime));
            }
            return result != null && !(result instanceof VKErrorResponse);
        } catch (Exception e) {
            invokeCallback(new VKErrorResponse(-3, "Callback invocation failed (parse error?)"));
            return false;
        }
    }

    public Object execSyncWithResult() {
        JSONObject o = APIController.runRequest(this);
        if (o == null) {
            return new VKErrorResponse(-2, "Response parse failed");
        }
        Object parseResponse = parseResponse(o);
        if (APIController.API_DEBUG) {
            Log.v("vk", "[" + this.params.get("method") + "] Request done in " + (System.currentTimeMillis() - this.initTime));
            return parseResponse;
        }
        return parseResponse;
    }

    public <T> Observable<T> toObservable() {
        Observable<T> observable = Observable.create(new ObservableOnSubscribe<T>() { // from class: com.vkontakte.android.api.VKAPIRequest.1
            /* JADX WARN: Multi-variable type inference failed */
            @Override // io.reactivex.ObservableOnSubscribe
            public void subscribe(ObservableEmitter<T> e) throws Exception {
                e.setCancellable(VKAPIRequest.this);
                try {
                    JSONObject o = APIController.runRequest(VKAPIRequest.this);
                    if (!e.isDisposed()) {
                        Object result = VKAPIRequest.this.parseResponse(o);
                        if (result == null) {
                            throw new IOException("Can't parse response");
                        }
                        if (result instanceof VKErrorResponse) {
                            throw new APIException((VKErrorResponse) result);
                        }
                        if (!e.isDisposed()) {
                            e.onNext(result);
                            e.onComplete();
                        }
                    }
                } catch (Exception ex) {
                    if (!e.isDisposed()) {
                        e.onError(ex);
                    }
                }
            }
        });
        return observable.subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread());
    }

    public VKAPIRequest<T> persistWithToken() {
        this.persistentWithToken = true;
        persist(null, null);
        return this;
    }

    public VKAPIRequest<T> persist(Method callback, JSONObject userdata) {
        this.persistent = true;
        this.persistentMethod = callback;
        this.persistentUserData = userdata;
        return this;
    }

    @Override // me.grishka.appkit.api.APIRequest, io.reactivex.functions.Cancellable
    public void cancel() {
        this.cancel = true;
        if (APIController.API_DEBUG) {
            Log.i("vk", "Cancel request " + this.params.get("method"));
        }
        if (this.httpCall != null) {
            APIController.cancelerThread.postRunnable(new Runnable() { // from class: com.vkontakte.android.api.VKAPIRequest.2
                @Override // java.lang.Runnable
                public void run() {
                    if (VKAPIRequest.this.httpCall != null) {
                        VKAPIRequest.this.httpCall.cancel();
                        VKAPIRequest.this.httpCall = null;
                    }
                }
            }, 0L);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public JSONObject doExec() {
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* renamed from: parse */
    public T mo1093parse(JSONObject r) throws Exception {
        return r;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Object parseResponse(JSONObject r) {
        Object mo1093parse;
        try {
            if (this.cancel) {
                mo1093parse = null;
            } else if (r == null) {
                mo1093parse = new VKErrorResponse(-1, "I/O error");
            } else if (!r.has(ServerKeys.RESPONSE) && r.has("error")) {
                JSONObject jsonObjectError = r.getJSONObject("error");
                int errorCode = jsonObjectError.getInt(NativeProtocol.BRIDGE_ARG_ERROR_CODE);
                String errorDesc = jsonObjectError.optString("error_text");
                mo1093parse = jsonObjectError.has("error_text") ? new VKErrorResponse(1073741824 | errorCode, errorDesc, errorDesc) : new VKErrorResponse(errorCode, jsonObjectError.getString("error_msg"), errorDesc);
            } else {
                long time = System.currentTimeMillis();
                mo1093parse = mo1093parse(r);
                if (APIController.API_DEBUG) {
                    Log.v("vk", "[" + this.params.get("method") + "] Parse Data: " + (System.currentTimeMillis() - time));
                    System.currentTimeMillis();
                }
            }
            return mo1093parse;
        } catch (Exception x) {
            Log.w("vk", x);
            if (x instanceof APIException) {
                return new VKErrorResponse(((APIException) x).code, ((APIException) x).descr);
            }
            return new VKErrorResponse(-2, "Parse error");
        }
    }

    public void invokeCallback(Object result) {
        if (this.callback != null) {
            if (result instanceof VKErrorResponse) {
                this.callback.fail((VKErrorResponse) result);
            } else {
                this.callback.success(result);
            }
        }
    }

    public boolean isCanceled() {
        return this.cancel;
    }

    public VKAPIRequest<T> wrapProgress(Context context) {
        return wrapProgress(context, R.string.loading, true, false);
    }

    public VKAPIRequest<T> wrapProgress(Context context, int strRes, boolean cancelable, boolean cancelByClick) {
        this.progressDialog = new ProgressDialog(context);
        this.progressDialog.setMessage(context.getResources().getString(strRes));
        this.progressDialog.setOnCancelListener(VKAPIRequest$$Lambda$1.lambdaFactory$(this));
        this.progressDialog.setCancelable(cancelable);
        this.progressDialog.setCanceledOnTouchOutside(cancelByClick);
        this.progressDialog.show();
        if (Build.VERSION.SDK_INT < 21) {
            this.progressDialog.getWindow().setBackgroundDrawableResource(R.drawable.transparent);
        }
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$wrapProgress$0(DialogInterface dialog) {
        cancel();
    }

    public VKAPIRequest<T> setCallback(Callback<? super T> callback) {
        this.callback = callback;
        return this;
    }

    /* loaded from: classes2.dex */
    public static class VKErrorResponse extends ErrorResponse {
        private final int code;
        public final String description;
        public final String message;

        public VKErrorResponse(int code, String msg) {
            this(code, msg, null);
        }

        public VKErrorResponse(int code, String msg, String description) {
            this.code = code;
            this.message = msg;
            this.description = description;
        }

        public int getCode() {
            return this.code;
        }

        public int getCodeValue() {
            return VKAPIRequest.getValueFromErrorCode(this.code);
        }

        public String toString() {
            return "ErrorResponse{message='" + this.message + "', code=" + this.code + '}';
        }

        @Override // me.grishka.appkit.api.ErrorResponse
        public void bindErrorView(View view) {
            if (view != null) {
                ((TextView) view.findViewById(R.id.error_text)).setText(APIUtils.getLocalizedError(view.getContext(), this.code, this.message));
                ((TextView) view.findViewById(R.id.error_retry)).setText(R.string.err_try_again);
            }
        }

        @Override // me.grishka.appkit.api.ErrorResponse
        public void showToast(Context context) {
            APIUtils.showErrorToast(context, this.code, this.message);
        }
    }

    public static int getValueFromErrorCode(int code) {
        return (-1073741825) & code;
    }
}
