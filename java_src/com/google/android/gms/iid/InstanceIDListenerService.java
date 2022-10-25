package com.google.android.gms.iid;

import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;
import android.support.v4.content.WakefulBroadcastReceiver;
import android.util.Log;
import com.facebook.internal.NativeProtocol;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.c2dm.C2DMBaseReceiver;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class InstanceIDListenerService extends Service {
    MessengerCompat aij = new MessengerCompat(new Handler(Looper.getMainLooper()) { // from class: com.google.android.gms.iid.InstanceIDListenerService.1
        @Override // android.os.Handler
        public void handleMessage(Message message) {
            InstanceIDListenerService.this.zza(message, MessengerCompat.zzc(message));
        }
    });
    BroadcastReceiver aik = new BroadcastReceiver() { // from class: com.google.android.gms.iid.InstanceIDListenerService.2
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if (Log.isLoggable("InstanceID", 3)) {
                intent.getStringExtra(C2DMBaseReceiver.EXTRA_REGISTRATION_ID);
                String valueOf = String.valueOf(intent.getExtras());
                Log.d("InstanceID", new StringBuilder(String.valueOf(valueOf).length() + 46).append("Received GSF callback using dynamic receiver: ").append(valueOf).toString());
            }
            InstanceIDListenerService.this.zzn(intent);
            InstanceIDListenerService.this.stop();
        }
    };
    int ain;
    int aio;
    static String ACTION = NativeProtocol.WEB_DIALOG_ACTION;
    private static String ail = "google.com/iid";
    private static String aim = "CMD";
    private static String agS = "gcm.googleapis.com/refresh";

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(Context context, zzd zzdVar) {
        zzdVar.zzbop();
        Intent intent = new Intent("com.google.android.gms.iid.InstanceID");
        intent.putExtra(aim, "RST");
        intent.setPackage(context.getPackageName());
        context.startService(intent);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zza(Message message, int i) {
        zzc.zzdg(this);
        getPackageManager();
        if (i == zzc.aiv || i == zzc.aiu) {
            zzn((Intent) message.obj);
            return;
        }
        int i2 = zzc.aiu;
        Log.w("InstanceID", new StringBuilder(77).append("Message from unexpected caller ").append(i).append(" mine=").append(i2).append(" appid=").append(zzc.aiv).toString());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zzdf(Context context) {
        Intent intent = new Intent("com.google.android.gms.iid.InstanceID");
        intent.setPackage(context.getPackageName());
        intent.putExtra(aim, "SYNC");
        context.startService(intent);
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        if (intent == null || !"com.google.android.gms.iid.InstanceID".equals(intent.getAction())) {
            return null;
        }
        return this.aij.getBinder();
    }

    @Override // android.app.Service
    public void onCreate() {
        IntentFilter intentFilter = new IntentFilter(C2DMBaseReceiver.REGISTRATION_CALLBACK_INTENT);
        intentFilter.addCategory(getPackageName());
        registerReceiver(this.aik, intentFilter, "com.google.android.c2dm.permission.RECEIVE", null);
    }

    @Override // android.app.Service
    public void onDestroy() {
        unregisterReceiver(this.aik);
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        Intent intent2;
        zztu(i2);
        if (intent == null) {
            return 2;
        }
        try {
            if ("com.google.android.gms.iid.InstanceID".equals(intent.getAction())) {
                if (Build.VERSION.SDK_INT <= 18 && (intent2 = (Intent) intent.getParcelableExtra("GSF")) != null) {
                    startService(intent2);
                    stop();
                    return 1;
                }
                zzn(intent);
            }
            stop();
            if (intent.getStringExtra(ServerKeys.FROM) != null) {
                WakefulBroadcastReceiver.completeWakefulIntent(intent);
            }
            return 2;
        } finally {
            stop();
        }
    }

    public void onTokenRefresh() {
    }

    void stop() {
        synchronized (this) {
            this.ain--;
            if (this.ain == 0) {
                stopSelf(this.aio);
            }
            if (Log.isLoggable("InstanceID", 3)) {
                Log.d("InstanceID", new StringBuilder(28).append("Stop ").append(this.ain).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(this.aio).toString());
            }
        }
    }

    public void zzcc(boolean z) {
        onTokenRefresh();
    }

    public void zzn(Intent intent) {
        InstanceID zza;
        String stringExtra = intent.getStringExtra("subtype");
        if (stringExtra == null) {
            zza = InstanceID.getInstance(this);
        } else {
            Bundle bundle = new Bundle();
            bundle.putString("subtype", stringExtra);
            zza = InstanceID.zza(this, bundle);
        }
        String stringExtra2 = intent.getStringExtra(aim);
        if (intent.getStringExtra("error") != null || intent.getStringExtra(C2DMBaseReceiver.EXTRA_REGISTRATION_ID) != null) {
            if (Log.isLoggable("InstanceID", 3)) {
                String valueOf = String.valueOf(stringExtra);
                Log.d("InstanceID", valueOf.length() != 0 ? "Register result in service ".concat(valueOf) : new String("Register result in service "));
            }
            zza.zzbol().zzv(intent);
            return;
        }
        if (Log.isLoggable("InstanceID", 3)) {
            String valueOf2 = String.valueOf(intent.getExtras());
            Log.d("InstanceID", new StringBuilder(String.valueOf(stringExtra).length() + 18 + String.valueOf(stringExtra2).length() + String.valueOf(valueOf2).length()).append("Service command ").append(stringExtra).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(stringExtra2).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(valueOf2).toString());
        }
        if (intent.getStringExtra(C2DMBaseReceiver.EXTRA_UNREGISTERED) != null) {
            zzd zzbok = zza.zzbok();
            if (stringExtra == null) {
                stringExtra = "";
            }
            zzbok.zzku(stringExtra);
            zza.zzbol().zzv(intent);
        } else if (agS.equals(intent.getStringExtra(ServerKeys.FROM))) {
            zza.zzbok().zzku(stringExtra);
            zzcc(false);
        } else if ("RST".equals(stringExtra2)) {
            zza.zzboj();
            zzcc(true);
        } else if ("RST_FULL".equals(stringExtra2)) {
            if (zza.zzbok().isEmpty()) {
                return;
            }
            zza.zzbok().zzbop();
            zzcc(true);
        } else if (!"SYNC".equals(stringExtra2)) {
            if ("PING".equals(stringExtra2)) {
            }
        } else {
            zza.zzbok().zzku(stringExtra);
            zzcc(false);
        }
    }

    void zztu(int i) {
        synchronized (this) {
            this.ain++;
            if (i > this.aio) {
                this.aio = i;
            }
        }
    }
}
