package com.google.android.gms.tagmanager;

import android.content.Context;
import android.os.Handler;
import android.os.Message;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzdc extends zzdb {
    private static final Object aHk = new Object();
    private static zzdc aHw;
    private Context aHl;
    private zzaw aHm;
    private volatile zzau aHn;
    private zza aHt;
    private zzbt aHu;
    private int aHo = 1800000;
    private boolean aHp = true;
    private boolean aHq = false;
    private boolean connected = true;
    private boolean aHr = true;
    private zzax aHs = new zzax() { // from class: com.google.android.gms.tagmanager.zzdc.1
        @Override // com.google.android.gms.tagmanager.zzax
        public void zzcn(boolean z) {
            zzdc.this.zze(z, zzdc.this.connected);
        }
    };
    private boolean aHv = false;

    /* loaded from: classes2.dex */
    public interface zza {
        void cancel();

        void zzcgy();

        void zzx(long j);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class zzb implements zza {
        private Handler handler;

        private zzb() {
            this.handler = new Handler(zzdc.this.aHl.getMainLooper(), new Handler.Callback() { // from class: com.google.android.gms.tagmanager.zzdc.zzb.1
                @Override // android.os.Handler.Callback
                public boolean handleMessage(Message message) {
                    if (1 == message.what && zzdc.aHk.equals(message.obj)) {
                        zzdc.this.dispatch();
                        if (!zzdc.this.isPowerSaveMode()) {
                            zzb.this.zzx(zzdc.this.aHo);
                        }
                    }
                    return true;
                }
            });
        }

        private Message obtainMessage() {
            return this.handler.obtainMessage(1, zzdc.aHk);
        }

        @Override // com.google.android.gms.tagmanager.zzdc.zza
        public void cancel() {
            this.handler.removeMessages(1, zzdc.aHk);
        }

        @Override // com.google.android.gms.tagmanager.zzdc.zza
        public void zzcgy() {
            this.handler.removeMessages(1, zzdc.aHk);
            this.handler.sendMessage(obtainMessage());
        }

        @Override // com.google.android.gms.tagmanager.zzdc.zza
        public void zzx(long j) {
            this.handler.removeMessages(1, zzdc.aHk);
            this.handler.sendMessageDelayed(obtainMessage(), j);
        }
    }

    private zzdc() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isPowerSaveMode() {
        return this.aHv || !this.connected || this.aHo <= 0;
    }

    private void zzadp() {
        if (isPowerSaveMode()) {
            this.aHt.cancel();
            zzbo.v("PowerSaveMode initiated.");
            return;
        }
        this.aHt.zzx(this.aHo);
        zzbo.v("PowerSaveMode terminated.");
    }

    public static zzdc zzcgt() {
        if (aHw == null) {
            aHw = new zzdc();
        }
        return aHw;
    }

    private void zzcgu() {
        this.aHu = new zzbt(this);
        this.aHu.zzef(this.aHl);
    }

    private void zzcgv() {
        this.aHt = new zzb();
        if (this.aHo > 0) {
            this.aHt.zzx(this.aHo);
        }
    }

    @Override // com.google.android.gms.tagmanager.zzdb
    public synchronized void dispatch() {
        if (!this.aHq) {
            zzbo.v("Dispatch call queued. Dispatch will run once initialization is complete.");
            this.aHp = true;
        } else {
            this.aHn.zzp(new Runnable() { // from class: com.google.android.gms.tagmanager.zzdc.2
                @Override // java.lang.Runnable
                public void run() {
                    zzdc.this.aHm.dispatch();
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public synchronized void zza(Context context, zzau zzauVar) {
        if (this.aHl == null) {
            this.aHl = context.getApplicationContext();
            if (this.aHn == null) {
                this.aHn = zzauVar;
            }
        }
    }

    @Override // com.google.android.gms.tagmanager.zzdb
    public synchronized void zzabv() {
        if (!isPowerSaveMode()) {
            this.aHt.zzcgy();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public synchronized zzaw zzcgw() {
        if (this.aHm == null) {
            if (this.aHl == null) {
                throw new IllegalStateException("Cant get a store unless we have a context");
            }
            this.aHm = new zzcg(this.aHs, this.aHl);
        }
        if (this.aHt == null) {
            zzcgv();
        }
        this.aHq = true;
        if (this.aHp) {
            dispatch();
            this.aHp = false;
        }
        if (this.aHu == null && this.aHr) {
            zzcgu();
        }
        return this.aHm;
    }

    @Override // com.google.android.gms.tagmanager.zzdb
    public synchronized void zzco(boolean z) {
        zze(this.aHv, z);
    }

    synchronized void zze(boolean z, boolean z2) {
        boolean isPowerSaveMode = isPowerSaveMode();
        this.aHv = z;
        this.connected = z2;
        if (isPowerSaveMode() != isPowerSaveMode) {
            zzadp();
        }
    }
}
