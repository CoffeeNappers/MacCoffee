package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zzai;
import com.google.android.gms.tagmanager.zzp;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzcu implements zzp.zze {
    private final String aDY;
    private String aEw;
    private zzbn<zzai.zzj> aGB;
    private zzt aGC;
    private final ScheduledExecutorService aGE;
    private final zza aGF;
    private ScheduledFuture<?> aGG;
    private boolean mClosed;
    private final Context mContext;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public interface zza {
        zzct zza(zzt zztVar);
    }

    /* loaded from: classes2.dex */
    interface zzb {
        ScheduledExecutorService zzcgg();
    }

    public zzcu(Context context, String str, zzt zztVar) {
        this(context, str, zztVar, null, null);
    }

    zzcu(Context context, String str, zzt zztVar, zzb zzbVar, zza zzaVar) {
        this.aGC = zztVar;
        this.mContext = context;
        this.aDY = str;
        this.aGE = (zzbVar == null ? new zzb() { // from class: com.google.android.gms.tagmanager.zzcu.1
            @Override // com.google.android.gms.tagmanager.zzcu.zzb
            public ScheduledExecutorService zzcgg() {
                return Executors.newSingleThreadScheduledExecutor();
            }
        } : zzbVar).zzcgg();
        if (zzaVar == null) {
            this.aGF = new zza() { // from class: com.google.android.gms.tagmanager.zzcu.2
                @Override // com.google.android.gms.tagmanager.zzcu.zza
                public zzct zza(zzt zztVar2) {
                    return new zzct(zzcu.this.mContext, zzcu.this.aDY, zztVar2);
                }
            };
        } else {
            this.aGF = zzaVar;
        }
    }

    private synchronized void zzcgf() {
        if (this.mClosed) {
            throw new IllegalStateException("called method after closed");
        }
    }

    private zzct zzpq(String str) {
        zzct zza2 = this.aGF.zza(this.aGC);
        zza2.zza(this.aGB);
        zza2.zzpa(this.aEw);
        zza2.zzpp(str);
        return zza2;
    }

    @Override // com.google.android.gms.common.api.Releasable
    public synchronized void release() {
        zzcgf();
        if (this.aGG != null) {
            this.aGG.cancel(false);
        }
        this.aGE.shutdown();
        this.mClosed = true;
    }

    @Override // com.google.android.gms.tagmanager.zzp.zze
    public synchronized void zza(zzbn<zzai.zzj> zzbnVar) {
        zzcgf();
        this.aGB = zzbnVar;
    }

    @Override // com.google.android.gms.tagmanager.zzp.zze
    public synchronized void zzf(long j, String str) {
        String str2 = this.aDY;
        zzbo.v(new StringBuilder(String.valueOf(str2).length() + 55).append("loadAfterDelay: containerId=").append(str2).append(" delay=").append(j).toString());
        zzcgf();
        if (this.aGB == null) {
            throw new IllegalStateException("callback must be set before loadAfterDelay() is called.");
        }
        if (this.aGG != null) {
            this.aGG.cancel(false);
        }
        this.aGG = this.aGE.schedule(zzpq(str), j, TimeUnit.MILLISECONDS);
    }

    @Override // com.google.android.gms.tagmanager.zzp.zze
    public synchronized void zzpa(String str) {
        zzcgf();
        this.aEw = str;
    }
}
