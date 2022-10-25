package com.google.android.gms.internal;

import com.google.android.gms.ads.formats.NativeContentAd;
import com.google.android.gms.internal.zzer;
@zzji
/* loaded from: classes.dex */
public class zzew extends zzer.zza {
    private final NativeContentAd.OnContentAdLoadedListener zzbpf;

    public zzew(NativeContentAd.OnContentAdLoadedListener onContentAdLoadedListener) {
        this.zzbpf = onContentAdLoadedListener;
    }

    @Override // com.google.android.gms.internal.zzer
    public void zza(zzem zzemVar) {
        this.zzbpf.onContentAdLoaded(zzb(zzemVar));
    }

    zzen zzb(zzem zzemVar) {
        return new zzen(zzemVar);
    }
}
