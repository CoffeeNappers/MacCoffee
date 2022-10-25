package com.my.target.ads.mediation;

import android.content.Context;
import android.os.Bundle;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.mediation.MediationAdRequest;
import com.google.android.gms.ads.mediation.customevent.CustomEventInterstitial;
import com.google.android.gms.ads.mediation.customevent.CustomEventInterstitialListener;
import com.my.target.Tracer;
import com.my.target.ads.CustomParams;
import com.my.target.ads.InterstitialAd;
import java.util.Date;
import java.util.GregorianCalendar;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MyTargetAdmobCustomEventInterstitial extends AdListener implements CustomEventInterstitial {
    private static final String SLOT_ID_KEY = "slotId";
    private InterstitialAd interstitial;
    private final InterstitialAd.InterstitialAdListener interstitialAdListener = new InterstitialAd.InterstitialAdListener() { // from class: com.my.target.ads.mediation.MyTargetAdmobCustomEventInterstitial.1
        @Override // com.my.target.ads.InterstitialAd.InterstitialAdListener
        public void onLoad(InterstitialAd interstitialAd) {
            MyTargetAdmobCustomEventInterstitial.this.interstitialListener.onAdLoaded();
        }

        @Override // com.my.target.ads.InterstitialAd.InterstitialAdListener
        public void onNoAd(String str, InterstitialAd interstitialAd) {
            MyTargetAdmobCustomEventInterstitial.this.interstitialListener.onAdFailedToLoad(3);
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
    private CustomEventInterstitialListener interstitialListener;

    @Override // com.google.android.gms.ads.mediation.customevent.CustomEventInterstitial
    public void requestInterstitialAd(Context context, CustomEventInterstitialListener customEventInterstitialListener, String str, MediationAdRequest mediationAdRequest, Bundle bundle) {
        this.interstitialListener = customEventInterstitialListener;
        try {
            int i = new JSONObject(str).getInt(SLOT_ID_KEY);
            CustomParams customParams = AdmobCustomParamsFactory.getCustomParams();
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
            this.interstitial = new InterstitialAd(i, context, customParams);
            this.interstitial.setListener(this.interstitialAdListener);
            this.interstitial.load();
        } catch (JSONException e) {
            Tracer.i("Unable to get slotId from parameter json. Probably Admob mediation misconfiguration.");
            this.interstitialListener.onAdFailedToLoad(0);
        }
    }

    @Override // com.google.android.gms.ads.mediation.customevent.CustomEventInterstitial
    public void showInterstitial() {
        this.interstitial.show();
    }

    @Override // com.google.android.gms.ads.mediation.customevent.CustomEvent
    public void onDestroy() {
        this.interstitial.setListener(null);
    }

    @Override // com.google.android.gms.ads.mediation.customevent.CustomEvent
    public void onPause() {
    }

    @Override // com.google.android.gms.ads.mediation.customevent.CustomEvent
    public void onResume() {
    }
}
