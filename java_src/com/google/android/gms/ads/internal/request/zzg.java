package com.google.android.gms.ads.internal.request;

import com.google.android.gms.ads.internal.request.zzc;
import com.google.android.gms.ads.internal.request.zzl;
import com.google.android.gms.internal.zzji;
import java.lang.ref.WeakReference;
@zzji
/* loaded from: classes.dex */
public final class zzg extends zzl.zza {
    private final WeakReference<zzc.zza> zzckz;

    public zzg(zzc.zza zzaVar) {
        this.zzckz = new WeakReference<>(zzaVar);
    }

    @Override // com.google.android.gms.ads.internal.request.zzl
    public void zzb(AdResponseParcel adResponseParcel) {
        zzc.zza zzaVar = this.zzckz.get();
        if (zzaVar != null) {
            zzaVar.zzb(adResponseParcel);
        }
    }
}
