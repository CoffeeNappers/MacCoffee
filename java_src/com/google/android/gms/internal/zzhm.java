package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.ads.AdRequest;
import com.google.ads.mediation.MediationBannerAdapter;
import com.google.ads.mediation.MediationBannerListener;
import com.google.ads.mediation.MediationInterstitialAdapter;
import com.google.ads.mediation.MediationInterstitialListener;
import com.google.ads.mediation.MediationServerParameters;
import com.google.ads.mediation.NetworkExtras;
@zzji
/* loaded from: classes.dex */
public final class zzhm<NETWORK_EXTRAS extends NetworkExtras, SERVER_PARAMETERS extends MediationServerParameters> implements MediationBannerListener, MediationInterstitialListener {
    private final zzhb zzbxj;

    public zzhm(zzhb zzhbVar) {
        this.zzbxj = zzhbVar;
    }

    @Override // com.google.ads.mediation.MediationBannerListener
    public void onClick(MediationBannerAdapter<?, ?> mediationBannerAdapter) {
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onClick.");
        if (!com.google.android.gms.ads.internal.client.zzm.zzkr().zzwq()) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdi("onClick must be called on the main UI thread.");
            com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.internal.zzhm.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        zzhm.this.zzbxj.onAdClicked();
                    } catch (RemoteException e) {
                        com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdClicked.", e);
                    }
                }
            });
            return;
        }
        try {
            this.zzbxj.onAdClicked();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdClicked.", e);
        }
    }

    @Override // com.google.ads.mediation.MediationBannerListener
    public void onDismissScreen(MediationBannerAdapter<?, ?> mediationBannerAdapter) {
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onDismissScreen.");
        if (!com.google.android.gms.ads.internal.client.zzm.zzkr().zzwq()) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdi("onDismissScreen must be called on the main UI thread.");
            com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.internal.zzhm.4
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        zzhm.this.zzbxj.onAdClosed();
                    } catch (RemoteException e) {
                        com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdClosed.", e);
                    }
                }
            });
            return;
        }
        try {
            this.zzbxj.onAdClosed();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdClosed.", e);
        }
    }

    @Override // com.google.ads.mediation.MediationInterstitialListener
    public void onDismissScreen(MediationInterstitialAdapter<?, ?> mediationInterstitialAdapter) {
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onDismissScreen.");
        if (!com.google.android.gms.ads.internal.client.zzm.zzkr().zzwq()) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdi("onDismissScreen must be called on the main UI thread.");
            com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.internal.zzhm.9
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        zzhm.this.zzbxj.onAdClosed();
                    } catch (RemoteException e) {
                        com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdClosed.", e);
                    }
                }
            });
            return;
        }
        try {
            this.zzbxj.onAdClosed();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdClosed.", e);
        }
    }

    @Override // com.google.ads.mediation.MediationBannerListener
    public void onFailedToReceiveAd(MediationBannerAdapter<?, ?> mediationBannerAdapter, final AdRequest.ErrorCode errorCode) {
        String valueOf = String.valueOf(errorCode);
        com.google.android.gms.ads.internal.util.client.zzb.zzdg(new StringBuilder(String.valueOf(valueOf).length() + 47).append("Adapter called onFailedToReceiveAd with error. ").append(valueOf).toString());
        if (!com.google.android.gms.ads.internal.client.zzm.zzkr().zzwq()) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdi("onFailedToReceiveAd must be called on the main UI thread.");
            com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.internal.zzhm.5
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        zzhm.this.zzbxj.onAdFailedToLoad(zzhn.zza(errorCode));
                    } catch (RemoteException e) {
                        com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdFailedToLoad.", e);
                    }
                }
            });
            return;
        }
        try {
            this.zzbxj.onAdFailedToLoad(zzhn.zza(errorCode));
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdFailedToLoad.", e);
        }
    }

    @Override // com.google.ads.mediation.MediationInterstitialListener
    public void onFailedToReceiveAd(MediationInterstitialAdapter<?, ?> mediationInterstitialAdapter, final AdRequest.ErrorCode errorCode) {
        String valueOf = String.valueOf(errorCode);
        com.google.android.gms.ads.internal.util.client.zzb.zzdg(new StringBuilder(String.valueOf(valueOf).length() + 47).append("Adapter called onFailedToReceiveAd with error ").append(valueOf).append(".").toString());
        if (!com.google.android.gms.ads.internal.client.zzm.zzkr().zzwq()) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdi("onFailedToReceiveAd must be called on the main UI thread.");
            com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.internal.zzhm.10
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        zzhm.this.zzbxj.onAdFailedToLoad(zzhn.zza(errorCode));
                    } catch (RemoteException e) {
                        com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdFailedToLoad.", e);
                    }
                }
            });
            return;
        }
        try {
            this.zzbxj.onAdFailedToLoad(zzhn.zza(errorCode));
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdFailedToLoad.", e);
        }
    }

    @Override // com.google.ads.mediation.MediationBannerListener
    public void onLeaveApplication(MediationBannerAdapter<?, ?> mediationBannerAdapter) {
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onLeaveApplication.");
        if (!com.google.android.gms.ads.internal.client.zzm.zzkr().zzwq()) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdi("onLeaveApplication must be called on the main UI thread.");
            com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.internal.zzhm.6
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        zzhm.this.zzbxj.onAdLeftApplication();
                    } catch (RemoteException e) {
                        com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdLeftApplication.", e);
                    }
                }
            });
            return;
        }
        try {
            this.zzbxj.onAdLeftApplication();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdLeftApplication.", e);
        }
    }

    @Override // com.google.ads.mediation.MediationInterstitialListener
    public void onLeaveApplication(MediationInterstitialAdapter<?, ?> mediationInterstitialAdapter) {
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onLeaveApplication.");
        if (!com.google.android.gms.ads.internal.client.zzm.zzkr().zzwq()) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdi("onLeaveApplication must be called on the main UI thread.");
            com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.internal.zzhm.11
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        zzhm.this.zzbxj.onAdLeftApplication();
                    } catch (RemoteException e) {
                        com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdLeftApplication.", e);
                    }
                }
            });
            return;
        }
        try {
            this.zzbxj.onAdLeftApplication();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdLeftApplication.", e);
        }
    }

    @Override // com.google.ads.mediation.MediationBannerListener
    public void onPresentScreen(MediationBannerAdapter<?, ?> mediationBannerAdapter) {
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onPresentScreen.");
        if (!com.google.android.gms.ads.internal.client.zzm.zzkr().zzwq()) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdi("onPresentScreen must be called on the main UI thread.");
            com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.internal.zzhm.7
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        zzhm.this.zzbxj.onAdOpened();
                    } catch (RemoteException e) {
                        com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdOpened.", e);
                    }
                }
            });
            return;
        }
        try {
            this.zzbxj.onAdOpened();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdOpened.", e);
        }
    }

    @Override // com.google.ads.mediation.MediationInterstitialListener
    public void onPresentScreen(MediationInterstitialAdapter<?, ?> mediationInterstitialAdapter) {
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onPresentScreen.");
        if (!com.google.android.gms.ads.internal.client.zzm.zzkr().zzwq()) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdi("onPresentScreen must be called on the main UI thread.");
            com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.internal.zzhm.2
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        zzhm.this.zzbxj.onAdOpened();
                    } catch (RemoteException e) {
                        com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdOpened.", e);
                    }
                }
            });
            return;
        }
        try {
            this.zzbxj.onAdOpened();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdOpened.", e);
        }
    }

    @Override // com.google.ads.mediation.MediationBannerListener
    public void onReceivedAd(MediationBannerAdapter<?, ?> mediationBannerAdapter) {
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onReceivedAd.");
        if (!com.google.android.gms.ads.internal.client.zzm.zzkr().zzwq()) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdi("onReceivedAd must be called on the main UI thread.");
            com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.internal.zzhm.8
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        zzhm.this.zzbxj.onAdLoaded();
                    } catch (RemoteException e) {
                        com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdLoaded.", e);
                    }
                }
            });
            return;
        }
        try {
            this.zzbxj.onAdLoaded();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdLoaded.", e);
        }
    }

    @Override // com.google.ads.mediation.MediationInterstitialListener
    public void onReceivedAd(MediationInterstitialAdapter<?, ?> mediationInterstitialAdapter) {
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Adapter called onReceivedAd.");
        if (!com.google.android.gms.ads.internal.client.zzm.zzkr().zzwq()) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdi("onReceivedAd must be called on the main UI thread.");
            com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.internal.zzhm.3
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        zzhm.this.zzbxj.onAdLoaded();
                    } catch (RemoteException e) {
                        com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdLoaded.", e);
                    }
                }
            });
            return;
        }
        try {
            this.zzbxj.onAdLoaded();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not call onAdLoaded.", e);
        }
    }
}
