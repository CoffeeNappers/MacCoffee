package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.internal.zziu;
import com.google.android.gms.internal.zzko;
@zzji
/* loaded from: classes.dex */
public class zziw extends zzkw {
    private final zziu.zza zzcge;
    private final zzko.zza zzcgf;
    private final AdResponseParcel zzcgg;

    public zziw(zzko.zza zzaVar, zziu.zza zzaVar2) {
        this.zzcgf = zzaVar;
        this.zzcgg = this.zzcgf.zzcsu;
        this.zzcge = zzaVar2;
    }

    private zzko zzaq(int i) {
        return new zzko(this.zzcgf.zzcmx.zzcju, null, null, i, null, null, this.zzcgg.orientation, this.zzcgg.zzbvq, this.zzcgf.zzcmx.zzcjx, false, null, null, null, null, null, this.zzcgg.zzclc, this.zzcgf.zzarm, this.zzcgg.zzcla, this.zzcgf.zzcso, this.zzcgg.zzclf, this.zzcgg.zzclg, this.zzcgf.zzcsi, null, null, null, null, this.zzcgf.zzcsu.zzclt, this.zzcgf.zzcsu.zzclu, null, null, null);
    }

    @Override // com.google.android.gms.internal.zzkw
    public void onStop() {
    }

    @Override // com.google.android.gms.internal.zzkw
    public void zzfp() {
        final zzko zzaq = zzaq(0);
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zziw.1
            @Override // java.lang.Runnable
            public void run() {
                zziw.this.zzcge.zzb(zzaq);
            }
        });
    }
}
