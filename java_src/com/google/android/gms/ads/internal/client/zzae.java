package com.google.android.gms.ads.internal.client;

import android.content.Context;
import android.os.RemoteException;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.Correlator;
import com.google.android.gms.ads.VideoController;
import com.google.android.gms.ads.VideoOptions;
import com.google.android.gms.ads.doubleclick.AppEventListener;
import com.google.android.gms.ads.doubleclick.OnCustomRenderedAdLoadedListener;
import com.google.android.gms.ads.purchase.InAppPurchaseListener;
import com.google.android.gms.ads.purchase.PlayStorePurchaseListener;
import com.google.android.gms.internal.zzee;
import com.google.android.gms.internal.zzgy;
import com.google.android.gms.internal.zzil;
import com.google.android.gms.internal.zzip;
import com.google.android.gms.internal.zzji;
import java.util.concurrent.atomic.AtomicBoolean;
@zzji
/* loaded from: classes.dex */
public class zzae {
    private final zzh zzakc;
    private VideoOptions zzalc;
    private boolean zzamv;
    private String zzant;
    private zza zzayj;
    private AdListener zzayk;
    private AppEventListener zzazw;
    private AdSize[] zzazx;
    private final zzgy zzbba;
    private final AtomicBoolean zzbbb;
    private final VideoController zzbbc;
    final zzo zzbbd;
    private Correlator zzbbe;
    private zzu zzbbf;
    private InAppPurchaseListener zzbbg;
    private OnCustomRenderedAdLoadedListener zzbbh;
    private PlayStorePurchaseListener zzbbi;
    private String zzbbj;
    private ViewGroup zzbbk;
    private int zzbbl;

    public zzae(ViewGroup viewGroup) {
        this(viewGroup, null, false, zzh.zzkb(), 0);
    }

    public zzae(ViewGroup viewGroup, int i) {
        this(viewGroup, null, false, zzh.zzkb(), i);
    }

    public zzae(ViewGroup viewGroup, AttributeSet attributeSet, boolean z) {
        this(viewGroup, attributeSet, z, zzh.zzkb(), 0);
    }

    public zzae(ViewGroup viewGroup, AttributeSet attributeSet, boolean z, int i) {
        this(viewGroup, attributeSet, z, zzh.zzkb(), i);
    }

    zzae(ViewGroup viewGroup, AttributeSet attributeSet, boolean z, zzh zzhVar, int i) {
        this(viewGroup, attributeSet, z, zzhVar, null, i);
    }

    zzae(ViewGroup viewGroup, AttributeSet attributeSet, boolean z, zzh zzhVar, zzu zzuVar, int i) {
        this.zzbba = new zzgy();
        this.zzbbc = new VideoController();
        this.zzbbd = new zzo() { // from class: com.google.android.gms.ads.internal.client.zzae.1
            @Override // com.google.android.gms.ads.internal.client.zzo, com.google.android.gms.ads.AdListener
            public void onAdFailedToLoad(int i2) {
                zzae.this.zzbbc.zza(zzae.this.zzdw());
                super.onAdFailedToLoad(i2);
            }

            @Override // com.google.android.gms.ads.internal.client.zzo, com.google.android.gms.ads.AdListener
            public void onAdLoaded() {
                zzae.this.zzbbc.zza(zzae.this.zzdw());
                super.onAdLoaded();
            }
        };
        this.zzbbk = viewGroup;
        this.zzakc = zzhVar;
        this.zzbbf = zzuVar;
        this.zzbbb = new AtomicBoolean(false);
        this.zzbbl = i;
        if (attributeSet != null) {
            Context context = viewGroup.getContext();
            try {
                zzk zzkVar = new zzk(context, attributeSet);
                this.zzazx = zzkVar.zzm(z);
                this.zzant = zzkVar.getAdUnitId();
                if (!viewGroup.isInEditMode()) {
                    return;
                }
                zzm.zzkr().zza(viewGroup, zza(context, this.zzazx[0], this.zzbbl), "Ads by Google");
            } catch (IllegalArgumentException e) {
                zzm.zzkr().zza(viewGroup, new AdSizeParcel(context, AdSize.BANNER), e.getMessage(), e.getMessage());
            }
        }
    }

    private static AdSizeParcel zza(Context context, AdSize adSize, int i) {
        AdSizeParcel adSizeParcel = new AdSizeParcel(context, adSize);
        adSizeParcel.zzl(zzy(i));
        return adSizeParcel;
    }

    private static AdSizeParcel zza(Context context, AdSize[] adSizeArr, int i) {
        AdSizeParcel adSizeParcel = new AdSizeParcel(context, adSizeArr);
        adSizeParcel.zzl(zzy(i));
        return adSizeParcel;
    }

    private void zzlf() {
        try {
            com.google.android.gms.dynamic.zzd zzef = this.zzbbf.zzef();
            if (zzef == null) {
                return;
            }
            this.zzbbk.addView((View) com.google.android.gms.dynamic.zze.zzae(zzef));
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to get an ad frame.", e);
        }
    }

    private static boolean zzy(int i) {
        return i == 1;
    }

    public void destroy() {
        try {
            if (this.zzbbf == null) {
                return;
            }
            this.zzbbf.destroy();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to destroy AdView.", e);
        }
    }

    public AdListener getAdListener() {
        return this.zzayk;
    }

    public AdSize getAdSize() {
        AdSizeParcel zzeg;
        try {
            if (this.zzbbf != null && (zzeg = this.zzbbf.zzeg()) != null) {
                return zzeg.zzkd();
            }
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to get the current AdSize.", e);
        }
        if (this.zzazx != null) {
            return this.zzazx[0];
        }
        return null;
    }

    public AdSize[] getAdSizes() {
        return this.zzazx;
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

    public VideoController getVideoController() {
        return this.zzbbc;
    }

    public VideoOptions getVideoOptions() {
        return this.zzalc;
    }

    public boolean isLoading() {
        try {
            if (this.zzbbf != null) {
                return this.zzbbf.isLoading();
            }
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to check if ad is loading.", e);
        }
        return false;
    }

    public void pause() {
        try {
            if (this.zzbbf == null) {
                return;
            }
            this.zzbbf.pause();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to call pause.", e);
        }
    }

    public void recordManualImpression() {
        if (this.zzbbb.getAndSet(true)) {
            return;
        }
        try {
            if (this.zzbbf == null) {
                return;
            }
            this.zzbbf.zzei();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to record impression.", e);
        }
    }

    public void resume() {
        try {
            if (this.zzbbf == null) {
                return;
            }
            this.zzbbf.resume();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to call resume.", e);
        }
    }

    public void setAdListener(AdListener adListener) {
        this.zzayk = adListener;
        this.zzbbd.zza(adListener);
    }

    public void setAdSizes(AdSize... adSizeArr) {
        if (this.zzazx != null) {
            throw new IllegalStateException("The ad size can only be set once on AdView.");
        }
        zza(adSizeArr);
    }

    public void setAdUnitId(String str) {
        if (this.zzant != null) {
            throw new IllegalStateException("The ad unit ID can only be set once on AdView.");
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

    public void setManualImpressionsEnabled(boolean z) {
        this.zzamv = z;
        try {
            if (this.zzbbf == null) {
                return;
            }
            this.zzbbf.setManualImpressionsEnabled(this.zzamv);
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to set manual impressions.", e);
        }
    }

    public void setOnCustomRenderedAdLoadedListener(OnCustomRenderedAdLoadedListener onCustomRenderedAdLoadedListener) {
        this.zzbbh = onCustomRenderedAdLoadedListener;
        try {
            if (this.zzbbf == null) {
                return;
            }
            this.zzbbf.zza(onCustomRenderedAdLoadedListener != null ? new zzee(onCustomRenderedAdLoadedListener) : null);
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to set the onCustomRenderedAdLoadedListener.", e);
        }
    }

    public void setPlayStorePurchaseParams(PlayStorePurchaseListener playStorePurchaseListener, String str) {
        if (this.zzbbg != null) {
            throw new IllegalStateException("InAppPurchaseListener has already been set.");
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

    public void setVideoOptions(VideoOptions videoOptions) {
        this.zzalc = videoOptions;
        try {
            if (this.zzbbf == null) {
                return;
            }
            this.zzbbf.zza(videoOptions == null ? null : new VideoOptionsParcel(videoOptions));
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to set video options.", e);
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
                zzlg();
            }
            if (!this.zzbbf.zzb(this.zzakc.zza(this.zzbbk.getContext(), zzadVar))) {
                return;
            }
            this.zzbba.zzi(zzadVar.zzlb());
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to load ad.", e);
        }
    }

    public void zza(AdSize... adSizeArr) {
        this.zzazx = adSizeArr;
        try {
            if (this.zzbbf != null) {
                this.zzbbf.zza(zza(this.zzbbk.getContext(), this.zzazx, this.zzbbl));
            }
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to set the ad size.", e);
        }
        this.zzbbk.requestLayout();
    }

    public boolean zzb(AdSizeParcel adSizeParcel) {
        return "search_v2".equals(adSizeParcel.zzazq);
    }

    public zzab zzdw() {
        if (this.zzbbf == null) {
            return null;
        }
        try {
            return this.zzbbf.zzej();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to retrieve VideoController.", e);
            return null;
        }
    }

    void zzlg() throws RemoteException {
        if ((this.zzazx == null || this.zzant == null) && this.zzbbf == null) {
            throw new IllegalStateException("The ad size and ad unit ID must be set before loadAd is called.");
        }
        this.zzbbf = zzlh();
        this.zzbbf.zza(new zzc(this.zzbbd));
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
        if (this.zzalc != null) {
            this.zzbbf.zza(new VideoOptionsParcel(this.zzalc));
        }
        this.zzbbf.setManualImpressionsEnabled(this.zzamv);
        zzlf();
    }

    protected zzu zzlh() throws RemoteException {
        Context context = this.zzbbk.getContext();
        AdSizeParcel zza = zza(context, this.zzazx, this.zzbbl);
        return zzb(zza) ? zzm.zzks().zza(context, zza, this.zzant) : zzm.zzks().zza(context, zza, this.zzant, this.zzbba);
    }
}
