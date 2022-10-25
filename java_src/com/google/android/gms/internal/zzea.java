package com.google.android.gms.internal;

import android.support.annotation.Nullable;
import android.view.View;
import com.google.android.gms.internal.zzec;
@zzji
/* loaded from: classes.dex */
public final class zzea extends zzec.zza {
    private final com.google.android.gms.ads.internal.zzh zzbmc;
    @Nullable
    private final String zzbmd;
    private final String zzbme;

    public zzea(com.google.android.gms.ads.internal.zzh zzhVar, @Nullable String str, String str2) {
        this.zzbmc = zzhVar;
        this.zzbmd = str;
        this.zzbme = str2;
    }

    @Override // com.google.android.gms.internal.zzec
    public String getContent() {
        return this.zzbme;
    }

    @Override // com.google.android.gms.internal.zzec
    public void recordClick() {
        this.zzbmc.zzfa();
    }

    @Override // com.google.android.gms.internal.zzec
    public void recordImpression() {
        this.zzbmc.zzfb();
    }

    @Override // com.google.android.gms.internal.zzec
    public void zzi(@Nullable com.google.android.gms.dynamic.zzd zzdVar) {
        if (zzdVar == null) {
            return;
        }
        this.zzbmc.zzc((View) com.google.android.gms.dynamic.zze.zzae(zzdVar));
    }

    @Override // com.google.android.gms.internal.zzec
    public String zzme() {
        return this.zzbmd;
    }
}
