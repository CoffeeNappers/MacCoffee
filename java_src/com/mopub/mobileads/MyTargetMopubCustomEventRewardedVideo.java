package com.mopub.mobileads;

import android.app.Activity;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.mopub.MopubCustomParamsFactory;
import com.mopub.common.LifecycleListener;
import com.mopub.common.MoPubReward;
import com.mopub.mobileads.CustomEventRewardedVideo;
import com.my.target.Tracer;
import com.my.target.ads.CustomParams;
import com.my.target.ads.InterstitialAd;
import java.util.Map;
/* loaded from: classes2.dex */
public class MyTargetMopubCustomEventRewardedVideo extends CustomEventRewardedVideo {
    public static final String NETWORK_ID = "myTarget";
    private static final String SLOT_ID_KEY = "slotId";
    @Nullable
    private InterstitialAd ad;
    private boolean loaded;
    private InterstitialAd.InterstitialAdListener mytargetInterstitialListener = new RewardedListener();

    /* loaded from: classes2.dex */
    private class RewardedListener implements InterstitialAd.InterstitialAdListener {
        private RewardedListener() {
        }

        @Override // com.my.target.ads.InterstitialAd.InterstitialAdListener
        public void onLoad(InterstitialAd interstitialAd) {
            MyTargetMopubCustomEventRewardedVideo.this.loaded = true;
            MoPubRewardedVideoManager.onRewardedVideoLoadSuccess(MyTargetMopubCustomEventRewardedVideo.class, MyTargetMopubCustomEventRewardedVideo.NETWORK_ID);
        }

        @Override // com.my.target.ads.InterstitialAd.InterstitialAdListener
        public void onNoAd(String str, InterstitialAd interstitialAd) {
            MoPubRewardedVideoManager.onRewardedVideoLoadFailure(MyTargetMopubCustomEventRewardedVideo.class, MyTargetMopubCustomEventRewardedVideo.NETWORK_ID, MoPubErrorCode.NO_FILL);
        }

        @Override // com.my.target.ads.InterstitialAd.InterstitialAdListener
        public void onClick(InterstitialAd interstitialAd) {
            MoPubRewardedVideoManager.onRewardedVideoClicked(MyTargetMopubCustomEventRewardedVideo.class, MyTargetMopubCustomEventRewardedVideo.NETWORK_ID);
        }

        @Override // com.my.target.ads.InterstitialAd.InterstitialAdListener
        public void onDismiss(InterstitialAd interstitialAd) {
            MoPubRewardedVideoManager.onRewardedVideoClosed(MyTargetMopubCustomEventRewardedVideo.class, MyTargetMopubCustomEventRewardedVideo.NETWORK_ID);
        }

        @Override // com.my.target.ads.InterstitialAd.InterstitialAdListener
        public void onVideoCompleted(InterstitialAd interstitialAd) {
            MoPubRewardedVideoManager.onRewardedVideoCompleted(MyTargetMopubCustomEventRewardedVideo.class, MyTargetMopubCustomEventRewardedVideo.NETWORK_ID, MoPubReward.success("", 0));
        }

        @Override // com.my.target.ads.InterstitialAd.InterstitialAdListener
        public void onDisplay(InterstitialAd interstitialAd) {
            MoPubRewardedVideoManager.onRewardedVideoStarted(MyTargetMopubCustomEventRewardedVideo.class, MyTargetMopubCustomEventRewardedVideo.NETWORK_ID);
        }
    }

    @Nullable
    protected CustomEventRewardedVideo.CustomEventRewardedVideoListener getVideoListenerForSdk() {
        return null;
    }

    @Nullable
    protected LifecycleListener getLifecycleListener() {
        return null;
    }

    @NonNull
    protected String getAdNetworkId() {
        return NETWORK_ID;
    }

    protected void onInvalidate() {
        if (this.ad != null) {
            this.ad.setListener(null);
        }
    }

    protected boolean checkAndInitializeSdk(@NonNull Activity activity, @NonNull Map<String, Object> map, @NonNull Map<String, String> map2) throws Exception {
        CustomParams customParams = MopubCustomParamsFactory.getCustomParams(map);
        if (map2.size() == 0 || !map2.containsKey(SLOT_ID_KEY)) {
            Tracer.i("Unable to get slotId from parameter json. Probably Admob mediation misconfiguration.");
            return false;
        }
        try {
            this.ad = new InterstitialAd(Integer.parseInt(map2.get(SLOT_ID_KEY)), activity, customParams);
            this.ad.setListener(this.mytargetInterstitialListener);
            return true;
        } catch (NumberFormatException e) {
            Tracer.d("Wrong slotId");
            return false;
        }
    }

    protected void loadWithSdkInitialized(@NonNull Activity activity, @NonNull Map<String, Object> map, @NonNull Map<String, String> map2) throws Exception {
        Tracer.d("Loading mopub mediation rewarded");
        if (this.ad != null) {
            this.ad.load();
        }
    }

    protected boolean hasVideoAvailable() {
        return this.loaded;
    }

    protected void showVideo() {
        if (this.ad != null) {
            this.ad.show();
        }
    }
}
