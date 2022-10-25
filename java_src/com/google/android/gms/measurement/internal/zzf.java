package com.google.android.gms.measurement.internal;

import android.os.Handler;
import android.os.Looper;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public abstract class zzf {
    private static volatile Handler ef;
    private final zzx aqw;
    private boolean arv;
    private volatile long eg;
    private final Runnable zzw;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzf(zzx zzxVar) {
        com.google.android.gms.common.internal.zzaa.zzy(zzxVar);
        this.aqw = zzxVar;
        this.arv = true;
        this.zzw = new Runnable() { // from class: com.google.android.gms.measurement.internal.zzf.1
            @Override // java.lang.Runnable
            public void run() {
                if (Looper.myLooper() == Looper.getMainLooper()) {
                    zzf.this.aqw.zzbwa().zzm(this);
                    return;
                }
                boolean zzfy = zzf.this.zzfy();
                zzf.this.eg = 0L;
                if (!zzfy || !zzf.this.arv) {
                    return;
                }
                zzf.this.run();
            }
        };
    }

    private Handler getHandler() {
        Handler handler;
        if (ef != null) {
            return ef;
        }
        synchronized (zzf.class) {
            if (ef == null) {
                ef = new Handler(this.aqw.getContext().getMainLooper());
            }
            handler = ef;
        }
        return handler;
    }

    public void cancel() {
        this.eg = 0L;
        getHandler().removeCallbacks(this.zzw);
    }

    public abstract void run();

    public boolean zzfy() {
        return this.eg != 0;
    }

    public void zzx(long j) {
        cancel();
        if (j >= 0) {
            this.eg = this.aqw.zzabz().currentTimeMillis();
            if (getHandler().postDelayed(this.zzw, j)) {
                return;
            }
            this.aqw.zzbwb().zzbwy().zzj("Failed to schedule delayed post. time", Long.valueOf(j));
        }
    }
}
