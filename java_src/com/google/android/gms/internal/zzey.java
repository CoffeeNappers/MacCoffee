package com.google.android.gms.internal;

import com.google.android.gms.ads.formats.NativeCustomTemplateAd;
import com.google.android.gms.internal.zzet;
@zzji
/* loaded from: classes.dex */
public class zzey extends zzet.zza {
    private final NativeCustomTemplateAd.OnCustomTemplateAdLoadedListener zzbph;

    public zzey(NativeCustomTemplateAd.OnCustomTemplateAdLoadedListener onCustomTemplateAdLoadedListener) {
        this.zzbph = onCustomTemplateAdLoadedListener;
    }

    @Override // com.google.android.gms.internal.zzet
    public void zza(zzeo zzeoVar) {
        this.zzbph.onCustomTemplateAdLoaded(new zzep(zzeoVar));
    }
}
