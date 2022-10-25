package com.google.android.gms.internal;

import com.google.android.gms.ads.purchase.InAppPurchaseListener;
import com.google.android.gms.internal.zzig;
@zzji
/* loaded from: classes.dex */
public final class zzil extends zzig.zza {
    private final InAppPurchaseListener zzbbg;

    public zzil(InAppPurchaseListener inAppPurchaseListener) {
        this.zzbbg = inAppPurchaseListener;
    }

    @Override // com.google.android.gms.internal.zzig
    public void zza(zzif zzifVar) {
        this.zzbbg.onInAppPurchaseRequested(new zzio(zzifVar));
    }
}
