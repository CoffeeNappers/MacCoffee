package com.google.android.c2dm;

import android.app.AlarmManager;
import android.app.IntentService;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.PowerManager;
import android.util.Log;
import java.io.IOException;
/* loaded from: classes.dex */
public abstract class C2DMBaseReceiver extends IntentService {
    private static final String C2DM_INTENT = "com.google.android.c2dm.intent.RECEIVE";
    private static final String C2DM_RETRY = "com.google.android.c2dm.intent.RETRY";
    public static final String ERR_ACCOUNT_MISSING = "ACCOUNT_MISSING";
    public static final String ERR_AUTHENTICATION_FAILED = "AUTHENTICATION_FAILED";
    public static final String ERR_INVALID_PARAMETERS = "INVALID_PARAMETERS";
    public static final String ERR_INVALID_SENDER = "INVALID_SENDER";
    public static final String ERR_PHONE_REGISTRATION_ERROR = "PHONE_REGISTRATION_ERROR";
    public static final String ERR_SERVICE_NOT_AVAILABLE = "SERVICE_NOT_AVAILABLE";
    public static final String ERR_TOO_MANY_REGISTRATIONS = "TOO_MANY_REGISTRATIONS";
    public static final String EXTRA_ERROR = "error";
    public static final String EXTRA_REGISTRATION_ID = "registration_id";
    public static final String EXTRA_UNREGISTERED = "unregistered";
    public static final String REGISTRATION_CALLBACK_INTENT = "com.google.android.c2dm.intent.REGISTRATION";
    private static final String TAG = "C2DM";
    private static final String WAKELOCK_KEY = "C2DM_LIB";
    private static PowerManager.WakeLock mWakeLock;
    private final String senderId;

    public abstract void onError(Context context, String str);

    protected abstract void onMessage(Context context, Intent intent);

    public C2DMBaseReceiver(String senderId) {
        super(senderId);
        this.senderId = senderId;
    }

    public void onRegistered(Context context, String registrationId) throws IOException {
    }

    public void onUnregistered(Context context) {
    }

    @Override // android.app.IntentService
    public final void onHandleIntent(Intent intent) {
        try {
            Context context = getApplicationContext();
            if (intent.getAction().equals(REGISTRATION_CALLBACK_INTENT)) {
                handleRegistration(context, intent);
            } else if (intent.getAction().equals(C2DM_INTENT)) {
                onMessage(context, intent);
            } else if (intent.getAction().equals(C2DM_RETRY)) {
                C2DMessaging.register(context, this.senderId);
            }
        } finally {
            mWakeLock.release();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void runIntentInService(Context context, Intent intent) {
        if (mWakeLock == null) {
            PowerManager pm = (PowerManager) context.getSystemService("power");
            mWakeLock = pm.newWakeLock(1, WAKELOCK_KEY);
        }
        mWakeLock.acquire();
        String receiver = context.getPackageName() + ".C2DMReceiver";
        intent.setClassName(context, receiver);
        context.startService(intent);
    }

    private void handleRegistration(Context context, Intent intent) {
        String registrationId = intent.getStringExtra(EXTRA_REGISTRATION_ID);
        String error = intent.getStringExtra("error");
        String removed = intent.getStringExtra(EXTRA_UNREGISTERED);
        if (Log.isLoggable(TAG, 3)) {
            Log.d(TAG, "dmControl: registrationId = " + registrationId + ", error = " + error + ", removed = " + removed);
        }
        if (removed != null) {
            C2DMessaging.clearRegistrationId(context);
            onUnregistered(context);
        } else if (error != null) {
            C2DMessaging.clearRegistrationId(context);
            Log.e(TAG, "Registration error " + error);
            onError(context, error);
            if ("SERVICE_NOT_AVAILABLE".equals(error)) {
                long backoffTimeMs = C2DMessaging.getBackoff(context);
                Log.d(TAG, "Scheduling registration retry, backoff = " + backoffTimeMs);
                Intent retryIntent = new Intent(C2DM_RETRY);
                PendingIntent retryPIntent = PendingIntent.getBroadcast(context, 0, retryIntent, 0);
                AlarmManager am = (AlarmManager) context.getSystemService("alarm");
                am.set(3, backoffTimeMs, retryPIntent);
                C2DMessaging.setBackoff(context, backoffTimeMs * 2);
            }
        } else {
            try {
                onRegistered(context, registrationId);
                C2DMessaging.setRegistrationId(context, registrationId);
            } catch (IOException ex) {
                Log.e(TAG, "Registration error " + ex.getMessage());
            }
        }
    }
}
