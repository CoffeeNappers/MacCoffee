package com.vkontakte.android.api;

import android.content.Intent;
import android.net.Uri;
import android.preference.PreferenceManager;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.internal.NativeProtocol;
import com.facebook.internal.ServerProtocol;
import com.vk.core.network.Network;
import com.vk.imageloader.VKImageLoader;
import com.vkontakte.android.AppStateTracker;
import com.vkontakte.android.C2DM;
import com.vkontakte.android.CaptchaActivity;
import com.vkontakte.android.ConfirmationActivity;
import com.vkontakte.android.Log;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ValidationActivity;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.auth.VKAccount;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.auth.configs.ProfilerConfig;
import com.vkontakte.android.background.WorkerThread;
import com.vkontakte.android.cache.Cache;
import com.vkontakte.android.data.BenchmarkTracker;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.AuthCheckFragment;
import com.vkontakte.android.utils.L;
import java.io.IOException;
import java.util.Arrays;
import java.util.Set;
import java.util.concurrent.Semaphore;
import java.util.concurrent.atomic.AtomicInteger;
import okhttp3.Call;
import okhttp3.FormBody;
import okhttp3.Request;
import okhttp3.Response;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;
/* loaded from: classes2.dex */
public class APIController {
    public static final boolean API_DEBUG;
    public static final String API_URL;
    private static final long COUNTER_RESET_TIME = 2000;
    public static final String FUCKING_AD_USER_AGENT;
    private static final long MAX_REQUESTS_PER_COUNT = 10;
    public static final String USER_AGENT;
    private static final BenchmarkTracker benchmarkTracker;
    private static volatile long counterResetTime;
    private static final AtomicInteger requestCounter;
    private static Semaphore validation;
    private static WorkerThread reqThread = new WorkerThread("API Main Thread");
    private static WorkerThread bgThread = new WorkerThread("API Background Thread");
    static WorkerThread cancelerThread = new WorkerThread("API Canceler Thread");

    static {
        API_DEBUG = PreferenceManager.getDefaultSharedPreferences(VKApplication.context).getBoolean("__dbg_api", false) || VKAccountManager.getCurrent().getUid() == 62177 || VKAccountManager.getCurrent().getUid() == 185561181;
        API_URL = PreferenceManager.getDefaultSharedPreferences(VKApplication.context).getString("apiHost", "api.vk.com") + "/method/";
        validation = new Semaphore(1, true);
        requestCounter = new AtomicInteger(0);
        counterResetTime = System.currentTimeMillis();
        benchmarkTracker = BenchmarkTracker.getInstance();
        USER_AGENT = Network.getInstance().getUserAgent().userAgent();
        FUCKING_AD_USER_AGENT = Network.getInstance().getUserAgent().userAgentAd();
        reqThread.start();
        bgThread.start();
        cancelerThread.start();
    }

    public static void executeRequest(VKAPIRequest req) {
        (req.background ? bgThread : reqThread).postRunnable(new RequestRunner(req), 0L);
    }

    public static void waitTooManyRequest() {
        synchronized (requestCounter) {
            if (System.currentTimeMillis() - counterResetTime > COUNTER_RESET_TIME) {
                counterResetTime = System.currentTimeMillis();
                requestCounter.set(0);
            }
            if (requestCounter.get() > MAX_REQUESTS_PER_COUNT) {
                try {
                    long sleepTime = COUNTER_RESET_TIME - (System.currentTimeMillis() - counterResetTime);
                    L.e("sleep:", Long.valueOf(sleepTime));
                    Thread.sleep(Math.max(0L, sleepTime));
                    counterResetTime = System.currentTimeMillis();
                    requestCounter.set(0);
                } catch (Exception e) {
                }
            }
            requestCounter.incrementAndGet();
        }
    }

    public static JSONObject runRequest(VKAPIRequest<?> req) {
        return runRequest(req, 0);
    }

    private static JSONObject runRequest(VKAPIRequest<?> req, int recurseCount) {
        if (!req.ignoreValidation) {
            try {
                validation.acquire();
                validation.release();
            } catch (Exception x) {
                L.e(x, new Object[0]);
            }
        }
        waitTooManyRequest();
        long time = System.currentTimeMillis();
        req.initTime = time;
        String url = "https://" + API_URL + req.params.get("method");
        VKAccount account = VKAccountManager.getCurrent();
        ProfilerConfig profilerConfig = account.getProfilerConfig();
        boolean profilerEnabled = profilerConfig != null && profilerConfig.isApiRequests();
        try {
            try {
                if (!req.unreliable3rdPartyRequest && !req.params.containsKey("access_token")) {
                    String accessToken = VKAccountManager.getCurrent().getAccessToken();
                    if (accessToken != null) {
                        req.params.put("access_token", accessToken);
                    } else {
                        req.params.put("api_id", "2274003");
                    }
                }
                FormBody.Builder formData = new FormBody.Builder();
                Set<String> e = req.params.keySet();
                Uri.Builder uri = null;
                if (API_DEBUG) {
                    uri = Uri.parse(url).buildUpon();
                }
                if (API_DEBUG) {
                    Log.d("vk", "=====" + req.params.get("method"));
                }
                for (String key : e) {
                    if (!key.equals("method")) {
                        if (API_DEBUG) {
                            Log.d("vk", key + "=" + req.params.get(key));
                        }
                        if (API_DEBUG) {
                            uri.appendQueryParameter(key, req.params.get(key));
                        }
                        formData.add(key, req.params.get(key));
                    }
                }
                if (API_DEBUG) {
                    Log.d("vk", "=====");
                    uri.appendQueryParameter("sig", req.getSig());
                    Log.d("vk", uri.build().toString());
                }
                if (account.isReal() && !req.params.containsKey("sig") && !req.unreliable3rdPartyRequest) {
                    String sig = req.getSig();
                    formData.add("sig", sig);
                }
                Request.Builder reqBuilder = new Request.Builder().url(url).header("User-Agent", USER_AGENT).post(formData.build());
                if (profilerEnabled) {
                    reqBuilder.addHeader("X-Get-Processing-Time", AppEventsConstants.EVENT_PARAM_VALUE_YES);
                }
                Request request = reqBuilder.build();
                if (API_DEBUG) {
                    Log.v("vk", "[" + req.params.get("method") + "] Prepare: " + (System.currentTimeMillis() - time));
                    time = System.currentTimeMillis();
                }
                long timeBeforeCall = System.currentTimeMillis();
                Call call = Network.getDefaultClient().newCall(request);
                req.httpCall = call;
                Response resp = call.execute();
                if (req.isCanceled()) {
                    return null;
                }
                if (API_DEBUG) {
                    Log.v("vk", "[" + req.params.get("method") + "] Execute: " + (System.currentTimeMillis() - time));
                    time = System.currentTimeMillis();
                }
                String s = resp.body().string();
                long timeAfterCall = System.currentTimeMillis();
                if (timeAfterCall - timeBeforeCall > 0 && timeAfterCall - timeBeforeCall < 2147483647L) {
                    int timeTotal = (int) (timeAfterCall - timeBeforeCall);
                    benchmarkTracker.reportApiResponseSucceeded(timeTotal);
                    if (profilerEnabled) {
                        int timeProceed = getProceedTime(resp);
                        benchmarkTracker.addSuccessApiMeasurement(req.getMethod(), timeTotal - timeProceed, timeProceed, request.body().contentLength());
                    }
                }
                if (API_DEBUG) {
                    long delta = System.currentTimeMillis() - time;
                    Log.v("vk", "[" + req.params.get("method") + "] Receive: " + delta);
                    time = System.currentTimeMillis();
                }
                if (API_DEBUG) {
                    Log.v("vk", "Resp status=" + resp.message());
                    Log.v("vk", "Response=" + s);
                }
                req.httpCall = null;
                JSONObject obj = (JSONObject) new JSONTokener(s).nextValue();
                JSONObject error = obj.optJSONObject("error");
                if (obj.has("execute_errors")) {
                    JSONArray errs = obj.getJSONArray("execute_errors");
                    for (int i = 0; i < errs.length(); i++) {
                        JSONObject err = errs.getJSONObject(i);
                        int code = err.getInt(NativeProtocol.BRIDGE_ARG_ERROR_CODE);
                        if (code == 14 || code == 17 || code == 104 || code == 25) {
                            error = err;
                            break;
                        }
                    }
                }
                if (error != null) {
                    int code2 = error.getInt(NativeProtocol.BRIDGE_ARG_ERROR_CODE);
                    if (code2 == 5) {
                        if (req.handleAuthErrorsManually) {
                            throw new APIException(5, "auth error");
                        }
                        if ("account.unregisterDevice".equals(req.params.get("method"))) {
                            throw new APIException(0, "already unregistered");
                        }
                        if (!"account.unregisterDevice".equals(req.params.get("method"))) {
                            LongPollService.onReauthError();
                        }
                        throw new APIException(0, "reauth error");
                    } else if (code2 == 7) {
                        return obj;
                    } else {
                        if (code2 == 14) {
                            if (req.ignoreValidation) {
                                throw new APIException(1, "Current request is not support validation");
                            }
                            if (API_DEBUG) {
                                Log.i("vk", "API captcha");
                            }
                            if (!AppStateTracker.isInBackground()) {
                                try {
                                    validation.acquire();
                                } catch (Exception e2) {
                                }
                                Intent intent = new Intent(VKApplication.context, CaptchaActivity.class);
                                intent.addFlags(268435456);
                                intent.putExtra("url", error.getString("captcha_img"));
                                VKApplication.context.startActivity(intent);
                                while (!CaptchaActivity.isReady) {
                                    Thread.sleep(100L);
                                }
                                if (API_DEBUG) {
                                    Log.i("vk", "Captcha activity returned with " + CaptchaActivity.isReady + ", " + CaptchaActivity.lastKey);
                                }
                                CaptchaActivity.isReady = false;
                                if (CaptchaActivity.lastKey != null) {
                                    req.params.put("captcha_sid", error.getString("captcha_sid"));
                                    req.params.put("captcha_key", CaptchaActivity.lastKey);
                                    if (API_DEBUG) {
                                        Log.d("vk", "Resending request " + req.params.get("method"));
                                    }
                                    validation.release();
                                    return runRequest(req, recurseCount + 1);
                                }
                                validation.release();
                            } else {
                                Log.w("vk", "Skipping captcha because app is in background");
                            }
                            throw new APIException(code2, error.getString("error_msg"));
                        } else if (code2 == 16) {
                            if (API_DEBUG) {
                                Log.w("vk", "Force HTTPS");
                            }
                            return runRequest(req, recurseCount + 1);
                        } else if (code2 == 17) {
                            if (req.ignoreValidation) {
                                throw new APIException(1, "Current request is not support validation");
                            }
                            if (API_DEBUG) {
                                Log.w("vk", "Need validation");
                            }
                            if (!AppStateTracker.isInBackground()) {
                                try {
                                    validation.acquire();
                                } catch (Exception e3) {
                                }
                                Intent intent2 = new Intent(VKApplication.context, ValidationActivity.class);
                                intent2.addFlags(268435456);
                                intent2.putExtra("url", error.getString(ServerProtocol.DIALOG_PARAM_REDIRECT_URI));
                                ValidationActivity.result = 0;
                                VKApplication.context.startActivity(intent2);
                                while (ValidationActivity.result == 0) {
                                    Thread.sleep(100L);
                                }
                                if (ValidationActivity.result == 2) {
                                    ValidationActivity.result = 0;
                                    if (API_DEBUG) {
                                        Log.i("vk", "Repeating request " + req.params.get("method"));
                                    }
                                    validation.release();
                                    return runRequest(req, recurseCount + 1);
                                }
                                ValidationActivity.result = 0;
                                validation.release();
                            } else {
                                Log.w("vk", "Skipping validation because app is in background");
                            }
                            throw new APIException(code2, error.getString("error_msg"));
                        } else if (code2 == 24) {
                            if (req.ignoreValidation || req.unreliable3rdPartyRequest) {
                                throw new APIException(1, "Current request is not support validation");
                            }
                            if (API_DEBUG) {
                                Log.w("vk", "Need confirmation");
                            }
                            if (!AppStateTracker.isInBackground()) {
                                try {
                                    validation.acquire();
                                } catch (Exception e4) {
                                }
                                Intent intent3 = new Intent(VKApplication.context, ConfirmationActivity.class);
                                intent3.addFlags(268435456);
                                intent3.putExtra("confirm_text", error.getString("confirmation_text"));
                                ConfirmationActivity.ready = false;
                                VKApplication.context.startActivity(intent3);
                                while (!ConfirmationActivity.ready) {
                                    Thread.sleep(100L);
                                }
                                if (ConfirmationActivity.result) {
                                    req.param("confirm", 1);
                                    if (API_DEBUG) {
                                        Log.i("vk", "Repeating request " + req.params.get("method"));
                                    }
                                    validation.release();
                                    return runRequest(req, recurseCount + 1);
                                }
                                validation.release();
                            } else {
                                Log.w("vk", "Skipping confirmation because app is in background");
                            }
                            throw new APIException(code2, error.getString("error_msg"));
                        } else if (!req.unreliable3rdPartyRequest && code2 == 25) {
                            if ("auth.refreshToken".equals(req.params.get("method")) || recurseCount != 0) {
                                return obj;
                            }
                            VKAPIRequest tokenConfirmationRequest = new VKAPIRequest("auth.refreshToken");
                            try {
                                tokenConfirmationRequest.param("receipt", C2DM.getToken(VKApplication.context));
                            } catch (Exception e5) {
                                tokenConfirmationRequest.param("receipt", "");
                            }
                            JSONObject object = runRequest(tokenConfirmationRequest);
                            JSONObject object2 = object == null ? null : object.optJSONObject(ServerKeys.RESPONSE);
                            String accessToken2 = object2 == null ? null : object2.optString(AuthCheckFragment.KEY_TOKEN);
                            String secret = object2 == null ? null : object2.optString("secret");
                            if (!TextUtils.isEmpty(accessToken2)) {
                                VKAccountManager.updateCurrentAccessData(accessToken2, secret);
                                if (req.params.containsKey("access_token")) {
                                    req.params.put("access_token", accessToken2);
                                }
                                if (req.params.containsKey("sig")) {
                                    req.params.put("sig", req.getSig());
                                }
                                return runRequest(req, recurseCount + 1);
                            }
                            generateApiError(error);
                        } else {
                            generateApiError(error);
                        }
                    }
                }
                if (API_DEBUG) {
                    Log.v("vk", "[" + req.params.get("method") + "] Parse JSON: " + (System.currentTimeMillis() - time));
                    System.currentTimeMillis();
                }
                if (obj == null && req.persistent) {
                    try {
                        JSONObject params = new JSONObject();
                        Set<String> keys = req.params.keySet();
                        for (String key2 : keys) {
                            if (!Arrays.asList("method", "v", "access_token", "sig").contains(key2) || req.persistentWithToken) {
                                params.put(key2, req.params.get(key2));
                            }
                        }
                        Cache.putApiRequest(req.params.get("method"), params, req.persistentMethod, req.persistentUserData);
                    } catch (Exception e6) {
                    }
                }
                return obj;
            } catch (Throwable e7) {
                if (e7 instanceof OutOfMemoryError) {
                    VKImageLoader.clearMemoryCache();
                    return runRequest(req);
                }
                Log.w("vk", e7 != null ? e7.toString() : null);
                return null;
            }
        } catch (APIException e8) {
            if (profilerEnabled) {
                benchmarkTracker.addErrorApiMeasurement(req.getMethod(), 0, 0);
            }
            return null;
        } catch (IOException e9) {
            Log.w("vk", e9 != null ? e9.toString() : null);
            benchmarkTracker.reportApiResponseFailed();
            if (profilerEnabled) {
                benchmarkTracker.countFailedApiMeasurement(req.getMethod());
            }
            return null;
        }
    }

    private static void generateApiError(JSONObject error) throws JSONException {
        int code = error.getInt(NativeProtocol.BRIDGE_ARG_ERROR_CODE);
        if (error.has("error_text")) {
            throw new APIException(1073741824 | code, error.getString("error_text"));
        }
        throw new APIException(code, error.getString("error_msg"));
    }

    private static int getProceedTime(Response resp) {
        String stringValue = resp.headers().get("x-request-processing-time");
        if (stringValue == null) {
            return 0;
        }
        try {
            float value = Float.valueOf(stringValue).floatValue();
            return (int) (1000.0f * value);
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class RequestRunner implements Runnable {
        VKAPIRequest<?> r;

        public RequestRunner(VKAPIRequest req) {
            this.r = req;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (!this.r.isCanceled()) {
                try {
                    JSONObject res = this.r.doExec();
                    if (res == null) {
                        res = APIController.runRequest(this.r);
                    }
                    final boolean networkFail = res == null;
                    final Object result = res != null ? this.r.parseResponse(res) : null;
                    if (this.r.isCanceled()) {
                        if (APIController.API_DEBUG) {
                            Log.d("vk", "Request " + this.r.params.get("method") + " was canceled");
                            return;
                        }
                        return;
                    }
                    Runnable rs = new Runnable() { // from class: com.vkontakte.android.api.APIController.RequestRunner.1
                        @Override // java.lang.Runnable
                        public void run() {
                            if (result != null) {
                                try {
                                    if ((result instanceof VKAPIRequest.VKErrorResponse) && ((VKAPIRequest.VKErrorResponse) result).getCodeValue() == 14) {
                                        RequestRunner.this.r.invokeCallback(new VKAPIRequest.VKErrorResponse(14, "Flood control"));
                                    } else {
                                        RequestRunner.this.r.invokeCallback(result);
                                    }
                                } catch (Exception x) {
                                    Log.w("vk", "Callback exception", x);
                                    RequestRunner.this.r.invokeCallback(new VKAPIRequest.VKErrorResponse(-3, "Callback invocation failed (parse error?)"));
                                }
                            } else if (networkFail) {
                                if (APIController.API_DEBUG) {
                                    Log.w("vk", "Request " + RequestRunner.this.r.params.get("method") + " failed with network error");
                                }
                                RequestRunner.this.r.invokeCallback(new VKAPIRequest.VKErrorResponse(-1, "I/O Error"));
                            } else {
                                if (APIController.API_DEBUG) {
                                    Log.w("vk", "Request " + RequestRunner.this.r.params.get("method") + " failed with other error (malformed response?)");
                                }
                                RequestRunner.this.r.invokeCallback(new VKAPIRequest.VKErrorResponse(-2, "Response parse failed"));
                            }
                            if (RequestRunner.this.r.progressDialog != null && RequestRunner.this.r.progressDialog.isShowing()) {
                                ViewUtils.dismissDialogSafety(RequestRunner.this.r.progressDialog);
                            }
                        }
                    };
                    if (this.r.uiHandler != null) {
                        this.r.uiHandler.post(rs);
                    } else {
                        rs.run();
                    }
                } catch (Exception x) {
                    Log.w("vk", x);
                }
            }
        }
    }

    public static void runInBg(Runnable runnable) {
        bgThread.postRunnable(runnable, 0L);
    }

    public static void runInBgDelayed(Runnable runnable, long delay) {
        bgThread.postRunnable(runnable, delay);
    }

    public static void removeBgCallbacks(Runnable runnable) {
        bgThread.removeCallbacks(runnable);
    }

    public static void runInApi(Runnable runnable) {
        reqThread.postRunnable(runnable, 0L);
    }
}
