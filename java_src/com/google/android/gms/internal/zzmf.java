package com.google.android.gms.internal;

import android.content.Context;
import android.support.annotation.Nullable;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
@zzji
/* loaded from: classes.dex */
public class zzmf {
    public zzmd zza(Context context, AdSizeParcel adSizeParcel, boolean z, boolean z2, @Nullable zzav zzavVar, VersionInfoParcel versionInfoParcel) {
        return zza(context, adSizeParcel, z, z2, zzavVar, versionInfoParcel, null, null, null);
    }

    public zzmd zza(Context context, AdSizeParcel adSizeParcel, boolean z, boolean z2, @Nullable zzav zzavVar, VersionInfoParcel versionInfoParcel, zzdz zzdzVar, com.google.android.gms.ads.internal.zzs zzsVar, com.google.android.gms.ads.internal.zzd zzdVar) {
        zzmg zzmgVar = new zzmg(zzmh.zzb(context, adSizeParcel, z, z2, zzavVar, versionInfoParcel, zzdzVar, zzsVar, zzdVar));
        zzmgVar.setWebViewClient(com.google.android.gms.ads.internal.zzu.zzgo().zzb(zzmgVar, z2));
        zzmgVar.setWebChromeClient(com.google.android.gms.ads.internal.zzu.zzgo().zzn(zzmgVar));
        return zzmgVar;
    }
}
