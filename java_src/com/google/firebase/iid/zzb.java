package com.google.firebase.iid;

import android.app.Service;
import android.content.Intent;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.VisibleForTesting;
import android.support.v4.content.WakefulBroadcastReceiver;
import android.util.Log;
import com.google.android.gms.iid.MessengerCompat;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
/* loaded from: classes2.dex */
public abstract class zzb extends Service {
    private int agK;
    MessengerCompat aij = new MessengerCompat(new Handler(Looper.getMainLooper()) { // from class: com.google.firebase.iid.zzb.1
        @Override // android.os.Handler
        public void handleMessage(Message message) {
            int zzc = MessengerCompat.zzc(message);
            zzf.zzdg(zzb.this);
            zzb.this.getPackageManager();
            if (zzc == zzf.aiv || zzc == zzf.aiu) {
                zzb.this.zzm((Intent) message.obj);
                return;
            }
            int i = zzf.aiu;
            Log.w("FirebaseInstanceId", new StringBuilder(77).append("Message from unexpected caller ").append(zzc).append(" mine=").append(i).append(" appid=").append(zzf.aiv).toString());
        }
    });
    @VisibleForTesting
    final ExecutorService aGI = Executors.newSingleThreadExecutor();
    private final Object zzako = new Object();
    private int agL = 0;

    /* JADX INFO: Access modifiers changed from: private */
    public void zzaf(Intent intent) {
        if (intent != null) {
            WakefulBroadcastReceiver.completeWakefulIntent(intent);
        }
        synchronized (this.zzako) {
            this.agL--;
            if (this.agL == 0) {
                zztl(this.agK);
            }
        }
    }

    @Override // android.app.Service
    public final IBinder onBind(Intent intent) {
        if (intent == null || !"com.google.firebase.INSTANCE_ID_EVENT".equals(intent.getAction())) {
            return null;
        }
        return this.aij.getBinder();
    }

    @Override // android.app.Service
    public final int onStartCommand(final Intent intent, int i, int i2) {
        synchronized (this.zzako) {
            this.agK = i2;
            this.agL++;
        }
        final Intent zzae = zzae(intent);
        if (zzae == null) {
            zzaf(intent);
            return 2;
        } else if (zzag(zzae)) {
            zzaf(intent);
            return 2;
        } else {
            this.aGI.execute(new Runnable() { // from class: com.google.firebase.iid.zzb.2
                @Override // java.lang.Runnable
                public void run() {
                    zzb.this.zzm(zzae);
                    zzb.this.zzaf(intent);
                }
            });
            return 3;
        }
    }

    protected abstract Intent zzae(Intent intent);

    public boolean zzag(Intent intent) {
        return false;
    }

    public abstract void zzm(Intent intent);

    boolean zztl(int i) {
        return stopSelfResult(i);
    }
}
