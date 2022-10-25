package com.google.android.gms.internal;

import android.content.Intent;
import android.os.RemoteException;
import com.google.android.gms.ads.purchase.InAppPurchaseResult;
@zzji
/* loaded from: classes.dex */
public class zzin implements InAppPurchaseResult {
    private final zzij zzcgd;

    public zzin(zzij zzijVar) {
        this.zzcgd = zzijVar;
    }

    @Override // com.google.android.gms.ads.purchase.InAppPurchaseResult
    public void finishPurchase() {
        try {
            this.zzcgd.finishPurchase();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not forward finishPurchase to InAppPurchaseResult", e);
        }
    }

    @Override // com.google.android.gms.ads.purchase.InAppPurchaseResult
    public String getProductId() {
        try {
            return this.zzcgd.getProductId();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not forward getProductId to InAppPurchaseResult", e);
            return null;
        }
    }

    @Override // com.google.android.gms.ads.purchase.InAppPurchaseResult
    public Intent getPurchaseData() {
        try {
            return this.zzcgd.getPurchaseData();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not forward getPurchaseData to InAppPurchaseResult", e);
            return null;
        }
    }

    @Override // com.google.android.gms.ads.purchase.InAppPurchaseResult
    public int getResultCode() {
        try {
            return this.zzcgd.getResultCode();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not forward getPurchaseData to InAppPurchaseResult", e);
            return 0;
        }
    }

    @Override // com.google.android.gms.ads.purchase.InAppPurchaseResult
    public boolean isVerified() {
        try {
            return this.zzcgd.isVerified();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not forward isVerified to InAppPurchaseResult", e);
            return false;
        }
    }
}
