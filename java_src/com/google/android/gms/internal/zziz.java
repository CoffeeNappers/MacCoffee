package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.internal.zziu;
import com.google.android.gms.internal.zzko;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
@zzji
/* loaded from: classes.dex */
public class zziz extends zzkw {
    private final Object zzako;
    private final zziu.zza zzcge;
    private final zzko.zza zzcgf;
    private final AdResponseParcel zzcgg;
    private final zzjb zzchg;
    private Future<zzko> zzchh;

    public zziz(Context context, com.google.android.gms.ads.internal.zzq zzqVar, zzko.zza zzaVar, zzav zzavVar, zziu.zza zzaVar2, zzdz zzdzVar) {
        this(zzaVar, zzaVar2, new zzjb(context, zzqVar, new zzli(context), zzavVar, zzaVar, zzdzVar));
    }

    zziz(zzko.zza zzaVar, zziu.zza zzaVar2, zzjb zzjbVar) {
        this.zzako = new Object();
        this.zzcgf = zzaVar;
        this.zzcgg = zzaVar.zzcsu;
        this.zzcge = zzaVar2;
        this.zzchg = zzjbVar;
    }

    private zzko zzaq(int i) {
        return new zzko(this.zzcgf.zzcmx.zzcju, null, null, i, null, null, this.zzcgg.orientation, this.zzcgg.zzbvq, this.zzcgf.zzcmx.zzcjx, false, null, null, null, null, null, this.zzcgg.zzclc, this.zzcgf.zzarm, this.zzcgg.zzcla, this.zzcgf.zzcso, this.zzcgg.zzclf, this.zzcgg.zzclg, this.zzcgf.zzcsi, null, null, null, null, this.zzcgf.zzcsu.zzclt, this.zzcgf.zzcsu.zzclu, null, null, this.zzcgg.zzclx);
    }

    @Override // com.google.android.gms.internal.zzkw
    public void onStop() {
        synchronized (this.zzako) {
            if (this.zzchh != null) {
                this.zzchh.cancel(true);
            }
        }
    }

    @Override // com.google.android.gms.internal.zzkw
    public void zzfp() {
        int i;
        final zzko zzkoVar;
        try {
            synchronized (this.zzako) {
                this.zzchh = zzla.zza(this.zzchg);
            }
            zzkoVar = this.zzchh.get(60000L, TimeUnit.MILLISECONDS);
            i = -2;
        } catch (InterruptedException e) {
            zzkoVar = null;
            i = 0;
        } catch (CancellationException e2) {
            zzkoVar = null;
            i = 0;
        } catch (ExecutionException e3) {
            zzkoVar = null;
            i = 0;
        } catch (TimeoutException e4) {
            zzkx.zzdi("Timed out waiting for native ad.");
            this.zzchh.cancel(true);
            i = 2;
            zzkoVar = null;
        }
        if (zzkoVar == null) {
            zzkoVar = zzaq(i);
        }
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zziz.1
            @Override // java.lang.Runnable
            public void run() {
                zziz.this.zzcge.zzb(zzkoVar);
            }
        });
    }
}
