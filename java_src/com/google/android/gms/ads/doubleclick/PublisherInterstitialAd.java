package com.google.android.gms.ads.doubleclick;

import android.content.Context;
import android.support.annotation.RequiresPermission;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.Correlator;
import com.google.android.gms.ads.internal.client.zzaf;
/* loaded from: classes.dex */
public final class PublisherInterstitialAd {
    private final zzaf zzakm;

    public PublisherInterstitialAd(Context context) {
        this.zzakm = new zzaf(context, this);
    }

    public AdListener getAdListener() {
        return this.zzakm.getAdListener();
    }

    public String getAdUnitId() {
        return this.zzakm.getAdUnitId();
    }

    public AppEventListener getAppEventListener() {
        return this.zzakm.getAppEventListener();
    }

    public String getMediationAdapterClassName() {
        return this.zzakm.getMediationAdapterClassName();
    }

    public OnCustomRenderedAdLoadedListener getOnCustomRenderedAdLoadedListener() {
        return this.zzakm.getOnCustomRenderedAdLoadedListener();
    }

    public boolean isLoaded() {
        return this.zzakm.isLoaded();
    }

    public boolean isLoading() {
        return this.zzakm.isLoading();
    }

    @RequiresPermission("android.permission.INTERNET")
    public void loadAd(PublisherAdRequest publisherAdRequest) {
        this.zzakm.zza(publisherAdRequest.zzdt());
    }

    public void setAdListener(AdListener adListener) {
        this.zzakm.setAdListener(adListener);
    }

    public void setAdUnitId(String str) {
        this.zzakm.setAdUnitId(str);
    }

    public void setAppEventListener(AppEventListener appEventListener) {
        this.zzakm.setAppEventListener(appEventListener);
    }

    public void setCorrelator(Correlator correlator) {
        this.zzakm.setCorrelator(correlator);
    }

    public void setOnCustomRenderedAdLoadedListener(OnCustomRenderedAdLoadedListener onCustomRenderedAdLoadedListener) {
        this.zzakm.setOnCustomRenderedAdLoadedListener(onCustomRenderedAdLoadedListener);
    }

    public void show() {
        this.zzakm.show();
    }
}
