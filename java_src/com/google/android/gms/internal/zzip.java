package com.google.android.gms.internal;

import com.google.android.gms.ads.purchase.PlayStorePurchaseListener;
import com.google.android.gms.internal.zzik;
@zzji
/* loaded from: classes.dex */
public final class zzip extends zzik.zza {
    private final PlayStorePurchaseListener zzbbi;

    public zzip(PlayStorePurchaseListener playStorePurchaseListener) {
        this.zzbbi = playStorePurchaseListener;
    }

    @Override // com.google.android.gms.internal.zzik
    public boolean isValidPurchase(String str) {
        return this.zzbbi.isValidPurchase(str);
    }

    @Override // com.google.android.gms.internal.zzik
    public void zza(zzij zzijVar) {
        this.zzbbi.onInAppPurchaseFinished(new zzin(zzijVar));
    }
}
