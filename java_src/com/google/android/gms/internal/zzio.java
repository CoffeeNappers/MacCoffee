package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.android.gms.ads.purchase.InAppPurchase;
@zzji
/* loaded from: classes.dex */
public class zzio implements InAppPurchase {
    private final zzif zzcfp;

    public zzio(zzif zzifVar) {
        this.zzcfp = zzifVar;
    }

    @Override // com.google.android.gms.ads.purchase.InAppPurchase
    public String getProductId() {
        try {
            return this.zzcfp.getProductId();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not forward getProductId to InAppPurchase", e);
            return null;
        }
    }

    @Override // com.google.android.gms.ads.purchase.InAppPurchase
    public void recordPlayBillingResolution(int i) {
        try {
            this.zzcfp.recordPlayBillingResolution(i);
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not forward recordPlayBillingResolution to InAppPurchase", e);
        }
    }

    @Override // com.google.android.gms.ads.purchase.InAppPurchase
    public void recordResolution(int i) {
        try {
            this.zzcfp.recordResolution(i);
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not forward recordResolution to InAppPurchase", e);
        }
    }
}
