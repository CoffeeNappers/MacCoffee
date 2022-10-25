package com.my.target.ads.mediation;

import android.content.Context;
import android.os.Bundle;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.mediation.MediationAdRequest;
import com.google.android.gms.ads.reward.RewardItem;
import com.google.android.gms.ads.reward.mediation.MediationRewardedVideoAdAdapter;
import com.google.android.gms.ads.reward.mediation.MediationRewardedVideoAdListener;
import com.my.target.Tracer;
import com.my.target.ads.CustomParams;
import com.my.target.ads.InterstitialAd;
import java.util.Date;
import java.util.GregorianCalendar;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MyTargetAdmobCustomEventRewarded extends AdListener implements MediationRewardedVideoAdAdapter {
    private static final String SLOT_ID_KEY = "slotId";
    private InterstitialAd interstitial;
    private MediationRewardedVideoAdListener mediationRewardedVideoAdListener;
    private final RewardItem rewardItem = new RewardItem() { // from class: com.my.target.ads.mediation.MyTargetAdmobCustomEventRewarded.1
        @Override // com.google.android.gms.ads.reward.RewardItem
        public String getType() {
            return "";
        }

        @Override // com.google.android.gms.ads.reward.RewardItem
        public int getAmount() {
            return 0;
        }
    };
    private final InterstitialAd.InterstitialAdListener interstitialAdListener = new InterstitialAd.InterstitialAdListener() { // from class: com.my.target.ads.mediation.MyTargetAdmobCustomEventRewarded.2
        @Override // com.my.target.ads.InterstitialAd.InterstitialAdListener
        public void onLoad(InterstitialAd interstitialAd) {
            MyTargetAdmobCustomEventRewarded.this.mediationRewardedVideoAdListener.onAdLoaded(MyTargetAdmobCustomEventRewarded.this);
        }

        @Override // com.my.target.ads.InterstitialAd.InterstitialAdListener
        public void onNoAd(String str, InterstitialAd interstitialAd) {
            MyTargetAdmobCustomEventRewarded.this.mediationRewardedVideoAdListener.onAdFailedToLoad(MyTargetAdmobCustomEventRewarded.this, 3);
        }

        @Override // com.my.target.ads.InterstitialAd.InterstitialAdListener
        public void onClick(InterstitialAd interstitialAd) {
            MyTargetAdmobCustomEventRewarded.this.mediationRewardedVideoAdListener.onAdClicked(MyTargetAdmobCustomEventRewarded.this);
        }

        @Override // com.my.target.ads.InterstitialAd.InterstitialAdListener
        public void onDismiss(InterstitialAd interstitialAd) {
            MyTargetAdmobCustomEventRewarded.this.mediationRewardedVideoAdListener.onAdClosed(MyTargetAdmobCustomEventRewarded.this);
        }

        @Override // com.my.target.ads.InterstitialAd.InterstitialAdListener
        public void onVideoCompleted(InterstitialAd interstitialAd) {
            MyTargetAdmobCustomEventRewarded.this.mediationRewardedVideoAdListener.onRewarded(MyTargetAdmobCustomEventRewarded.this, MyTargetAdmobCustomEventRewarded.this.rewardItem);
        }

        @Override // com.my.target.ads.InterstitialAd.InterstitialAdListener
        public void onDisplay(InterstitialAd interstitialAd) {
            MyTargetAdmobCustomEventRewarded.this.mediationRewardedVideoAdListener.onAdOpened(MyTargetAdmobCustomEventRewarded.this);
            MyTargetAdmobCustomEventRewarded.this.mediationRewardedVideoAdListener.onVideoStarted(MyTargetAdmobCustomEventRewarded.this);
        }
    };

    @Override // com.google.android.gms.ads.mediation.MediationAdapter
    public void onDestroy() {
        this.interstitial.setListener(null);
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdapter
    public void onPause() {
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdapter
    public void onResume() {
    }

    @Override // com.google.android.gms.ads.reward.mediation.MediationRewardedVideoAdAdapter
    public void initialize(Context context, MediationAdRequest mediationAdRequest, String str, MediationRewardedVideoAdListener mediationRewardedVideoAdListener, Bundle bundle, Bundle bundle2) {
        this.mediationRewardedVideoAdListener = mediationRewardedVideoAdListener;
        try {
            int i = new JSONObject(bundle.getString(MediationRewardedVideoAdAdapter.CUSTOM_EVENT_SERVER_PARAMETER_FIELD)).getInt(SLOT_ID_KEY);
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
            mediationRewardedVideoAdListener.onInitializationSucceeded(this);
        } catch (JSONException e) {
            Tracer.i("Unable to get slotId from parameter json. Probably Admob mediation misconfiguration.");
            mediationRewardedVideoAdListener.onAdFailedToLoad(this, 0);
        }
    }

    @Override // com.google.android.gms.ads.reward.mediation.MediationRewardedVideoAdAdapter
    public void loadAd(MediationAdRequest mediationAdRequest, Bundle bundle, Bundle bundle2) {
        this.interstitial.load();
    }

    @Override // com.google.android.gms.ads.reward.mediation.MediationRewardedVideoAdAdapter
    public void showVideo() {
        this.interstitial.show();
    }

    @Override // com.google.android.gms.ads.reward.mediation.MediationRewardedVideoAdAdapter
    public boolean isInitialized() {
        return this.interstitial != null;
    }
}
