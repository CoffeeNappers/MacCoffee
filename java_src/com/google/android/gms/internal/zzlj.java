package com.google.android.gms.internal;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
@zzji
/* loaded from: classes.dex */
public class zzlj {
    private HandlerThread zzcxc = null;
    private Handler mHandler = null;
    private int zzcxd = 0;
    private final Object zzako = new Object();

    public Looper zzwj() {
        Looper looper;
        synchronized (this.zzako) {
            if (this.zzcxd != 0) {
                com.google.android.gms.common.internal.zzaa.zzb(this.zzcxc, "Invalid state: mHandlerThread should already been initialized.");
            } else if (this.zzcxc == null) {
                zzkx.v("Starting the looper thread.");
                this.zzcxc = new HandlerThread("LooperProvider");
                this.zzcxc.start();
                this.mHandler = new Handler(this.zzcxc.getLooper());
                zzkx.v("Looper thread started.");
            } else {
                zzkx.v("Resuming the looper thread");
                this.zzako.notifyAll();
            }
            this.zzcxd++;
            looper = this.zzcxc.getLooper();
        }
        return looper;
    }

    public void zzwk() {
        synchronized (this.zzako) {
            com.google.android.gms.common.internal.zzaa.zzb(this.zzcxd > 0, "Invalid state: release() called more times than expected.");
            int i = this.zzcxd - 1;
            this.zzcxd = i;
            if (i == 0) {
                this.mHandler.post(new Runnable() { // from class: com.google.android.gms.internal.zzlj.1
                    @Override // java.lang.Runnable
                    public void run() {
                        synchronized (zzlj.this.zzako) {
                            zzkx.v("Suspending the looper thread");
                            while (zzlj.this.zzcxd == 0) {
                                try {
                                    zzlj.this.zzako.wait();
                                    zzkx.v("Looper thread resumed");
                                } catch (InterruptedException e) {
                                    zzkx.v("Looper thread interrupted.");
                                }
                            }
                        }
                    }
                });
            }
        }
    }
}
