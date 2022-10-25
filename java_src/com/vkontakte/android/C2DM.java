package com.vkontakte.android;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.text.TextUtils;
import com.google.android.gms.gcm.GoogleCloudMessaging;
import com.google.android.gms.iid.InstanceID;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.account.C2DMRegisterDevice;
import com.vkontakte.android.api.account.C2DMUnregisterDevice;
import com.vkontakte.android.auth.VKAccount;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.utils.L;
import java.io.IOException;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes.dex */
public class C2DM {
    private static final String GCM_ID = "841415684880";
    private static final String KEY_CURRENT_USER = "current_user";
    private static final String KEY_LAST_VERSION_CODE = "version";
    private static final String KEY_REGISTER_TOKEN = "reg";
    private static final String PREFS_NAME = "gcm";
    private static final AtomicInteger countInQueue = new AtomicInteger(0);
    private static final AtomicInteger countOfRegister = new AtomicInteger(0);
    private static final AtomicInteger countOfUnregister = new AtomicInteger(0);
    private static volatile Handler handler = null;
    private static final Runnable stopHandlerRunnable = C2DM$$Lambda$2.lambdaFactory$();

    /* loaded from: classes2.dex */
    public interface ThrowableRunnable {
        void run() throws Exception;
    }

    public static /* synthetic */ void lambda$static$0() {
        synchronized (countInQueue) {
            if (countInQueue.get() == 0 && handler != null) {
                try {
                    handler.getLooper().quit();
                    handler = null;
                } catch (Exception e) {
                    L.e(e, new Object[0]);
                }
            }
        }
    }

    private static Handler getHandler() {
        Handler handler2;
        synchronized (countInQueue) {
            if (handler == null) {
                HandlerThread handlerThread = new HandlerThread("C2DM Thread");
                handlerThread.start();
                handler = new Handler(handlerThread.getLooper());
            }
            handler2 = handler;
        }
        return handler2;
    }

    private static void post(ThrowableRunnable run) {
        countInQueue.incrementAndGet();
        getHandler().post(C2DM$$Lambda$1.lambdaFactory$(run));
    }

    public static /* synthetic */ void lambda$post$1(ThrowableRunnable run) {
        try {
            try {
                run.run();
                countInQueue.decrementAndGet();
                if (countInQueue.get() == 0) {
                    new Handler(Looper.getMainLooper()).postDelayed(stopHandlerRunnable, 5000L);
                }
            } catch (Exception e) {
                L.e(e, new Object[0]);
                countInQueue.decrementAndGet();
                if (countInQueue.get() == 0) {
                    new Handler(Looper.getMainLooper()).postDelayed(stopHandlerRunnable, 5000L);
                }
            }
        } catch (Throwable th) {
            countInQueue.decrementAndGet();
            if (countInQueue.get() == 0) {
                new Handler(Looper.getMainLooper()).postDelayed(stopHandlerRunnable, 5000L);
            }
            throw th;
        }
    }

    public static String getToken(Context ctx) throws IOException {
        return InstanceID.getInstance(ctx).getToken(GCM_ID, GoogleCloudMessaging.INSTANCE_ID_SCOPE);
    }

    /* loaded from: classes2.dex */
    public static class RegisterRunnable implements ThrowableRunnable {
        final Context ctx;
        final int currentVersion;
        final SharedPreferences prefsGcm;
        final VKAccount vkAccount;

        public RegisterRunnable(Context ctx, VKAccount vkAccount, int currentVersion, SharedPreferences prefsGcm) {
            this.ctx = ctx;
            this.vkAccount = vkAccount;
            this.currentVersion = currentVersion;
            this.prefsGcm = prefsGcm;
        }

        @Override // com.vkontakte.android.C2DM.ThrowableRunnable
        public void run() throws Exception {
            L.d("Start register");
            InstanceID instanceID = InstanceID.getInstance(this.ctx);
            instanceID.deleteToken(C2DM.GCM_ID, GoogleCloudMessaging.INSTANCE_ID_SCOPE);
            String token = instanceID.getToken(C2DM.GCM_ID, GoogleCloudMessaging.INSTANCE_ID_SCOPE);
            L.d("GCM received the token:", token);
            final AtomicBoolean atomicBoolean = new AtomicBoolean(false);
            VKAPIRequest<Boolean> req = new C2DMRegisterDevice(token).param("access_token", this.vkAccount.getAccessToken());
            req.param("sig", req.getSig(this.vkAccount.getSecret())).persistWithToken().setCallback(new Callback<Boolean>() { // from class: com.vkontakte.android.C2DM.RegisterRunnable.1
                {
                    RegisterRunnable.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(Boolean result) {
                    L.d("Register device answer:", result);
                    if (result != null && result.booleanValue()) {
                        atomicBoolean.set(true);
                    }
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    L.d("Register failed");
                    atomicBoolean.set(false);
                }
            }).execSync();
            if (atomicBoolean.get()) {
                this.prefsGcm.edit().putInt(C2DM.KEY_CURRENT_USER, this.vkAccount.getUid()).putString(C2DM.KEY_REGISTER_TOKEN, token).putInt("version", this.currentVersion).apply();
                L.d("GCM subscribed");
            } else {
                instanceID.deleteToken(C2DM.GCM_ID, GoogleCloudMessaging.INSTANCE_ID_SCOPE);
                C2DM.clearData(this.prefsGcm);
                L.d("GCM did not subscribe");
            }
            synchronized (C2DM.countOfRegister) {
                C2DM.countOfRegister.decrementAndGet();
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class UnregisterRunnable implements ThrowableRunnable {
        final String accessToken;
        final Context ctx;
        final SharedPreferences prefsGcm;
        final String secret;

        public UnregisterRunnable(Context ctx, String accessToken, String secret, SharedPreferences prefsGcm) {
            this.ctx = ctx;
            this.accessToken = accessToken;
            this.secret = secret;
            this.prefsGcm = prefsGcm;
        }

        @Override // com.vkontakte.android.C2DM.ThrowableRunnable
        public void run() throws Exception {
            InstanceID.getInstance(this.ctx).deleteToken(C2DM.GCM_ID, GoogleCloudMessaging.INSTANCE_ID_SCOPE);
            L.d("Kill GCM");
            String token = this.prefsGcm.getString(C2DM.KEY_REGISTER_TOKEN, "");
            if (TextUtils.isEmpty(token)) {
                L.d("Unregister does is not need");
                C2DM.clearData(this.prefsGcm);
                synchronized (C2DM.countOfUnregister) {
                    C2DM.countOfUnregister.decrementAndGet();
                }
                return;
            }
            C2DM.clearData(this.prefsGcm);
            if (TextUtils.isEmpty(this.accessToken) || TextUtils.isEmpty(this.secret)) {
                L.d("User for unregister not found");
                synchronized (C2DM.countOfUnregister) {
                    C2DM.countOfUnregister.decrementAndGet();
                }
                return;
            }
            final AtomicBoolean atomicBoolean = new AtomicBoolean(false);
            VKAPIRequest<Boolean> req = new C2DMUnregisterDevice().param("access_token", this.accessToken);
            req.param("sig", req.getSig(this.secret)).persistWithToken().setCallback(new Callback<Boolean>() { // from class: com.vkontakte.android.C2DM.UnregisterRunnable.1
                {
                    UnregisterRunnable.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(Boolean result) {
                    L.d("Unregister device answer:", result);
                    if (result != null && result.booleanValue()) {
                        atomicBoolean.set(true);
                    }
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    L.d("Unregister failed");
                    atomicBoolean.set(false);
                }
            }).execSync();
            L.d("Unregister is", Boolean.valueOf(atomicBoolean.get()));
            synchronized (C2DM.countOfUnregister) {
                C2DM.countOfUnregister.decrementAndGet();
            }
        }
    }

    public static void clearData(SharedPreferences prefsGcm) {
        prefsGcm.edit().remove(KEY_CURRENT_USER).remove(KEY_REGISTER_TOKEN).apply();
    }

    public static void start() {
        startInner(false);
    }

    public static void checkForUpdate() {
        startInner(false);
    }

    private static void startInner(boolean force) {
        try {
            L.d(Boolean.valueOf(force), Integer.valueOf(VKAccountManager.getCurrent().getUid()));
            Context ctx = VKApplication.context;
            VKAccount vkAccount = VKAccountManager.getCurrent();
            SharedPreferences prefsGcm = ctx.getSharedPreferences("gcm", 0);
            int lastVersion = prefsGcm.getInt("version", 0);
            int currentVersion = ctx.getPackageManager().getPackageInfo(ctx.getPackageName(), 0).versionCode;
            int lastUserId = prefsGcm.getInt(KEY_CURRENT_USER, 0);
            if (vkAccount.isReal()) {
                if (lastVersion != currentVersion || lastUserId != vkAccount.getUid() || force) {
                    synchronized (countOfRegister) {
                        if (countOfRegister.get() == 0) {
                            countOfRegister.incrementAndGet();
                            post(new RegisterRunnable(ctx, vkAccount, currentVersion, prefsGcm));
                        }
                    }
                }
            }
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
    }

    public static void stopIfNeed(Context ctx) {
        SharedPreferences prefsGcm = ctx.getSharedPreferences("gcm", 0);
        int lastUserId = prefsGcm.getInt(KEY_CURRENT_USER, 0);
        L.d(Integer.valueOf(lastUserId));
        if (!VKAccountManager.getCurrent().isReal() || !VKAccountManager.isCurrentUser(lastUserId)) {
            stop();
        }
    }

    public static boolean stop() {
        L.d(new Object[0]);
        VKAccount vkAccount = VKAccountManager.getCurrent();
        return stop(vkAccount.getAccessToken(), vkAccount.getSecret());
    }

    public static boolean stop(String accessToken, String secret) {
        try {
            L.d(new Object[0]);
            Context ctx = VKApplication.context;
            SharedPreferences prefsGcm = ctx.getSharedPreferences("gcm", 0);
            synchronized (countOfUnregister) {
                if (countOfUnregister.get() == 0) {
                    countOfUnregister.incrementAndGet();
                    post(new UnregisterRunnable(ctx, accessToken, secret, prefsGcm));
                }
            }
            return true;
        } catch (Exception x) {
            L.e(x, new Object[0]);
            return false;
        }
    }
}
