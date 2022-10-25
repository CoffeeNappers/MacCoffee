package com.my.target.ads.mediation;

import android.content.Context;
import com.mopub.MopubCustomParamsFactory;
import com.mopub.mobileads.CustomEventBanner;
import com.mopub.mobileads.MoPubErrorCode;
import com.my.target.Tracer;
import com.my.target.ads.CustomParams;
import com.my.target.ads.MyTargetView;
import java.util.Map;
/* loaded from: classes2.dex */
public class MyTargetMopubCustomEventBanner extends CustomEventBanner {
    private static final String SLOT_ID_KEY = "slotId";
    private CustomEventBanner.CustomEventBannerListener bannerListener;
    private MyTargetView myTargetView;
    private MyTargetView.MyTargetViewListener myTargetViewListener = new MyTargetView.MyTargetViewListener() { // from class: com.my.target.ads.mediation.MyTargetMopubCustomEventBanner.1
        @Override // com.my.target.ads.MyTargetView.MyTargetViewListener
        public void onLoad(MyTargetView myTargetView) {
            myTargetView.start();
            if (MyTargetMopubCustomEventBanner.this.bannerListener != null) {
                MyTargetMopubCustomEventBanner.this.bannerListener.onBannerLoaded(myTargetView);
            }
        }

        @Override // com.my.target.ads.MyTargetView.MyTargetViewListener
        public void onNoAd(String str, MyTargetView myTargetView) {
            if (MyTargetMopubCustomEventBanner.this.bannerListener != null) {
                MyTargetMopubCustomEventBanner.this.bannerListener.onBannerFailed(MoPubErrorCode.NO_FILL);
            }
        }

        @Override // com.my.target.ads.MyTargetView.MyTargetViewListener
        public void onClick(MyTargetView myTargetView) {
            if (MyTargetMopubCustomEventBanner.this.bannerListener != null) {
                MyTargetMopubCustomEventBanner.this.bannerListener.onBannerClicked();
                MyTargetMopubCustomEventBanner.this.bannerListener.onLeaveApplication();
            }
        }
    };

    protected void loadBanner(Context context, CustomEventBanner.CustomEventBannerListener customEventBannerListener, Map<String, Object> map, Map<String, String> map2) {
        if (map2.size() == 0 || !map2.containsKey(SLOT_ID_KEY)) {
            Tracer.i("Unable to get slotId from parameter json. Probably Admob mediation misconfiguration.");
            if (customEventBannerListener != null) {
                customEventBannerListener.onBannerFailed(MoPubErrorCode.NO_FILL);
                return;
            }
            return;
        }
        int parseInt = Integer.parseInt(map2.get(SLOT_ID_KEY));
        CustomParams customParams = MopubCustomParamsFactory.getCustomParams(map);
        this.bannerListener = customEventBannerListener;
        if (this.myTargetView == null) {
            this.myTargetView = new MyTargetView(context);
            this.myTargetView.init(parseInt, 0, customParams, false);
            this.myTargetView.setListener(this.myTargetViewListener);
        }
        this.myTargetView.load();
    }

    protected void onInvalidate() {
        if (this.myTargetView != null) {
            this.myTargetView.destroy();
            this.myTargetView = null;
        }
        this.bannerListener = null;
    }
}
