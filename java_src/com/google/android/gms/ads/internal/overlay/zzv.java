package com.google.android.gms.ads.internal.overlay;

import android.annotation.TargetApi;
import android.graphics.SurfaceTexture;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzlb;
import java.util.concurrent.TimeUnit;
@zzji
@TargetApi(14)
/* loaded from: classes.dex */
public class zzv {
    private long zzccq;
    private final long zzccp = TimeUnit.MILLISECONDS.toNanos(zzdr.zzbdy.get().longValue());
    private boolean zzccr = true;

    public void zza(SurfaceTexture surfaceTexture, final zzh zzhVar) {
        if (zzhVar == null) {
            return;
        }
        long timestamp = surfaceTexture.getTimestamp();
        if (!this.zzccr && Math.abs(timestamp - this.zzccq) < this.zzccp) {
            return;
        }
        this.zzccr = false;
        this.zzccq = timestamp;
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.overlay.zzv.1
            @Override // java.lang.Runnable
            public void run() {
                zzhVar.zzqg();
            }
        });
    }

    public void zzqd() {
        this.zzccr = true;
    }
}
