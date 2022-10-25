package com.google.android.gms.ads.internal.overlay;

import android.content.Context;
import android.support.annotation.Nullable;
import com.google.android.gms.internal.zzdz;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzmd;
@zzji
/* loaded from: classes.dex */
public class zzn extends zzj {
    @Override // com.google.android.gms.ads.internal.overlay.zzj
    @Nullable
    public zzi zza(Context context, zzmd zzmdVar, int i, boolean z, zzdz zzdzVar) {
        if (!zzp(context)) {
            return null;
        }
        return new zzc(context, z, zzh(zzmdVar), new zzy(context, zzmdVar.zzxf(), zzmdVar.getRequestId(), zzdzVar, zzmdVar.zzxl()));
    }
}
