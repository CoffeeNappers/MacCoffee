package com.google.android.gms.ads.internal;

import android.os.Handler;
import android.support.annotation.Nullable;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzlb;
import java.lang.ref.WeakReference;
@zzji
/* loaded from: classes.dex */
public class zzr {
    private final zza zzapi;
    @Nullable
    private AdRequestParcel zzapj;
    private boolean zzapk;
    private boolean zzapl;
    private long zzapm;
    private final Runnable zzw;

    /* loaded from: classes.dex */
    public static class zza {
        private final Handler mHandler;

        public zza(Handler handler) {
            this.mHandler = handler;
        }

        public boolean postDelayed(Runnable runnable, long j) {
            return this.mHandler.postDelayed(runnable, j);
        }

        public void removeCallbacks(Runnable runnable) {
            this.mHandler.removeCallbacks(runnable);
        }
    }

    public zzr(com.google.android.gms.ads.internal.zza zzaVar) {
        this(zzaVar, new zza(zzlb.zzcvl));
    }

    zzr(com.google.android.gms.ads.internal.zza zzaVar, zza zzaVar2) {
        this.zzapk = false;
        this.zzapl = false;
        this.zzapm = 0L;
        this.zzapi = zzaVar2;
        final WeakReference weakReference = new WeakReference(zzaVar);
        this.zzw = new Runnable() { // from class: com.google.android.gms.ads.internal.zzr.1
            @Override // java.lang.Runnable
            public void run() {
                zzr.this.zzapk = false;
                com.google.android.gms.ads.internal.zza zzaVar3 = (com.google.android.gms.ads.internal.zza) weakReference.get();
                if (zzaVar3 != null) {
                    zzaVar3.zzd(zzr.this.zzapj);
                }
            }
        };
    }

    public void cancel() {
        this.zzapk = false;
        this.zzapi.removeCallbacks(this.zzw);
    }

    public void pause() {
        this.zzapl = true;
        if (this.zzapk) {
            this.zzapi.removeCallbacks(this.zzw);
        }
    }

    public void resume() {
        this.zzapl = false;
        if (this.zzapk) {
            this.zzapk = false;
            zza(this.zzapj, this.zzapm);
        }
    }

    public void zza(AdRequestParcel adRequestParcel, long j) {
        if (this.zzapk) {
            zzkx.zzdi("An ad refresh is already scheduled.");
            return;
        }
        this.zzapj = adRequestParcel;
        this.zzapk = true;
        this.zzapm = j;
        if (this.zzapl) {
            return;
        }
        zzkx.zzdh(new StringBuilder(65).append("Scheduling ad refresh ").append(j).append(" milliseconds from now.").toString());
        this.zzapi.postDelayed(this.zzw, j);
    }

    public boolean zzfy() {
        return this.zzapk;
    }

    public void zzg(AdRequestParcel adRequestParcel) {
        this.zzapj = adRequestParcel;
    }

    public void zzh(AdRequestParcel adRequestParcel) {
        zza(adRequestParcel, 60000L);
    }
}
