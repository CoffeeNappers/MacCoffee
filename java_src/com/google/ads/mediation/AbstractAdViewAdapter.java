package com.google.ads.mediation;

import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import android.view.View;
import com.google.ads.mediation.admob.AdMobAdapter;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.AdLoader;
import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.AdView;
import com.google.android.gms.ads.InterstitialAd;
import com.google.android.gms.ads.formats.NativeAdOptions;
import com.google.android.gms.ads.formats.NativeAdView;
import com.google.android.gms.ads.formats.NativeAppInstallAd;
import com.google.android.gms.ads.formats.NativeContentAd;
import com.google.android.gms.ads.internal.client.zzm;
import com.google.android.gms.ads.mediation.MediationAdapter;
import com.google.android.gms.ads.mediation.MediationNativeAdapter;
import com.google.android.gms.ads.mediation.MediationNativeListener;
import com.google.android.gms.ads.mediation.NativeAppInstallAdMapper;
import com.google.android.gms.ads.mediation.NativeContentAdMapper;
import com.google.android.gms.ads.mediation.NativeMediationAdRequest;
import com.google.android.gms.ads.reward.RewardItem;
import com.google.android.gms.ads.reward.RewardedVideoAdListener;
import com.google.android.gms.ads.reward.mediation.MediationRewardedVideoAdAdapter;
import com.google.android.gms.ads.reward.mediation.MediationRewardedVideoAdListener;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzmr;
import java.util.Date;
import java.util.Set;
@zzji
/* loaded from: classes.dex */
public abstract class AbstractAdViewAdapter implements com.google.android.gms.ads.mediation.MediationBannerAdapter, MediationNativeAdapter, MediationRewardedVideoAdAdapter, zzmr {
    public static final String AD_UNIT_ID_PARAMETER = "pubid";
    protected AdView zzgd;
    protected InterstitialAd zzge;
    private AdLoader zzgf;
    private Context zzgg;
    private InterstitialAd zzgh;
    private MediationRewardedVideoAdListener zzgi;
    final RewardedVideoAdListener zzgj = new RewardedVideoAdListener() { // from class: com.google.ads.mediation.AbstractAdViewAdapter.1
        @Override // com.google.android.gms.ads.reward.RewardedVideoAdListener
        public void onRewarded(RewardItem rewardItem) {
            AbstractAdViewAdapter.this.zzgi.onRewarded(AbstractAdViewAdapter.this, rewardItem);
        }

        @Override // com.google.android.gms.ads.reward.RewardedVideoAdListener
        public void onRewardedVideoAdClosed() {
            AbstractAdViewAdapter.this.zzgi.onAdClosed(AbstractAdViewAdapter.this);
            AbstractAdViewAdapter.this.zzgh = null;
        }

        @Override // com.google.android.gms.ads.reward.RewardedVideoAdListener
        public void onRewardedVideoAdFailedToLoad(int i) {
            AbstractAdViewAdapter.this.zzgi.onAdFailedToLoad(AbstractAdViewAdapter.this, i);
        }

        @Override // com.google.android.gms.ads.reward.RewardedVideoAdListener
        public void onRewardedVideoAdLeftApplication() {
            AbstractAdViewAdapter.this.zzgi.onAdLeftApplication(AbstractAdViewAdapter.this);
        }

        @Override // com.google.android.gms.ads.reward.RewardedVideoAdListener
        public void onRewardedVideoAdLoaded() {
            AbstractAdViewAdapter.this.zzgi.onAdLoaded(AbstractAdViewAdapter.this);
        }

        @Override // com.google.android.gms.ads.reward.RewardedVideoAdListener
        public void onRewardedVideoAdOpened() {
            AbstractAdViewAdapter.this.zzgi.onAdOpened(AbstractAdViewAdapter.this);
        }

        @Override // com.google.android.gms.ads.reward.RewardedVideoAdListener
        public void onRewardedVideoStarted() {
            AbstractAdViewAdapter.this.zzgi.onVideoStarted(AbstractAdViewAdapter.this);
        }
    };

    /* loaded from: classes.dex */
    static class zza extends NativeAppInstallAdMapper {
        private final NativeAppInstallAd zzgl;

        public zza(NativeAppInstallAd nativeAppInstallAd) {
            this.zzgl = nativeAppInstallAd;
            setHeadline(nativeAppInstallAd.getHeadline().toString());
            setImages(nativeAppInstallAd.getImages());
            setBody(nativeAppInstallAd.getBody().toString());
            setIcon(nativeAppInstallAd.getIcon());
            setCallToAction(nativeAppInstallAd.getCallToAction().toString());
            if (nativeAppInstallAd.getStarRating() != null) {
                setStarRating(nativeAppInstallAd.getStarRating().doubleValue());
            }
            if (nativeAppInstallAd.getStore() != null) {
                setStore(nativeAppInstallAd.getStore().toString());
            }
            if (nativeAppInstallAd.getPrice() != null) {
                setPrice(nativeAppInstallAd.getPrice().toString());
            }
            setOverrideImpressionRecording(true);
            setOverrideClickHandling(true);
            zza(nativeAppInstallAd.getVideoController());
        }

        @Override // com.google.android.gms.ads.mediation.NativeAdMapper
        public void trackView(View view) {
            if (view instanceof NativeAdView) {
                ((NativeAdView) view).setNativeAd(this.zzgl);
            }
        }
    }

    /* loaded from: classes.dex */
    static class zzb extends NativeContentAdMapper {
        private final NativeContentAd zzgm;

        public zzb(NativeContentAd nativeContentAd) {
            this.zzgm = nativeContentAd;
            setHeadline(nativeContentAd.getHeadline().toString());
            setImages(nativeContentAd.getImages());
            setBody(nativeContentAd.getBody().toString());
            if (nativeContentAd.getLogo() != null) {
                setLogo(nativeContentAd.getLogo());
            }
            setCallToAction(nativeContentAd.getCallToAction().toString());
            setAdvertiser(nativeContentAd.getAdvertiser().toString());
            setOverrideImpressionRecording(true);
            setOverrideClickHandling(true);
        }

        @Override // com.google.android.gms.ads.mediation.NativeAdMapper
        public void trackView(View view) {
            if (view instanceof NativeAdView) {
                ((NativeAdView) view).setNativeAd(this.zzgm);
            }
        }
    }

    /* loaded from: classes.dex */
    static final class zzc extends AdListener implements com.google.android.gms.ads.internal.client.zza {
        final AbstractAdViewAdapter zzgn;
        final com.google.android.gms.ads.mediation.MediationBannerListener zzgo;

        public zzc(AbstractAdViewAdapter abstractAdViewAdapter, com.google.android.gms.ads.mediation.MediationBannerListener mediationBannerListener) {
            this.zzgn = abstractAdViewAdapter;
            this.zzgo = mediationBannerListener;
        }

        @Override // com.google.android.gms.ads.internal.client.zza
        public void onAdClicked() {
            this.zzgo.onAdClicked(this.zzgn);
        }

        @Override // com.google.android.gms.ads.AdListener
        public void onAdClosed() {
            this.zzgo.onAdClosed(this.zzgn);
        }

        @Override // com.google.android.gms.ads.AdListener
        public void onAdFailedToLoad(int i) {
            this.zzgo.onAdFailedToLoad(this.zzgn, i);
        }

        @Override // com.google.android.gms.ads.AdListener
        public void onAdLeftApplication() {
            this.zzgo.onAdLeftApplication(this.zzgn);
        }

        @Override // com.google.android.gms.ads.AdListener
        public void onAdLoaded() {
            this.zzgo.onAdLoaded(this.zzgn);
        }

        @Override // com.google.android.gms.ads.AdListener
        public void onAdOpened() {
            this.zzgo.onAdOpened(this.zzgn);
        }
    }

    /* loaded from: classes.dex */
    static final class zzd extends AdListener implements com.google.android.gms.ads.internal.client.zza {
        final AbstractAdViewAdapter zzgn;
        final com.google.android.gms.ads.mediation.MediationInterstitialListener zzgp;

        public zzd(AbstractAdViewAdapter abstractAdViewAdapter, com.google.android.gms.ads.mediation.MediationInterstitialListener mediationInterstitialListener) {
            this.zzgn = abstractAdViewAdapter;
            this.zzgp = mediationInterstitialListener;
        }

        @Override // com.google.android.gms.ads.internal.client.zza
        public void onAdClicked() {
            this.zzgp.onAdClicked(this.zzgn);
        }

        @Override // com.google.android.gms.ads.AdListener
        public void onAdClosed() {
            this.zzgp.onAdClosed(this.zzgn);
        }

        @Override // com.google.android.gms.ads.AdListener
        public void onAdFailedToLoad(int i) {
            this.zzgp.onAdFailedToLoad(this.zzgn, i);
        }

        @Override // com.google.android.gms.ads.AdListener
        public void onAdLeftApplication() {
            this.zzgp.onAdLeftApplication(this.zzgn);
        }

        @Override // com.google.android.gms.ads.AdListener
        public void onAdLoaded() {
            this.zzgp.onAdLoaded(this.zzgn);
        }

        @Override // com.google.android.gms.ads.AdListener
        public void onAdOpened() {
            this.zzgp.onAdOpened(this.zzgn);
        }
    }

    /* loaded from: classes.dex */
    static final class zze extends AdListener implements NativeAppInstallAd.OnAppInstallAdLoadedListener, NativeContentAd.OnContentAdLoadedListener, com.google.android.gms.ads.internal.client.zza {
        final AbstractAdViewAdapter zzgn;
        final MediationNativeListener zzgq;

        public zze(AbstractAdViewAdapter abstractAdViewAdapter, MediationNativeListener mediationNativeListener) {
            this.zzgn = abstractAdViewAdapter;
            this.zzgq = mediationNativeListener;
        }

        @Override // com.google.android.gms.ads.internal.client.zza
        public void onAdClicked() {
            this.zzgq.onAdClicked(this.zzgn);
        }

        @Override // com.google.android.gms.ads.AdListener
        public void onAdClosed() {
            this.zzgq.onAdClosed(this.zzgn);
        }

        @Override // com.google.android.gms.ads.AdListener
        public void onAdFailedToLoad(int i) {
            this.zzgq.onAdFailedToLoad(this.zzgn, i);
        }

        @Override // com.google.android.gms.ads.AdListener
        public void onAdLeftApplication() {
            this.zzgq.onAdLeftApplication(this.zzgn);
        }

        @Override // com.google.android.gms.ads.AdListener
        public void onAdLoaded() {
        }

        @Override // com.google.android.gms.ads.AdListener
        public void onAdOpened() {
            this.zzgq.onAdOpened(this.zzgn);
        }

        @Override // com.google.android.gms.ads.formats.NativeAppInstallAd.OnAppInstallAdLoadedListener
        public void onAppInstallAdLoaded(NativeAppInstallAd nativeAppInstallAd) {
            this.zzgq.onAdLoaded(this.zzgn, new zza(nativeAppInstallAd));
        }

        @Override // com.google.android.gms.ads.formats.NativeContentAd.OnContentAdLoadedListener
        public void onContentAdLoaded(NativeContentAd nativeContentAd) {
            this.zzgq.onAdLoaded(this.zzgn, new zzb(nativeContentAd));
        }
    }

    public String getAdUnitId(Bundle bundle) {
        return bundle.getString(AD_UNIT_ID_PARAMETER);
    }

    @Override // com.google.android.gms.ads.mediation.MediationBannerAdapter
    public View getBannerView() {
        return this.zzgd;
    }

    @Override // com.google.android.gms.internal.zzmr
    public Bundle getInterstitialAdapterInfo() {
        return new MediationAdapter.zza().zzbk(1).zzys();
    }

    @Override // com.google.android.gms.ads.reward.mediation.MediationRewardedVideoAdAdapter
    public void initialize(Context context, com.google.android.gms.ads.mediation.MediationAdRequest mediationAdRequest, String str, MediationRewardedVideoAdListener mediationRewardedVideoAdListener, Bundle bundle, Bundle bundle2) {
        this.zzgg = context.getApplicationContext();
        this.zzgi = mediationRewardedVideoAdListener;
        this.zzgi.onInitializationSucceeded(this);
    }

    @Override // com.google.android.gms.ads.reward.mediation.MediationRewardedVideoAdAdapter
    public boolean isInitialized() {
        return this.zzgi != null;
    }

    @Override // com.google.android.gms.ads.reward.mediation.MediationRewardedVideoAdAdapter
    public void loadAd(com.google.android.gms.ads.mediation.MediationAdRequest mediationAdRequest, Bundle bundle, Bundle bundle2) {
        if (this.zzgg == null || this.zzgi == null) {
            com.google.android.gms.ads.internal.util.client.zzb.e("AdMobAdapter.loadAd called before initialize.");
            return;
        }
        this.zzgh = new InterstitialAd(this.zzgg);
        this.zzgh.zzd(true);
        this.zzgh.setAdUnitId(getAdUnitId(bundle));
        this.zzgh.setRewardedVideoAdListener(this.zzgj);
        this.zzgh.loadAd(zza(this.zzgg, mediationAdRequest, bundle2, bundle));
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdapter
    public void onDestroy() {
        if (this.zzgd != null) {
            this.zzgd.destroy();
            this.zzgd = null;
        }
        if (this.zzge != null) {
            this.zzge = null;
        }
        if (this.zzgf != null) {
            this.zzgf = null;
        }
        if (this.zzgh != null) {
            this.zzgh = null;
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdapter
    public void onPause() {
        if (this.zzgd != null) {
            this.zzgd.pause();
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdapter
    public void onResume() {
        if (this.zzgd != null) {
            this.zzgd.resume();
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationBannerAdapter
    public void requestBannerAd(Context context, com.google.android.gms.ads.mediation.MediationBannerListener mediationBannerListener, Bundle bundle, AdSize adSize, com.google.android.gms.ads.mediation.MediationAdRequest mediationAdRequest, Bundle bundle2) {
        this.zzgd = new AdView(context);
        this.zzgd.setAdSize(new AdSize(adSize.getWidth(), adSize.getHeight()));
        this.zzgd.setAdUnitId(getAdUnitId(bundle));
        this.zzgd.setAdListener(new zzc(this, mediationBannerListener));
        this.zzgd.loadAd(zza(context, mediationAdRequest, bundle2, bundle));
    }

    @Override // com.google.android.gms.ads.mediation.MediationInterstitialAdapter
    public void requestInterstitialAd(Context context, com.google.android.gms.ads.mediation.MediationInterstitialListener mediationInterstitialListener, Bundle bundle, com.google.android.gms.ads.mediation.MediationAdRequest mediationAdRequest, Bundle bundle2) {
        this.zzge = new InterstitialAd(context);
        this.zzge.setAdUnitId(getAdUnitId(bundle));
        this.zzge.setAdListener(new zzd(this, mediationInterstitialListener));
        this.zzge.loadAd(zza(context, mediationAdRequest, bundle2, bundle));
    }

    @Override // com.google.android.gms.ads.mediation.MediationNativeAdapter
    public void requestNativeAd(Context context, MediationNativeListener mediationNativeListener, Bundle bundle, NativeMediationAdRequest nativeMediationAdRequest, Bundle bundle2) {
        zze zzeVar = new zze(this, mediationNativeListener);
        AdLoader.Builder withAdListener = zza(context, bundle.getString(AD_UNIT_ID_PARAMETER)).withAdListener(zzeVar);
        NativeAdOptions nativeAdOptions = nativeMediationAdRequest.getNativeAdOptions();
        if (nativeAdOptions != null) {
            withAdListener.withNativeAdOptions(nativeAdOptions);
        }
        if (nativeMediationAdRequest.isAppInstallAdRequested()) {
            withAdListener.forAppInstallAd(zzeVar);
        }
        if (nativeMediationAdRequest.isContentAdRequested()) {
            withAdListener.forContentAd(zzeVar);
        }
        this.zzgf = withAdListener.build();
        this.zzgf.loadAd(zza(context, nativeMediationAdRequest, bundle2, bundle));
    }

    @Override // com.google.android.gms.ads.mediation.MediationInterstitialAdapter
    public void showInterstitial() {
        this.zzge.show();
    }

    @Override // com.google.android.gms.ads.reward.mediation.MediationRewardedVideoAdAdapter
    public void showVideo() {
        this.zzgh.show();
    }

    protected abstract Bundle zza(Bundle bundle, Bundle bundle2);

    AdLoader.Builder zza(Context context, String str) {
        return new AdLoader.Builder(context, str);
    }

    AdRequest zza(Context context, com.google.android.gms.ads.mediation.MediationAdRequest mediationAdRequest, Bundle bundle, Bundle bundle2) {
        AdRequest.Builder builder = new AdRequest.Builder();
        Date birthday = mediationAdRequest.getBirthday();
        if (birthday != null) {
            builder.setBirthday(birthday);
        }
        int gender = mediationAdRequest.getGender();
        if (gender != 0) {
            builder.setGender(gender);
        }
        Set<String> keywords = mediationAdRequest.getKeywords();
        if (keywords != null) {
            for (String str : keywords) {
                builder.addKeyword(str);
            }
        }
        Location location = mediationAdRequest.getLocation();
        if (location != null) {
            builder.setLocation(location);
        }
        if (mediationAdRequest.isTesting()) {
            builder.addTestDevice(zzm.zzkr().zzao(context));
        }
        if (mediationAdRequest.taggedForChildDirectedTreatment() != -1) {
            builder.tagForChildDirectedTreatment(mediationAdRequest.taggedForChildDirectedTreatment() == 1);
        }
        builder.setIsDesignedForFamilies(mediationAdRequest.isDesignedForFamilies());
        builder.addNetworkExtrasBundle(AdMobAdapter.class, zza(bundle, bundle2));
        return builder.build();
    }
}
