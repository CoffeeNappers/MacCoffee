package com.mopub.mobileads;

import android.content.Context;
import android.support.annotation.Nullable;
import com.mopub.MopubCustomParamsFactory;
import com.mopub.mobileads.CustomEventInterstitial;
import com.my.target.Tracer;
import com.my.target.ads.CustomParams;
import com.my.target.ads.InterstitialAd;
import java.util.Map;
/* loaded from: classes2.dex */
public class MyTargetMopubCustomEventInterstitial extends CustomEventInterstitial {
    private static final String SLOT_ID_KEY = "slotId";
    @Nullable
    private InterstitialAd ad;
    @Nullable
    private CustomEventInterstitial.CustomEventInterstitialListener mopubInterstitialListener;
    InterstitialAd.InterstitialAdListener mytargetInterstitialListener = new InterstitialAd.InterstitialAdListener() { // from class: com.mopub.mobileads.MyTargetMopubCustomEventInterstitial.1
        @Override // com.my.target.ads.InterstitialAd.InterstitialAdListener
        public void onLoad(InterstitialAd interstitialAd) {
            Tracer.d("Mediation interstitial ad loaded");
            if (MyTargetMopubCustomEventInterstitial.this.mopubInterstitialListener != null) {
                MyTargetMopubCustomEventInterstitial.this.mopubInterstitialListener.onInterstitialLoaded();
            }
        }

        @Override // com.my.target.ads.InterstitialAd.InterstitialAdListener
        public void onNoAd(String str, InterstitialAd interstitialAd) {
            Tracer.d("Mediation interstitial failed to load: " + str);
            if (MyTargetMopubCustomEventInterstitial.this.mopubInterstitialListener != null) {
                MyTargetMopubCustomEventInterstitial.this.mopubInterstitialListener.onInterstitialFailed(MoPubErrorCode.MRAID_LOAD_ERROR);
            }
        }

        @Override // com.my.target.ads.InterstitialAd.InterstitialAdListener
        public void onClick(InterstitialAd interstitialAd) {
        }

        @Override // com.my.target.ads.InterstitialAd.InterstitialAdListener
        public void onDismiss(InterstitialAd interstitialAd) {
        }

        @Override // com.my.target.ads.InterstitialAd.InterstitialAdListener
        public void onVideoCompleted(InterstitialAd interstitialAd) {
        }

        @Override // com.my.target.ads.InterstitialAd.InterstitialAdListener
        public void onDisplay(InterstitialAd interstitialAd) {
        }
    };

    protected void loadInterstitial(Context context, CustomEventInterstitial.CustomEventInterstitialListener customEventInterstitialListener, Map<String, Object> map, Map<String, String> map2) {
        this.mopubInterstitialListener = customEventInterstitialListener;
        Tracer.d("Loading mopub mediation interstitial");
        CustomParams customParams = MopubCustomParamsFactory.getCustomParams(map);
        if (map2.size() == 0 || !map2.containsKey(SLOT_ID_KEY)) {
            Tracer.i("Unable to get slotId from parameter json. Probably Admob mediation misconfiguration.");
            customEventInterstitialListener.onInterstitialFailed(MoPubErrorCode.UNSPECIFIED);
            return;
        }
        this.ad = new InterstitialAd(Integer.parseInt(map2.get(SLOT_ID_KEY)), context, customParams);
        this.ad.setListener(this.mytargetInterstitialListener);
        this.ad.load();
    }

    protected void showInterstitial() {
        Tracer.d("Showing mopub mediation interstitial");
        if (this.ad != null) {
            this.ad.show();
        }
    }

    protected void onInvalidate() {
        if (this.ad != null) {
            this.ad.setListener(null);
        }
    }
}
