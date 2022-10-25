package com.google.android.gms.ads.internal;

import android.app.Activity;
import android.content.Context;
import android.os.RemoteException;
import android.support.annotation.Keep;
import android.support.annotation.Nullable;
import android.widget.FrameLayout;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.zzx;
import com.google.android.gms.ads.internal.client.zzz;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.common.util.DynamiteApi;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzei;
import com.google.android.gms.internal.zzgc;
import com.google.android.gms.internal.zzgz;
import com.google.android.gms.internal.zzhy;
import com.google.android.gms.internal.zzih;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzka;
@Keep
@zzji
@DynamiteApi
/* loaded from: classes.dex */
public class ClientApi extends zzx.zza {
    @Override // com.google.android.gms.ads.internal.client.zzx
    public com.google.android.gms.ads.internal.client.zzs createAdLoaderBuilder(com.google.android.gms.dynamic.zzd zzdVar, String str, zzgz zzgzVar, int i) {
        return new zzk((Context) com.google.android.gms.dynamic.zze.zzae(zzdVar), str, zzgzVar, new VersionInfoParcel(9877000, i, true), zzd.zzfd());
    }

    @Override // com.google.android.gms.ads.internal.client.zzx
    public zzhy createAdOverlay(com.google.android.gms.dynamic.zzd zzdVar) {
        return new com.google.android.gms.ads.internal.overlay.zzd((Activity) com.google.android.gms.dynamic.zze.zzae(zzdVar));
    }

    @Override // com.google.android.gms.ads.internal.client.zzx
    public com.google.android.gms.ads.internal.client.zzu createBannerAdManager(com.google.android.gms.dynamic.zzd zzdVar, AdSizeParcel adSizeParcel, String str, zzgz zzgzVar, int i) throws RemoteException {
        return new zzf((Context) com.google.android.gms.dynamic.zze.zzae(zzdVar), adSizeParcel, str, zzgzVar, new VersionInfoParcel(9877000, i, true), zzd.zzfd());
    }

    @Override // com.google.android.gms.ads.internal.client.zzx
    public zzih createInAppPurchaseManager(com.google.android.gms.dynamic.zzd zzdVar) {
        return new com.google.android.gms.ads.internal.purchase.zze((Activity) com.google.android.gms.dynamic.zze.zzae(zzdVar));
    }

    @Override // com.google.android.gms.ads.internal.client.zzx
    public com.google.android.gms.ads.internal.client.zzu createInterstitialAdManager(com.google.android.gms.dynamic.zzd zzdVar, AdSizeParcel adSizeParcel, String str, zzgz zzgzVar, int i) throws RemoteException {
        Context context = (Context) com.google.android.gms.dynamic.zze.zzae(zzdVar);
        zzdr.initialize(context);
        VersionInfoParcel versionInfoParcel = new VersionInfoParcel(9877000, i, true);
        boolean equals = "reward_mb".equals(adSizeParcel.zzazq);
        return (!equals && zzdr.zzbgg.get().booleanValue()) || (equals && zzdr.zzbgh.get().booleanValue()) ? new zzgc(context, str, zzgzVar, versionInfoParcel, zzd.zzfd()) : new zzl(context, adSizeParcel, str, zzgzVar, versionInfoParcel, zzd.zzfd());
    }

    @Override // com.google.android.gms.ads.internal.client.zzx
    public zzei createNativeAdViewDelegate(com.google.android.gms.dynamic.zzd zzdVar, com.google.android.gms.dynamic.zzd zzdVar2) {
        return new com.google.android.gms.ads.internal.formats.zzl((FrameLayout) com.google.android.gms.dynamic.zze.zzae(zzdVar), (FrameLayout) com.google.android.gms.dynamic.zze.zzae(zzdVar2));
    }

    @Override // com.google.android.gms.ads.internal.client.zzx
    public com.google.android.gms.ads.internal.reward.client.zzb createRewardedVideoAd(com.google.android.gms.dynamic.zzd zzdVar, zzgz zzgzVar, int i) {
        return new zzka((Context) com.google.android.gms.dynamic.zze.zzae(zzdVar), zzd.zzfd(), zzgzVar, new VersionInfoParcel(9877000, i, true));
    }

    @Override // com.google.android.gms.ads.internal.client.zzx
    public com.google.android.gms.ads.internal.client.zzu createSearchAdManager(com.google.android.gms.dynamic.zzd zzdVar, AdSizeParcel adSizeParcel, String str, int i) throws RemoteException {
        return new zzt((Context) com.google.android.gms.dynamic.zze.zzae(zzdVar), adSizeParcel, str, new VersionInfoParcel(9877000, i, true));
    }

    @Override // com.google.android.gms.ads.internal.client.zzx
    @Nullable
    public zzz getMobileAdsSettingsManager(com.google.android.gms.dynamic.zzd zzdVar) {
        return null;
    }

    @Override // com.google.android.gms.ads.internal.client.zzx
    public zzz getMobileAdsSettingsManagerWithClientJarVersion(com.google.android.gms.dynamic.zzd zzdVar, int i) {
        return zzo.zza((Context) com.google.android.gms.dynamic.zze.zzae(zzdVar), new VersionInfoParcel(9877000, i, true));
    }
}
