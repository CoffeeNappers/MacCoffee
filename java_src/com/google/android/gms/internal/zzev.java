package com.google.android.gms.internal;

import com.google.android.gms.ads.formats.NativeAppInstallAd;
import com.google.android.gms.internal.zzeq;
@zzji
/* loaded from: classes.dex */
public class zzev extends zzeq.zza {
    private final NativeAppInstallAd.OnAppInstallAdLoadedListener zzbpe;

    public zzev(NativeAppInstallAd.OnAppInstallAdLoadedListener onAppInstallAdLoadedListener) {
        this.zzbpe = onAppInstallAdLoadedListener;
    }

    @Override // com.google.android.gms.internal.zzeq
    public void zza(zzek zzekVar) {
        this.zzbpe.onAppInstallAdLoaded(zzb(zzekVar));
    }

    zzel zzb(zzek zzekVar) {
        return new zzel(zzekVar);
    }
}
