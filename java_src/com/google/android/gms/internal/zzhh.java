package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.android.gms.ads.mediation.MediationBannerAdapter;
import com.google.android.gms.ads.mediation.MediationBannerListener;
import com.google.android.gms.ads.mediation.MediationInterstitialAdapter;
import com.google.android.gms.ads.mediation.MediationInterstitialListener;
import com.google.android.gms.ads.mediation.MediationNativeAdapter;
import com.google.android.gms.ads.mediation.MediationNativeListener;
import com.google.android.gms.ads.mediation.NativeAdMapper;
@zzji
/* loaded from: classes.dex */
public final class zzhh implements MediationBannerListener, MediationInterstitialListener, MediationNativeListener {
    private final zzhb zzbxj;
    private NativeAdMapper zzbxk;

    public zzhh(zzhb zzhbVar) {
        this.zzbxj = zzhbVar;
    }

    @Override // com.google.android.gms.ads.mediation.MediationBannerListener
    public void onAdClicked(MediationBannerAdapter mediationBannerAdapter) {
        com.google.android.gms.common.internal.zzaa.zzhs("onAdClicked must be called on the main UI thread.");
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onAdClicked.");
        try {
            this.zzbxj.onAdClicked();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdClicked.", e);
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationInterstitialListener
    public void onAdClicked(MediationInterstitialAdapter mediationInterstitialAdapter) {
        com.google.android.gms.common.internal.zzaa.zzhs("onAdClicked must be called on the main UI thread.");
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onAdClicked.");
        try {
            this.zzbxj.onAdClicked();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdClicked.", e);
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationNativeListener
    public void onAdClicked(MediationNativeAdapter mediationNativeAdapter) {
        com.google.android.gms.common.internal.zzaa.zzhs("onAdClicked must be called on the main UI thread.");
        NativeAdMapper zzoq = zzoq();
        if (zzoq == null) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdi("Could not call onAdClicked since NativeAdMapper is null.");
        } else if (!zzoq.getOverrideClickHandling()) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Could not call onAdClicked since setOverrideClickHandling is not set to true");
        } else {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onAdClicked.");
            try {
                this.zzbxj.onAdClicked();
            } catch (RemoteException e) {
                com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdClicked.", e);
            }
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationBannerListener
    public void onAdClosed(MediationBannerAdapter mediationBannerAdapter) {
        com.google.android.gms.common.internal.zzaa.zzhs("onAdClosed must be called on the main UI thread.");
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onAdClosed.");
        try {
            this.zzbxj.onAdClosed();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdClosed.", e);
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationInterstitialListener
    public void onAdClosed(MediationInterstitialAdapter mediationInterstitialAdapter) {
        com.google.android.gms.common.internal.zzaa.zzhs("onAdClosed must be called on the main UI thread.");
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onAdClosed.");
        try {
            this.zzbxj.onAdClosed();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdClosed.", e);
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationNativeListener
    public void onAdClosed(MediationNativeAdapter mediationNativeAdapter) {
        com.google.android.gms.common.internal.zzaa.zzhs("onAdClosed must be called on the main UI thread.");
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onAdClosed.");
        try {
            this.zzbxj.onAdClosed();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdClosed.", e);
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationBannerListener
    public void onAdFailedToLoad(MediationBannerAdapter mediationBannerAdapter, int i) {
        com.google.android.gms.common.internal.zzaa.zzhs("onAdFailedToLoad must be called on the main UI thread.");
        com.google.android.gms.ads.internal.util.client.zzb.zzdg(new StringBuilder(55).append("Adapter called onAdFailedToLoad with error. ").append(i).toString());
        try {
            this.zzbxj.onAdFailedToLoad(i);
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdFailedToLoad.", e);
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationInterstitialListener
    public void onAdFailedToLoad(MediationInterstitialAdapter mediationInterstitialAdapter, int i) {
        com.google.android.gms.common.internal.zzaa.zzhs("onAdFailedToLoad must be called on the main UI thread.");
        com.google.android.gms.ads.internal.util.client.zzb.zzdg(new StringBuilder(55).append("Adapter called onAdFailedToLoad with error ").append(i).append(".").toString());
        try {
            this.zzbxj.onAdFailedToLoad(i);
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdFailedToLoad.", e);
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationNativeListener
    public void onAdFailedToLoad(MediationNativeAdapter mediationNativeAdapter, int i) {
        com.google.android.gms.common.internal.zzaa.zzhs("onAdFailedToLoad must be called on the main UI thread.");
        com.google.android.gms.ads.internal.util.client.zzb.zzdg(new StringBuilder(55).append("Adapter called onAdFailedToLoad with error ").append(i).append(".").toString());
        try {
            this.zzbxj.onAdFailedToLoad(i);
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdFailedToLoad.", e);
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationNativeListener
    public void onAdImpression(MediationNativeAdapter mediationNativeAdapter) {
        com.google.android.gms.common.internal.zzaa.zzhs("onAdImpression must be called on the main UI thread.");
        NativeAdMapper zzoq = zzoq();
        if (zzoq == null) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdi("Could not call onAdImpression since NativeAdMapper is null. ");
        } else if (!zzoq.getOverrideImpressionRecording()) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Could not call onAdImpression since setOverrideImpressionRecording is not set to true");
        } else {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onAdImpression.");
            try {
                this.zzbxj.onAdImpression();
            } catch (RemoteException e) {
                com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdImpression.", e);
            }
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationBannerListener
    public void onAdLeftApplication(MediationBannerAdapter mediationBannerAdapter) {
        com.google.android.gms.common.internal.zzaa.zzhs("onAdLeftApplication must be called on the main UI thread.");
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onAdLeftApplication.");
        try {
            this.zzbxj.onAdLeftApplication();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdLeftApplication.", e);
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationInterstitialListener
    public void onAdLeftApplication(MediationInterstitialAdapter mediationInterstitialAdapter) {
        com.google.android.gms.common.internal.zzaa.zzhs("onAdLeftApplication must be called on the main UI thread.");
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onAdLeftApplication.");
        try {
            this.zzbxj.onAdLeftApplication();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdLeftApplication.", e);
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationNativeListener
    public void onAdLeftApplication(MediationNativeAdapter mediationNativeAdapter) {
        com.google.android.gms.common.internal.zzaa.zzhs("onAdLeftApplication must be called on the main UI thread.");
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onAdLeftApplication.");
        try {
            this.zzbxj.onAdLeftApplication();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdLeftApplication.", e);
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationBannerListener
    public void onAdLoaded(MediationBannerAdapter mediationBannerAdapter) {
        com.google.android.gms.common.internal.zzaa.zzhs("onAdLoaded must be called on the main UI thread.");
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onAdLoaded.");
        try {
            this.zzbxj.onAdLoaded();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdLoaded.", e);
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationInterstitialListener
    public void onAdLoaded(MediationInterstitialAdapter mediationInterstitialAdapter) {
        com.google.android.gms.common.internal.zzaa.zzhs("onAdLoaded must be called on the main UI thread.");
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onAdLoaded.");
        try {
            this.zzbxj.onAdLoaded();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdLoaded.", e);
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationNativeListener
    public void onAdLoaded(MediationNativeAdapter mediationNativeAdapter, NativeAdMapper nativeAdMapper) {
        com.google.android.gms.common.internal.zzaa.zzhs("onAdLoaded must be called on the main UI thread.");
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onAdLoaded.");
        this.zzbxk = nativeAdMapper;
        try {
            this.zzbxj.onAdLoaded();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdLoaded.", e);
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationBannerListener
    public void onAdOpened(MediationBannerAdapter mediationBannerAdapter) {
        com.google.android.gms.common.internal.zzaa.zzhs("onAdOpened must be called on the main UI thread.");
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onAdOpened.");
        try {
            this.zzbxj.onAdOpened();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdOpened.", e);
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationInterstitialListener
    public void onAdOpened(MediationInterstitialAdapter mediationInterstitialAdapter) {
        com.google.android.gms.common.internal.zzaa.zzhs("onAdOpened must be called on the main UI thread.");
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onAdOpened.");
        try {
            this.zzbxj.onAdOpened();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdOpened.", e);
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationNativeListener
    public void onAdOpened(MediationNativeAdapter mediationNativeAdapter) {
        com.google.android.gms.common.internal.zzaa.zzhs("onAdOpened must be called on the main UI thread.");
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onAdOpened.");
        try {
            this.zzbxj.onAdOpened();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdOpened.", e);
        }
    }

    public NativeAdMapper zzoq() {
        return this.zzbxk;
    }
}
