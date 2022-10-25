package com.google.android.gms.ads.mediation.customevent;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.mediation.MediationAdRequest;
import com.google.android.gms.ads.mediation.MediationBannerAdapter;
import com.google.android.gms.ads.mediation.MediationBannerListener;
import com.google.android.gms.ads.mediation.MediationInterstitialAdapter;
import com.google.android.gms.ads.mediation.MediationInterstitialListener;
import com.google.android.gms.ads.mediation.MediationNativeAdapter;
import com.google.android.gms.ads.mediation.MediationNativeListener;
import com.google.android.gms.ads.mediation.NativeAdMapper;
import com.google.android.gms.ads.mediation.NativeMediationAdRequest;
import com.google.android.gms.ads.reward.mediation.MediationRewardedVideoAdAdapter;
import com.google.android.gms.common.annotation.KeepName;
@KeepName
/* loaded from: classes.dex */
public final class CustomEventAdapter implements MediationBannerAdapter, MediationInterstitialAdapter, MediationNativeAdapter {
    CustomEventBanner S;
    CustomEventInterstitial T;
    CustomEventNative U;
    private View zzgw;

    /* loaded from: classes.dex */
    static final class zza implements CustomEventBannerListener {
        private final CustomEventAdapter V;
        private final MediationBannerListener zzgo;

        public zza(CustomEventAdapter customEventAdapter, MediationBannerListener mediationBannerListener) {
            this.V = customEventAdapter;
            this.zzgo = mediationBannerListener;
        }

        @Override // com.google.android.gms.ads.mediation.customevent.CustomEventListener
        public void onAdClicked() {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Custom event adapter called onAdClicked.");
            this.zzgo.onAdClicked(this.V);
        }

        @Override // com.google.android.gms.ads.mediation.customevent.CustomEventListener
        public void onAdClosed() {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Custom event adapter called onAdClosed.");
            this.zzgo.onAdClosed(this.V);
        }

        @Override // com.google.android.gms.ads.mediation.customevent.CustomEventListener
        public void onAdFailedToLoad(int i) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Custom event adapter called onAdFailedToLoad.");
            this.zzgo.onAdFailedToLoad(this.V, i);
        }

        @Override // com.google.android.gms.ads.mediation.customevent.CustomEventListener
        public void onAdLeftApplication() {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Custom event adapter called onAdLeftApplication.");
            this.zzgo.onAdLeftApplication(this.V);
        }

        @Override // com.google.android.gms.ads.mediation.customevent.CustomEventBannerListener
        public void onAdLoaded(View view) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Custom event adapter called onAdLoaded.");
            this.V.zza(view);
            this.zzgo.onAdLoaded(this.V);
        }

        @Override // com.google.android.gms.ads.mediation.customevent.CustomEventListener
        public void onAdOpened() {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Custom event adapter called onAdOpened.");
            this.zzgo.onAdOpened(this.V);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public class zzb implements CustomEventInterstitialListener {
        private final CustomEventAdapter V;
        private final MediationInterstitialListener zzgp;

        public zzb(CustomEventAdapter customEventAdapter, MediationInterstitialListener mediationInterstitialListener) {
            this.V = customEventAdapter;
            this.zzgp = mediationInterstitialListener;
        }

        @Override // com.google.android.gms.ads.mediation.customevent.CustomEventListener
        public void onAdClicked() {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Custom event adapter called onAdClicked.");
            this.zzgp.onAdClicked(this.V);
        }

        @Override // com.google.android.gms.ads.mediation.customevent.CustomEventListener
        public void onAdClosed() {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Custom event adapter called onAdClosed.");
            this.zzgp.onAdClosed(this.V);
        }

        @Override // com.google.android.gms.ads.mediation.customevent.CustomEventListener
        public void onAdFailedToLoad(int i) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Custom event adapter called onFailedToReceiveAd.");
            this.zzgp.onAdFailedToLoad(this.V, i);
        }

        @Override // com.google.android.gms.ads.mediation.customevent.CustomEventListener
        public void onAdLeftApplication() {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Custom event adapter called onAdLeftApplication.");
            this.zzgp.onAdLeftApplication(this.V);
        }

        @Override // com.google.android.gms.ads.mediation.customevent.CustomEventInterstitialListener
        public void onAdLoaded() {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Custom event adapter called onReceivedAd.");
            this.zzgp.onAdLoaded(CustomEventAdapter.this);
        }

        @Override // com.google.android.gms.ads.mediation.customevent.CustomEventListener
        public void onAdOpened() {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Custom event adapter called onAdOpened.");
            this.zzgp.onAdOpened(this.V);
        }
    }

    /* loaded from: classes.dex */
    static class zzc implements CustomEventNativeListener {
        private final CustomEventAdapter V;
        private final MediationNativeListener zzgq;

        public zzc(CustomEventAdapter customEventAdapter, MediationNativeListener mediationNativeListener) {
            this.V = customEventAdapter;
            this.zzgq = mediationNativeListener;
        }

        @Override // com.google.android.gms.ads.mediation.customevent.CustomEventListener
        public void onAdClicked() {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Custom event adapter called onAdClicked.");
            this.zzgq.onAdClicked(this.V);
        }

        @Override // com.google.android.gms.ads.mediation.customevent.CustomEventListener
        public void onAdClosed() {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Custom event adapter called onAdClosed.");
            this.zzgq.onAdClosed(this.V);
        }

        @Override // com.google.android.gms.ads.mediation.customevent.CustomEventListener
        public void onAdFailedToLoad(int i) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Custom event adapter called onAdFailedToLoad.");
            this.zzgq.onAdFailedToLoad(this.V, i);
        }

        @Override // com.google.android.gms.ads.mediation.customevent.CustomEventNativeListener
        public void onAdImpression() {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Custom event adapter called onAdImpression.");
            this.zzgq.onAdImpression(this.V);
        }

        @Override // com.google.android.gms.ads.mediation.customevent.CustomEventListener
        public void onAdLeftApplication() {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Custom event adapter called onAdLeftApplication.");
            this.zzgq.onAdLeftApplication(this.V);
        }

        @Override // com.google.android.gms.ads.mediation.customevent.CustomEventNativeListener
        public void onAdLoaded(NativeAdMapper nativeAdMapper) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Custom event adapter called onAdLoaded.");
            this.zzgq.onAdLoaded(this.V, nativeAdMapper);
        }

        @Override // com.google.android.gms.ads.mediation.customevent.CustomEventListener
        public void onAdOpened() {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Custom event adapter called onAdOpened.");
            this.zzgq.onAdOpened(this.V);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zza(View view) {
        this.zzgw = view;
    }

    private static <T> T zzj(String str) {
        try {
            return (T) Class.forName(str).newInstance();
        } catch (Throwable th) {
            String valueOf = String.valueOf(th.getMessage());
            com.google.android.gms.ads.internal.util.client.zzb.zzdi(new StringBuilder(String.valueOf(str).length() + 46 + String.valueOf(valueOf).length()).append("Could not instantiate custom event adapter: ").append(str).append(". ").append(valueOf).toString());
            return null;
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationBannerAdapter
    public View getBannerView() {
        return this.zzgw;
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdapter
    public void onDestroy() {
        if (this.S != null) {
            this.S.onDestroy();
        }
        if (this.T != null) {
            this.T.onDestroy();
        }
        if (this.U != null) {
            this.U.onDestroy();
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdapter
    public void onPause() {
        if (this.S != null) {
            this.S.onPause();
        }
        if (this.T != null) {
            this.T.onPause();
        }
        if (this.U != null) {
            this.U.onPause();
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdapter
    public void onResume() {
        if (this.S != null) {
            this.S.onResume();
        }
        if (this.T != null) {
            this.T.onResume();
        }
        if (this.U != null) {
            this.U.onResume();
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationBannerAdapter
    public void requestBannerAd(Context context, MediationBannerListener mediationBannerListener, Bundle bundle, AdSize adSize, MediationAdRequest mediationAdRequest, Bundle bundle2) {
        this.S = (CustomEventBanner) zzj(bundle.getString("class_name"));
        if (this.S == null) {
            mediationBannerListener.onAdFailedToLoad(this, 0);
        } else {
            this.S.requestBannerAd(context, new zza(this, mediationBannerListener), bundle.getString(MediationRewardedVideoAdAdapter.CUSTOM_EVENT_SERVER_PARAMETER_FIELD), adSize, mediationAdRequest, bundle2 == null ? null : bundle2.getBundle(bundle.getString("class_name")));
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationInterstitialAdapter
    public void requestInterstitialAd(Context context, MediationInterstitialListener mediationInterstitialListener, Bundle bundle, MediationAdRequest mediationAdRequest, Bundle bundle2) {
        this.T = (CustomEventInterstitial) zzj(bundle.getString("class_name"));
        if (this.T == null) {
            mediationInterstitialListener.onAdFailedToLoad(this, 0);
        } else {
            this.T.requestInterstitialAd(context, zza(mediationInterstitialListener), bundle.getString(MediationRewardedVideoAdAdapter.CUSTOM_EVENT_SERVER_PARAMETER_FIELD), mediationAdRequest, bundle2 == null ? null : bundle2.getBundle(bundle.getString("class_name")));
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationNativeAdapter
    public void requestNativeAd(Context context, MediationNativeListener mediationNativeListener, Bundle bundle, NativeMediationAdRequest nativeMediationAdRequest, Bundle bundle2) {
        this.U = (CustomEventNative) zzj(bundle.getString("class_name"));
        if (this.U == null) {
            mediationNativeListener.onAdFailedToLoad(this, 0);
        } else {
            this.U.requestNativeAd(context, new zzc(this, mediationNativeListener), bundle.getString(MediationRewardedVideoAdAdapter.CUSTOM_EVENT_SERVER_PARAMETER_FIELD), nativeMediationAdRequest, bundle2 == null ? null : bundle2.getBundle(bundle.getString("class_name")));
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationInterstitialAdapter
    public void showInterstitial() {
        this.T.showInterstitial();
    }

    zzb zza(MediationInterstitialListener mediationInterstitialListener) {
        return new zzb(this, mediationInterstitialListener);
    }
}
