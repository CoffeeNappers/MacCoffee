package com.mopub.nativeads;

import android.content.Context;
import com.mopub.MopubCustomParamsFactory;
import com.mopub.nativeads.CustomEventNative;
import com.my.target.Tracer;
import com.my.target.ads.CustomParams;
import com.my.target.nativeads.NativeAd;
import com.my.target.nativeads.banners.NativePromoBanner;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public class MyTargetCustomEventNative extends CustomEventNative {
    private static final String SLOT_ID_KEY = "slotId";
    private static List<MyTargetCustomEventNative> activeEvents = new ArrayList();
    private Context context;
    private NativeAd.NativeAdListener listener = new NativeAd.NativeAdListener() { // from class: com.mopub.nativeads.MyTargetCustomEventNative.1
        @Override // com.my.target.core.facades.b.a
        public void onLoad(NativeAd nativeAd) {
            if (MyTargetCustomEventNative.this.nativeAd != nativeAd) {
                Tracer.d("Weird things happening");
                return;
            }
            Tracer.d("Received ad from myTarget, converting to MoPub ad");
            NativePromoBanner banner = MyTargetCustomEventNative.this.nativeAd.getBanner();
            MyTargetCustomEventNative.this.mopubNativeAd = new MyTargetStaticNativeAd(MyTargetCustomEventNative.this.context);
            MyTargetCustomEventNative.this.mopubNativeAd.setNativeAd(nativeAd);
            MyTargetCustomEventNative.this.mopubNativeAd.setTitle(banner.getTitle());
            MyTargetCustomEventNative.this.mopubNativeAd.setCallToAction(banner.getCtaText());
            if (banner.getIcon() != null) {
                MyTargetCustomEventNative.this.mopubNativeAd.setIconImageUrl(banner.getIcon().getUrl());
            }
            if (banner.getImage() != null) {
                MyTargetCustomEventNative.this.mopubNativeAd.setMainImageUrl(banner.getImage().getUrl());
            }
            MyTargetCustomEventNative.this.mopubNativeAd.setStarRating(Double.valueOf(banner.getRating()));
            MyTargetCustomEventNative.this.mopubNativeAd.setText(banner.getDescription());
            if (MyTargetCustomEventNative.activeEvents.contains(MyTargetCustomEventNative.this)) {
                MyTargetCustomEventNative.activeEvents.remove(MyTargetCustomEventNative.this);
            }
            if (MyTargetCustomEventNative.this.mopubNativeAd != null && MyTargetCustomEventNative.this.loadedAdListener != null) {
                MyTargetCustomEventNative.this.loadedAdListener.onNativeAdLoaded(MyTargetCustomEventNative.this.mopubNativeAd);
            }
        }

        @Override // com.my.target.core.facades.b.a
        public void onNoAd(String str, NativeAd nativeAd) {
            Tracer.d("NativeAd: no ad, failing mediation");
            MyTargetCustomEventNative.this.loadedAdListener.onNativeAdFailed(NativeErrorCode.EMPTY_AD_RESPONSE);
            if (MyTargetCustomEventNative.activeEvents.contains(MyTargetCustomEventNative.this)) {
                MyTargetCustomEventNative.activeEvents.remove(MyTargetCustomEventNative.this);
            }
        }

        @Override // com.my.target.core.facades.b.a
        public void onClick(NativeAd nativeAd) {
        }
    };
    private CustomEventNative.CustomEventNativeListener loadedAdListener;
    private MyTargetStaticNativeAd mopubNativeAd;
    private NativeAd nativeAd;

    protected void loadNativeAd(Context context, CustomEventNative.CustomEventNativeListener customEventNativeListener, Map<String, Object> map, Map<String, String> map2) {
        this.loadedAdListener = customEventNativeListener;
        this.context = context;
        if (map2 != null && map2.containsKey(SLOT_ID_KEY)) {
            int parseInt = Integer.parseInt(map2.get(SLOT_ID_KEY));
            CustomParams customParams = MopubCustomParamsFactory.getCustomParams(map);
            activeEvents.add(this);
            this.nativeAd = new NativeAd(parseInt, context, customParams);
            this.nativeAd.setAutoLoadImages(false);
            this.nativeAd.setListener(this.listener);
            this.nativeAd.load();
            return;
        }
        Tracer.i("Unable to get slotId. Probably MoPub custom network misconfiguration.");
        this.loadedAdListener.onNativeAdFailed(NativeErrorCode.INVALID_RESPONSE);
    }
}
