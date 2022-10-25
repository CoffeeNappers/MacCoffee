package com.google.android.gms.internal;

import android.content.Context;
import android.support.annotation.Nullable;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.internal.zzko;
@zzji
/* loaded from: classes.dex */
public class zziu {

    /* loaded from: classes2.dex */
    public interface zza {
        void zzb(zzko zzkoVar);
    }

    public zzld zza(Context context, com.google.android.gms.ads.internal.zza zzaVar, zzko.zza zzaVar2, zzav zzavVar, @Nullable zzmd zzmdVar, zzgz zzgzVar, zza zzaVar3, zzdz zzdzVar) {
        AdResponseParcel adResponseParcel = zzaVar2.zzcsu;
        zzld zziyVar = adResponseParcel.zzclb ? new zziy(context, zzaVar2, zzgzVar, zzaVar3, zzdzVar, zzmdVar) : (adResponseParcel.zzazt || (zzaVar instanceof com.google.android.gms.ads.internal.zzq)) ? (!adResponseParcel.zzazt || !(zzaVar instanceof com.google.android.gms.ads.internal.zzq)) ? new zziw(zzaVar2, zzaVar3) : new zziz(context, (com.google.android.gms.ads.internal.zzq) zzaVar, zzaVar2, zzavVar, zzaVar3, zzdzVar) : (!zzdr.zzbet.get().booleanValue() || !adResponseParcel.zzclh) ? (!zzdr.zzbfm.get().booleanValue() || !com.google.android.gms.common.util.zzs.zzayu() || com.google.android.gms.common.util.zzs.zzayw() || zzmdVar == null || !zzmdVar.zzeg().zzazr) ? new zziv(context, zzaVar2, zzmdVar, zzaVar3) : new zzix(context, zzaVar2, zzmdVar, zzaVar3) : new zzis(context, zzaVar2, zzmdVar, zzaVar3);
        String valueOf = String.valueOf(zziyVar.getClass().getName());
        zzkx.zzdg(valueOf.length() != 0 ? "AdRenderer: ".concat(valueOf) : new String("AdRenderer: "));
        zziyVar.zzrz();
        return zziyVar;
    }

    public zzld zza(Context context, zzko.zza zzaVar, zzkb zzkbVar) {
        zzki zzkiVar = new zzki(context, zzaVar, zzkbVar);
        String valueOf = String.valueOf(zzkiVar.getClass().getName());
        zzkx.zzdg(valueOf.length() != 0 ? "AdRenderer: ".concat(valueOf) : new String("AdRenderer: "));
        zzkiVar.zzrz();
        return zzkiVar;
    }
}
