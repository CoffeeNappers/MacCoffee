package com.google.android.gms.analytics.internal;

import android.os.Handler;
import android.os.Looper;
/* loaded from: classes2.dex */
abstract class zzt {
    private static volatile Handler ef;
    private final zzf cQ;
    private volatile long eg;
    private final Runnable zzw;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzt(zzf zzfVar) {
        com.google.android.gms.common.internal.zzaa.zzy(zzfVar);
        this.cQ = zzfVar;
        this.zzw = new Runnable() { // from class: com.google.android.gms.analytics.internal.zzt.1
            @Override // java.lang.Runnable
            public void run() {
                if (Looper.myLooper() == Looper.getMainLooper()) {
                    zzt.this.cQ.zzacc().zzg(this);
                    return;
                }
                boolean zzfy = zzt.this.zzfy();
                zzt.this.eg = 0L;
                if (!zzfy || zzt.zzb(zzt.this)) {
                    return;
                }
                zzt.this.run();
            }
        };
    }

    private Handler getHandler() {
        Handler handler;
        if (ef != null) {
            return ef;
        }
        synchronized (zzt.class) {
            if (ef == null) {
                ef = new Handler(this.cQ.getContext().getMainLooper());
            }
            handler = ef;
        }
        return handler;
    }

    static /* synthetic */ boolean zzb(zzt zztVar) {
        return false;
    }

    public void cancel() {
        this.eg = 0L;
        getHandler().removeCallbacks(this.zzw);
    }

    public abstract void run();

    public long zzafk() {
        if (this.eg == 0) {
            return 0L;
        }
        return Math.abs(this.cQ.zzabz().currentTimeMillis() - this.eg);
    }

    public boolean zzfy() {
        return this.eg != 0;
    }

    public void zzx(long j) {
        cancel();
        if (j >= 0) {
            this.eg = this.cQ.zzabz().currentTimeMillis();
            if (getHandler().postDelayed(this.zzw, j)) {
                return;
            }
            this.cQ.zzaca().zze("Failed to schedule delayed post. time", Long.valueOf(j));
        }
    }

    public void zzy(long j) {
        long j2 = 0;
        if (!zzfy()) {
            return;
        }
        if (j < 0) {
            cancel();
            return;
        }
        long abs = j - Math.abs(this.cQ.zzabz().currentTimeMillis() - this.eg);
        if (abs >= 0) {
            j2 = abs;
        }
        getHandler().removeCallbacks(this.zzw);
        if (getHandler().postDelayed(this.zzw, j2)) {
            return;
        }
        this.cQ.zzaca().zze("Failed to adjust delayed post. time", Long.valueOf(j2));
    }
}
