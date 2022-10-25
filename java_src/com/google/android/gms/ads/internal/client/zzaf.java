package com.google.android.gms.ads.internal.client;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.Correlator;
import com.google.android.gms.ads.doubleclick.AppEventListener;
import com.google.android.gms.ads.doubleclick.OnCustomRenderedAdLoadedListener;
import com.google.android.gms.ads.doubleclick.PublisherInterstitialAd;
import com.google.android.gms.ads.purchase.InAppPurchaseListener;
import com.google.android.gms.ads.purchase.PlayStorePurchaseListener;
import com.google.android.gms.ads.reward.RewardedVideoAdListener;
import com.google.android.gms.internal.zzee;
import com.google.android.gms.internal.zzgy;
import com.google.android.gms.internal.zzil;
import com.google.android.gms.internal.zzip;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class zzaf {
    private final Context mContext;
    private final zzh zzakc;
    private String zzant;
    private zza zzayj;
    private AdListener zzayk;
    private AppEventListener zzazw;
    private final zzgy zzbba;
    private Correlator zzbbe;
    private zzu zzbbf;
    private InAppPurchaseListener zzbbg;
    private OnCustomRenderedAdLoadedListener zzbbh;
    private PlayStorePurchaseListener zzbbi;
    private String zzbbj;
    private PublisherInterstitialAd zzbbn;
    private boolean zzbbo;
    private RewardedVideoAdListener zzgj;

    public zzaf(Context context) {
        this(context, zzh.zzkb(), null);
    }

    public zzaf(Context context, PublisherInterstitialAd publisherInterstitialAd) {
        this(context, zzh.zzkb(), publisherInterstitialAd);
    }

    public zzaf(Context context, zzh zzhVar, PublisherInterstitialAd publisherInterstitialAd) {
        this.zzbba = new zzgy();
        this.mContext = context;
        this.zzakc = zzhVar;
        this.zzbbn = publisherInterstitialAd;
    }

    private void zzat(String str) throws RemoteException {
        if (this.zzant == null) {
            zzau(str);
        }
        this.zzbbf = zzm.zzks().zzb(this.mContext, this.zzbbo ? AdSizeParcel.zzkc() : new AdSizeParcel(), this.zzant, this.zzbba);
        if (this.zzayk != null) {
            this.zzbbf.zza(new zzc(this.zzayk));
        }
        if (this.zzayj != null) {
            this.zzbbf.zza(new zzb(this.zzayj));
        }
        if (this.zzazw != null) {
            this.zzbbf.zza(new zzj(this.zzazw));
        }
        if (this.zzbbg != null) {
            this.zzbbf.zza(new zzil(this.zzbbg));
        }
        if (this.zzbbi != null) {
            this.zzbbf.zza(new zzip(this.zzbbi), this.zzbbj);
        }
        if (this.zzbbh != null) {
            this.zzbbf.zza(new zzee(this.zzbbh));
        }
        if (this.zzbbe != null) {
            this.zzbbf.zza(this.zzbbe.zzdu());
        }
        if (this.zzgj != null) {
            this.zzbbf.zza(new com.google.android.gms.ads.internal.reward.client.zzg(this.zzgj));
        }
    }

    private void zzau(String str) {
        if (this.zzbbf == null) {
            throw new IllegalStateException(new StringBuilder(String.valueOf(str).length() + 63).append("The ad unit ID must be set on InterstitialAd before ").append(str).append(" is called.").toString());
        }
    }

    public AdListener getAdListener() {
        return this.zzayk;
    }

    public String getAdUnitId() {
        return this.zzant;
    }

    public AppEventListener getAppEventListener() {
        return this.zzazw;
    }

    public InAppPurchaseListener getInAppPurchaseListener() {
        return this.zzbbg;
    }

    public String getMediationAdapterClassName() {
        try {
            if (this.zzbbf != null) {
                return this.zzbbf.getMediationAdapterClassName();
            }
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to get the mediation adapter class name.", e);
        }
        return null;
    }

    public OnCustomRenderedAdLoadedListener getOnCustomRenderedAdLoadedListener() {
        return this.zzbbh;
    }

    public boolean isLoaded() {
        try {
            if (this.zzbbf != null) {
                return this.zzbbf.isReady();
            }
            return false;
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to check if ad is ready.", e);
            return false;
        }
    }

    public boolean isLoading() {
        try {
            if (this.zzbbf != null) {
                return this.zzbbf.isLoading();
            }
            return false;
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to check if ad is loading.", e);
            return false;
        }
    }

    public void setAdListener(AdListener adListener) {
        try {
            this.zzayk = adListener;
            if (this.zzbbf == null) {
                return;
            }
            this.zzbbf.zza(adListener != null ? new zzc(adListener) : null);
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to set the AdListener.", e);
        }
    }

    public void setAdUnitId(String str) {
        if (this.zzant != null) {
            throw new IllegalStateException("The ad unit ID can only be set once on InterstitialAd.");
        }
        this.zzant = str;
    }

    public void setAppEventListener(AppEventListener appEventListener) {
        try {
            this.zzazw = appEventListener;
            if (this.zzbbf == null) {
                return;
            }
            this.zzbbf.zza(appEventListener != null ? new zzj(appEventListener) : null);
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to set the AppEventListener.", e);
        }
    }

    public void setCorrelator(Correlator correlator) {
        this.zzbbe = correlator;
        try {
            if (this.zzbbf == null) {
                return;
            }
            this.zzbbf.zza(this.zzbbe == null ? null : this.zzbbe.zzdu());
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to set correlator.", e);
        }
    }

    public void setInAppPurchaseListener(InAppPurchaseListener inAppPurchaseListener) {
        if (this.zzbbi != null) {
            throw new IllegalStateException("Play store purchase parameter has already been set.");
        }
        try {
            this.zzbbg = inAppPurchaseListener;
            if (this.zzbbf == null) {
                return;
            }
            this.zzbbf.zza(inAppPurchaseListener != null ? new zzil(inAppPurchaseListener) : null);
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to set the InAppPurchaseListener.", e);
        }
    }

    public void setOnCustomRenderedAdLoadedListener(OnCustomRenderedAdLoadedListener onCustomRenderedAdLoadedListener) {
        try {
            this.zzbbh = onCustomRenderedAdLoadedListener;
            if (this.zzbbf == null) {
                return;
            }
            this.zzbbf.zza(onCustomRenderedAdLoadedListener != null ? new zzee(onCustomRenderedAdLoadedListener) : null);
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to set the OnCustomRenderedAdLoadedListener.", e);
        }
    }

    public void setPlayStorePurchaseParams(PlayStorePurchaseListener playStorePurchaseListener, String str) {
        if (this.zzbbg != null) {
            throw new IllegalStateException("In app purchase parameter has already been set.");
        }
        try {
            this.zzbbi = playStorePurchaseListener;
            this.zzbbj = str;
            if (this.zzbbf == null) {
                return;
            }
            this.zzbbf.zza(playStorePurchaseListener != null ? new zzip(playStorePurchaseListener) : null, str);
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to set the play store purchase parameter.", e);
        }
    }

    public void setRewardedVideoAdListener(RewardedVideoAdListener rewardedVideoAdListener) {
        try {
            this.zzgj = rewardedVideoAdListener;
            if (this.zzbbf == null) {
                return;
            }
            this.zzbbf.zza(rewardedVideoAdListener != null ? new com.google.android.gms.ads.internal.reward.client.zzg(rewardedVideoAdListener) : null);
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to set the AdListener.", e);
        }
    }

    public void show() {
        try {
            zzau("show");
            this.zzbbf.showInterstitial();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to show interstitial.", e);
        }
    }

    public void zza(zza zzaVar) {
        try {
            this.zzayj = zzaVar;
            if (this.zzbbf == null) {
                return;
            }
            this.zzbbf.zza(zzaVar != null ? new zzb(zzaVar) : null);
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to set the AdClickListener.", e);
        }
    }

    public void zza(zzad zzadVar) {
        try {
            if (this.zzbbf == null) {
                zzat("loadAd");
            }
            if (!this.zzbbf.zzb(this.zzakc.zza(this.mContext, zzadVar))) {
                return;
            }
            this.zzbba.zzi(zzadVar.zzlb());
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to load ad.", e);
        }
    }

    public void zzd(boolean z) {
        this.zzbbo = z;
    }
}
