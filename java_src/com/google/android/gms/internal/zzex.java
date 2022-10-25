package com.google.android.gms.internal;

import com.google.android.gms.ads.formats.NativeCustomTemplateAd;
import com.google.android.gms.internal.zzes;
@zzji
/* loaded from: classes.dex */
public class zzex extends zzes.zza {
    private final NativeCustomTemplateAd.OnCustomClickListener zzbpg;

    public zzex(NativeCustomTemplateAd.OnCustomClickListener onCustomClickListener) {
        this.zzbpg = onCustomClickListener;
    }

    @Override // com.google.android.gms.internal.zzes
    public void zza(zzeo zzeoVar, String str) {
        this.zzbpg.onCustomClick(new zzep(zzeoVar), str);
    }
}
