package com.google.android.gms.gcm;

import android.annotation.TargetApi;
import android.app.Service;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;
import android.util.Log;
import com.vkontakte.android.data.ServerKeys;
import java.util.Iterator;
/* loaded from: classes2.dex */
public abstract class GcmListenerService extends Service {
    private int agK;
    private final Object zzako = new Object();
    private int agL = 0;

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zzac(Bundle bundle) {
        Iterator<String> it = bundle.keySet().iterator();
        while (it.hasNext()) {
            String next = it.next();
            if (next != null && next.startsWith("google.c.")) {
                it.remove();
            }
        }
    }

    private void zzbnp() {
        synchronized (this.zzako) {
            this.agL--;
            if (this.agL == 0) {
                zztl(this.agK);
            }
        }
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [com.google.android.gms.gcm.GcmListenerService$2] */
    @TargetApi(11)
    private void zzl(final Intent intent) {
        if (Build.VERSION.SDK_INT >= 11) {
            AsyncTask.THREAD_POOL_EXECUTOR.execute(new Runnable() { // from class: com.google.android.gms.gcm.GcmListenerService.1
                @Override // java.lang.Runnable
                public void run() {
                    GcmListenerService.this.zzm(intent);
                }
            });
        } else {
            new AsyncTask<Void, Void, Void>() { // from class: com.google.android.gms.gcm.GcmListenerService.2
                /* JADX INFO: Access modifiers changed from: protected */
                @Override // android.os.AsyncTask
                public Void doInBackground(Void... voidArr) {
                    GcmListenerService.this.zzm(intent);
                    return null;
                }
            }.execute(new Void[0]);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzm(Intent intent) {
        try {
            String action = intent.getAction();
            char c = 65535;
            switch (action.hashCode()) {
                case 366519424:
                    if (action.equals("com.google.android.c2dm.intent.RECEIVE")) {
                        c = 0;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    zzn(intent);
                    break;
                default:
                    String valueOf = String.valueOf(intent.getAction());
                    Log.d("GcmListenerService", valueOf.length() != 0 ? "Unknown intent action: ".concat(valueOf) : new String("Unknown intent action: "));
                    break;
            }
            zzbnp();
        } finally {
            GcmReceiver.completeWakefulIntent(intent);
        }
    }

    private void zzn(Intent intent) {
        String stringExtra = intent.getStringExtra("message_type");
        if (stringExtra == null) {
            stringExtra = GoogleCloudMessaging.MESSAGE_TYPE_MESSAGE;
        }
        char c = 65535;
        switch (stringExtra.hashCode()) {
            case -2062414158:
                if (stringExtra.equals(GoogleCloudMessaging.MESSAGE_TYPE_DELETED)) {
                    c = 1;
                    break;
                }
                break;
            case 102161:
                if (stringExtra.equals(GoogleCloudMessaging.MESSAGE_TYPE_MESSAGE)) {
                    c = 0;
                    break;
                }
                break;
            case 814694033:
                if (stringExtra.equals(GoogleCloudMessaging.MESSAGE_TYPE_SEND_ERROR)) {
                    c = 3;
                    break;
                }
                break;
            case 814800675:
                if (stringExtra.equals(GoogleCloudMessaging.MESSAGE_TYPE_SEND_EVENT)) {
                    c = 2;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                zzo(intent);
                return;
            case 1:
                onDeletedMessages();
                return;
            case 2:
                onMessageSent(intent.getStringExtra("google.message_id"));
                return;
            case 3:
                onSendError(zzp(intent), intent.getStringExtra("error"));
                return;
            default:
                String valueOf = String.valueOf(stringExtra);
                Log.w("GcmListenerService", valueOf.length() != 0 ? "Received message with unknown type: ".concat(valueOf) : new String("Received message with unknown type: "));
                return;
        }
    }

    private void zzo(Intent intent) {
        Bundle extras = intent.getExtras();
        extras.remove("message_type");
        extras.remove("android.support.content.wakelockid");
        if (zza.zzad(extras)) {
            if (!zza.zzda(this)) {
                zza.zzcz(this).zzaf(extras);
                return;
            }
            zza.zzae(extras);
        }
        String string = extras.getString(ServerKeys.FROM);
        extras.remove(ServerKeys.FROM);
        zzac(extras);
        onMessageReceived(string, extras);
    }

    private String zzp(Intent intent) {
        String stringExtra = intent.getStringExtra("google.message_id");
        return stringExtra == null ? intent.getStringExtra("message_id") : stringExtra;
    }

    @Override // android.app.Service
    public final IBinder onBind(Intent intent) {
        return null;
    }

    public void onDeletedMessages() {
    }

    public void onMessageReceived(String str, Bundle bundle) {
    }

    public void onMessageSent(String str) {
    }

    public void onSendError(String str, String str2) {
    }

    @Override // android.app.Service
    public final int onStartCommand(Intent intent, int i, int i2) {
        synchronized (this.zzako) {
            this.agK = i2;
            this.agL++;
        }
        if (intent == null) {
            zzbnp();
            return 2;
        }
        zzl(intent);
        return 3;
    }

    boolean zztl(int i) {
        return stopSelfResult(i);
    }
}
