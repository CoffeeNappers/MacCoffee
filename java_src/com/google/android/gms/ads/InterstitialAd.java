package com.google.android.gms.ads;

import android.content.Context;
import android.support.annotation.RequiresPermission;
import com.google.android.gms.ads.internal.client.zzaf;
import com.google.android.gms.ads.purchase.InAppPurchaseListener;
import com.google.android.gms.ads.purchase.PlayStorePurchaseListener;
import com.google.android.gms.ads.reward.RewardedVideoAdListener;
/* loaded from: classes.dex */
public final class InterstitialAd {
    private final zzaf zzakm;

    public InterstitialAd(Context context) {
        this.zzakm = new zzaf(context);
    }

    public AdListener getAdListener() {
        return this.zzakm.getAdListener();
    }

    public String getAdUnitId() {
        return this.zzakm.getAdUnitId();
    }

    public InAppPurchaseListener getInAppPurchaseListener() {
        return this.zzakm.getInAppPurchaseListener();
    }

    public String getMediationAdapterClassName() {
        return this.zzakm.getMediationAdapterClassName();
    }

    public boolean isLoaded() {
        return this.zzakm.isLoaded();
    }

    public boolean isLoading() {
        return this.zzakm.isLoading();
    }

    @RequiresPermission("android.permission.INTERNET")
    public void loadAd(AdRequest adRequest) {
        this.zzakm.zza(adRequest.zzdt());
    }

    public void setAdListener(AdListener adListener) {
        this.zzakm.setAdListener(adListener);
        if (adListener != null && (adListener instanceof com.google.android.gms.ads.internal.client.zza)) {
            this.zzakm.zza((com.google.android.gms.ads.internal.client.zza) adListener);
        } else if (adListener != null) {
        } else {
            this.zzakm.zza((com.google.android.gms.ads.internal.client.zza) null);
        }
    }

    public void setAdUnitId(String str) {
        this.zzakm.setAdUnitId(str);
    }

    public void setInAppPurchaseListener(InAppPurchaseListener inAppPurchaseListener) {
        this.zzakm.setInAppPurchaseListener(inAppPurchaseListener);
    }

    public void setPlayStorePurchaseParams(PlayStorePurchaseListener playStorePurchaseListener, String str) {
        this.zzakm.setPlayStorePurchaseParams(playStorePurchaseListener, str);
    }

    public void setRewardedVideoAdListener(RewardedVideoAdListener rewardedVideoAdListener) {
        this.zzakm.setRewardedVideoAdListener(rewardedVideoAdListener);
    }

    public void show() {
        this.zzakm.show();
    }

    public void zzd(boolean z) {
        this.zzakm.zzd(z);
    }
}
