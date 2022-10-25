package com.google.android.gms.internal;

import java.util.concurrent.Future;
@zzji
/* loaded from: classes.dex */
public abstract class zzkw implements zzld<Future> {
    private volatile Thread zzcur;
    private boolean zzcus;
    private final Runnable zzw;

    public zzkw() {
        this.zzw = new Runnable() { // from class: com.google.android.gms.internal.zzkw.1
            @Override // java.lang.Runnable
            public final void run() {
                zzkw.this.zzcur = Thread.currentThread();
                zzkw.this.zzfp();
            }
        };
        this.zzcus = false;
    }

    public zzkw(boolean z) {
        this.zzw = new Runnable() { // from class: com.google.android.gms.internal.zzkw.1
            @Override // java.lang.Runnable
            public final void run() {
                zzkw.this.zzcur = Thread.currentThread();
                zzkw.this.zzfp();
            }
        };
        this.zzcus = z;
    }

    @Override // com.google.android.gms.internal.zzld
    public final void cancel() {
        onStop();
        if (this.zzcur != null) {
            this.zzcur.interrupt();
        }
    }

    public abstract void onStop();

    public abstract void zzfp();

    @Override // com.google.android.gms.internal.zzld
    /* renamed from: zzvm */
    public final Future zzrz() {
        return this.zzcus ? zzla.zza(1, this.zzw) : zzla.zza(this.zzw);
    }
}
