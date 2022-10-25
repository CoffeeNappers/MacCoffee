package com.my.target.ads.mediation;

import android.content.Context;
import android.os.Bundle;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.mediation.MediationAdRequest;
import com.google.android.gms.ads.mediation.customevent.CustomEventBanner;
import com.google.android.gms.ads.mediation.customevent.CustomEventBannerListener;
import com.my.target.Tracer;
import com.my.target.ads.CustomParams;
import com.my.target.ads.MyTargetView;
import java.util.Date;
import java.util.GregorianCalendar;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MyTargetAdmobCustomEventBanner implements CustomEventBanner {
    private static final String SLOT_ID_KEY = "slotId";
    private static final CustomParams customParams = AdmobCustomParamsFactory.getCustomParams();
    private CustomEventBannerListener bannerListener;
    private MyTargetView myTargetView;
    private final MyTargetView.MyTargetViewListener myTargetViewListener = new MyTargetView.MyTargetViewListener() { // from class: com.my.target.ads.mediation.MyTargetAdmobCustomEventBanner.1
        @Override // com.my.target.ads.MyTargetView.MyTargetViewListener
        public void onLoad(MyTargetView myTargetView) {
            myTargetView.start();
            if (MyTargetAdmobCustomEventBanner.this.bannerListener != null) {
                MyTargetAdmobCustomEventBanner.this.bannerListener.onAdLoaded(myTargetView);
            }
        }

        @Override // com.my.target.ads.MyTargetView.MyTargetViewListener
        public void onNoAd(String str, MyTargetView myTargetView) {
            if (MyTargetAdmobCustomEventBanner.this.bannerListener != null) {
                MyTargetAdmobCustomEventBanner.this.bannerListener.onAdFailedToLoad(3);
            }
        }

        @Override // com.my.target.ads.MyTargetView.MyTargetViewListener
        public void onClick(MyTargetView myTargetView) {
            if (MyTargetAdmobCustomEventBanner.this.bannerListener != null) {
                MyTargetAdmobCustomEventBanner.this.bannerListener.onAdClicked();
                MyTargetAdmobCustomEventBanner.this.bannerListener.onAdOpened();
                MyTargetAdmobCustomEventBanner.this.bannerListener.onAdLeftApplication();
            }
        }
    };

    @Override // com.google.android.gms.ads.mediation.customevent.CustomEventBanner
    public void requestBannerAd(Context context, CustomEventBannerListener customEventBannerListener, String str, AdSize adSize, MediationAdRequest mediationAdRequest, Bundle bundle) {
        try {
            int i = new JSONObject(str).getInt(SLOT_ID_KEY);
            if (AdSize.BANNER.equals(adSize)) {
                this.bannerListener = customEventBannerListener;
                if (this.myTargetView == null) {
                    this.myTargetView = new MyTargetView(context);
                    if (mediationAdRequest != null) {
                        customParams.setGender(mediationAdRequest.getGender());
                        Date birthday = mediationAdRequest.getBirthday();
                        if (birthday != null && birthday.getTime() != -1) {
                            GregorianCalendar gregorianCalendar = new GregorianCalendar();
                            GregorianCalendar gregorianCalendar2 = new GregorianCalendar();
                            gregorianCalendar.setTimeInMillis(birthday.getTime());
                            int i2 = gregorianCalendar2.get(1) - gregorianCalendar.get(1);
                            if (i2 >= 0) {
                                customParams.setAge(i2);
                            }
                        }
                    }
                    this.myTargetView.init(i, 0, customParams, false);
                    this.myTargetView.setListener(this.myTargetViewListener);
                }
                this.myTargetView.load();
            } else if (customEventBannerListener != null) {
                customEventBannerListener.onAdFailedToLoad(0);
            }
        } catch (Exception e) {
            Tracer.i("Unable to get slotId from parameter json. Probably Admob mediation misconfiguration.");
            if (customEventBannerListener != null) {
                customEventBannerListener.onAdFailedToLoad(0);
            }
        }
    }

    @Override // com.google.android.gms.ads.mediation.customevent.CustomEvent
    public void onDestroy() {
        if (this.myTargetView != null) {
            this.myTargetView.destroy();
            this.myTargetView = null;
        }
        this.bannerListener = null;
    }

    @Override // com.google.android.gms.ads.mediation.customevent.CustomEvent
    public void onPause() {
    }

    @Override // com.google.android.gms.ads.mediation.customevent.CustomEvent
    public void onResume() {
    }
}
