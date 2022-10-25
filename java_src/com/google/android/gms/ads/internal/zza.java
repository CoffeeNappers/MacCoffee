package com.google.android.gms.ads.internal;

import android.os.Debug;
import android.os.RemoteException;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewParent;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.ThinAdSizeParcel;
import com.google.android.gms.ads.internal.client.VideoOptionsParcel;
import com.google.android.gms.ads.internal.client.zzab;
import com.google.android.gms.ads.internal.client.zzu;
import com.google.android.gms.ads.internal.client.zzw;
import com.google.android.gms.ads.internal.client.zzy;
import com.google.android.gms.ads.internal.request.zza;
import com.google.android.gms.ads.internal.reward.mediation.client.RewardItemParcel;
import com.google.android.gms.ads.internal.zzv;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzco;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzdx;
import com.google.android.gms.internal.zzdz;
import com.google.android.gms.internal.zzed;
import com.google.android.gms.internal.zzfa;
import com.google.android.gms.internal.zzig;
import com.google.android.gms.internal.zzik;
import com.google.android.gms.internal.zziu;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzjz;
import com.google.android.gms.internal.zzko;
import com.google.android.gms.internal.zzkp;
import com.google.android.gms.internal.zzkt;
import com.google.android.gms.internal.zzku;
import com.google.android.gms.internal.zzkx;
import java.util.HashSet;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.CountDownLatch;
@zzji
/* loaded from: classes.dex */
public abstract class zza extends zzu.zza implements com.google.android.gms.ads.internal.client.zza, com.google.android.gms.ads.internal.overlay.zzp, zza.InterfaceC0022zza, zzfa, zziu.zza, zzkt {
    protected zzdz zzalt;
    protected zzdx zzalu;
    protected zzdx zzalv;
    protected boolean zzalw = false;
    protected final zzr zzalx;
    protected final zzv zzaly;
    @Nullable
    protected transient AdRequestParcel zzalz;
    protected final zzco zzama;
    protected final zzd zzamb;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zza(zzv zzvVar, @Nullable zzr zzrVar, zzd zzdVar) {
        this.zzaly = zzvVar;
        this.zzalx = zzrVar == null ? new zzr(this) : zzrVar;
        this.zzamb = zzdVar;
        zzu.zzgm().zzz(this.zzaly.zzahs);
        zzu.zzgq().zzc(this.zzaly.zzahs, this.zzaly.zzari);
        zzu.zzgr().initialize(this.zzaly.zzahs);
        this.zzama = zzu.zzgq().zzvg();
        zzu.zzgp().initialize(this.zzaly.zzahs);
        zzed();
    }

    private AdRequestParcel zza(AdRequestParcel adRequestParcel) {
        return (!com.google.android.gms.common.util.zzi.zzcj(this.zzaly.zzahs) || adRequestParcel.zzayt == null) ? adRequestParcel : new com.google.android.gms.ads.internal.client.zzf(adRequestParcel).zza(null).zzka();
    }

    private TimerTask zza(final Timer timer, final CountDownLatch countDownLatch) {
        return new TimerTask() { // from class: com.google.android.gms.ads.internal.zza.1
            @Override // java.util.TimerTask, java.lang.Runnable
            public void run() {
                if (zzdr.zzbjn.get().intValue() != countDownLatch.getCount()) {
                    zzkx.zzdg("Stopping method tracing");
                    Debug.stopMethodTracing();
                    if (countDownLatch.getCount() == 0) {
                        timer.cancel();
                        return;
                    }
                }
                String concat = String.valueOf(zza.this.zzaly.zzahs.getPackageName()).concat("_adsTrace_");
                try {
                    zzkx.zzdg("Starting method tracing");
                    countDownLatch.countDown();
                    Debug.startMethodTracing(new StringBuilder(String.valueOf(concat).length() + 20).append(concat).append(zzu.zzgs().currentTimeMillis()).toString(), zzdr.zzbjo.get().intValue());
                } catch (Exception e) {
                    zzkx.zzc("Exception occurred while starting method tracing.", e);
                }
            }
        };
    }

    private void zzd(zzko zzkoVar) {
        if (!zzu.zzgu().zzwg() || zzkoVar.zzcst || TextUtils.isEmpty(zzkoVar.zzclx)) {
            return;
        }
        zzkx.zzdg("Sending troubleshooting signals to the server.");
        zzu.zzgu().zza(this.zzaly.zzahs, this.zzaly.zzari.zzda, zzkoVar.zzclx, this.zzaly.zzarg);
        zzkoVar.zzcst = true;
    }

    private void zzed() {
        if (zzdr.zzbjl.get().booleanValue()) {
            Timer timer = new Timer();
            timer.schedule(zza(timer, new CountDownLatch(zzdr.zzbjn.get().intValue())), 0L, zzdr.zzbjm.get().longValue());
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void destroy() {
        zzaa.zzhs("destroy must be called on the main UI thread.");
        this.zzalx.cancel();
        this.zzama.zzk(this.zzaly.zzarn);
        this.zzaly.destroy();
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public boolean isLoading() {
        return this.zzalw;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public boolean isReady() {
        zzaa.zzhs("isLoaded must be called on the main UI thread.");
        return this.zzaly.zzark == null && this.zzaly.zzarl == null && this.zzaly.zzarn != null;
    }

    @Override // com.google.android.gms.ads.internal.client.zza
    public void onAdClicked() {
        if (this.zzaly.zzarn == null) {
            zzkx.zzdi("Ad state was null when trying to ping click URLs.");
            return;
        }
        zzkx.zzdg("Pinging click URLs.");
        if (this.zzaly.zzarp != null) {
            this.zzaly.zzarp.zzuh();
        }
        if (this.zzaly.zzarn.zzbvk != null) {
            zzu.zzgm().zza(this.zzaly.zzahs, this.zzaly.zzari.zzda, this.zzaly.zzarn.zzbvk);
        }
        if (this.zzaly.zzarq == null) {
            return;
        }
        try {
            this.zzaly.zzarq.onAdClicked();
        } catch (RemoteException e) {
            zzkx.zzc("Could not notify onAdClicked event.", e);
        }
    }

    @Override // com.google.android.gms.internal.zzfa
    public void onAppEvent(String str, @Nullable String str2) {
        if (this.zzaly.zzars != null) {
            try {
                this.zzaly.zzars.onAppEvent(str, str2);
            } catch (RemoteException e) {
                zzkx.zzc("Could not call the AppEventListener.", e);
            }
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void pause() {
        zzaa.zzhs("pause must be called on the main UI thread.");
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void resume() {
        zzaa.zzhs("resume must be called on the main UI thread.");
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void setManualImpressionsEnabled(boolean z) {
        throw new UnsupportedOperationException("Attempt to call setManualImpressionsEnabled for an unsupported ad type.");
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void setUserId(String str) {
        zzkx.zzdi("RewardedVideoAd.setUserId() is deprecated. Please do not call this method.");
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void stopLoading() {
        zzaa.zzhs("stopLoading must be called on the main UI thread.");
        this.zzalw = false;
        this.zzaly.zzi(true);
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(AdSizeParcel adSizeParcel) {
        zzaa.zzhs("setAdSize must be called on the main UI thread.");
        this.zzaly.zzarm = adSizeParcel;
        if (this.zzaly.zzarn != null && this.zzaly.zzarn.zzcbm != null && this.zzaly.zzasi == 0) {
            this.zzaly.zzarn.zzcbm.zza(adSizeParcel);
        }
        if (this.zzaly.zzarj == null) {
            return;
        }
        if (this.zzaly.zzarj.getChildCount() > 1) {
            this.zzaly.zzarj.removeView(this.zzaly.zzarj.getNextView());
        }
        this.zzaly.zzarj.setMinimumWidth(adSizeParcel.widthPixels);
        this.zzaly.zzarj.setMinimumHeight(adSizeParcel.heightPixels);
        this.zzaly.zzarj.requestLayout();
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(@Nullable VideoOptionsParcel videoOptionsParcel) {
        zzaa.zzhs("setVideoOptions must be called on the main UI thread.");
        this.zzaly.zzasb = videoOptionsParcel;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(com.google.android.gms.ads.internal.client.zzp zzpVar) {
        zzaa.zzhs("setAdListener must be called on the main UI thread.");
        this.zzaly.zzarq = zzpVar;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(com.google.android.gms.ads.internal.client.zzq zzqVar) {
        zzaa.zzhs("setAdListener must be called on the main UI thread.");
        this.zzaly.zzarr = zzqVar;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(zzw zzwVar) {
        zzaa.zzhs("setAppEventListener must be called on the main UI thread.");
        this.zzaly.zzars = zzwVar;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(zzy zzyVar) {
        zzaa.zzhs("setCorrelationIdProvider must be called on the main UI thread");
        this.zzaly.zzart = zzyVar;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(com.google.android.gms.ads.internal.reward.client.zzd zzdVar) {
        zzaa.zzhs("setRewardedVideoAdListener can only be called from the UI thread.");
        this.zzaly.zzasd = zzdVar;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zza(@Nullable RewardItemParcel rewardItemParcel) {
        if (this.zzaly.zzasd == null) {
            return;
        }
        String str = "";
        int i = 0;
        if (rewardItemParcel != null) {
            try {
                str = rewardItemParcel.type;
                i = rewardItemParcel.zzcsc;
            } catch (RemoteException e) {
                zzkx.zzc("Could not call RewardedVideoAdListener.onRewarded().", e);
                return;
            }
        }
        this.zzaly.zzasd.zza(new zzjz(str, i));
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(zzed zzedVar) {
        throw new IllegalStateException("setOnCustomRenderedAdLoadedListener is not supported for current ad type");
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(zzig zzigVar) {
        throw new IllegalStateException("setInAppPurchaseListener is not supported for current ad type");
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(zzik zzikVar, String str) {
        throw new IllegalStateException("setPlayStorePurchaseParams is not supported for current ad type");
    }

    @Override // com.google.android.gms.ads.internal.request.zza.InterfaceC0022zza
    public void zza(zzko.zza zzaVar) {
        if (zzaVar.zzcsu.zzclf != -1 && !TextUtils.isEmpty(zzaVar.zzcsu.zzclo)) {
            long zzx = zzx(zzaVar.zzcsu.zzclo);
            if (zzx != -1) {
                this.zzalt.zza(this.zzalt.zzc(zzx + zzaVar.zzcsu.zzclf), "stc");
            }
        }
        this.zzalt.zzaz(zzaVar.zzcsu.zzclo);
        this.zzalt.zza(this.zzalu, "arf");
        this.zzalv = this.zzalt.zzlz();
        this.zzalt.zzg("gqi", zzaVar.zzcsu.zzclp);
        this.zzaly.zzark = null;
        this.zzaly.zzaro = zzaVar;
        zza(zzaVar, this.zzalt);
    }

    protected abstract void zza(zzko.zza zzaVar, zzdz zzdzVar);

    @Override // com.google.android.gms.internal.zzkt
    public void zza(HashSet<zzkp> hashSet) {
        this.zzaly.zza(hashSet);
    }

    protected abstract boolean zza(AdRequestParcel adRequestParcel, zzdz zzdzVar);

    boolean zza(zzko zzkoVar) {
        return false;
    }

    protected abstract boolean zza(@Nullable zzko zzkoVar, zzko zzkoVar2);

    /* JADX INFO: Access modifiers changed from: protected */
    public void zzb(View view) {
        zzv.zza zzaVar = this.zzaly.zzarj;
        if (zzaVar != null) {
            zzaVar.addView(view, zzu.zzgo().zzvz());
        }
    }

    @Override // com.google.android.gms.internal.zziu.zza
    public void zzb(zzko zzkoVar) {
        this.zzalt.zza(this.zzalv, "awr");
        this.zzaly.zzarl = null;
        if (zzkoVar.errorCode != -2 && zzkoVar.errorCode != 3) {
            zzu.zzgq().zzb(this.zzaly.zzhl());
        }
        if (zzkoVar.errorCode == -1) {
            this.zzalw = false;
            return;
        }
        if (zza(zzkoVar)) {
            zzkx.zzdg("Ad refresh scheduled.");
        }
        if (zzkoVar.errorCode != -2) {
            zzh(zzkoVar.errorCode);
            return;
        }
        if (this.zzaly.zzasg == null) {
            this.zzaly.zzasg = new zzku(this.zzaly.zzarg);
        }
        this.zzama.zzj(this.zzaly.zzarn);
        if (zza(this.zzaly.zzarn, zzkoVar)) {
            this.zzaly.zzarn = zzkoVar;
            this.zzaly.zzhu();
            this.zzalt.zzg("is_mraid", this.zzaly.zzarn.zzic() ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
            this.zzalt.zzg("is_mediation", this.zzaly.zzarn.zzclb ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
            if (this.zzaly.zzarn.zzcbm != null && this.zzaly.zzarn.zzcbm.zzxc() != null) {
                this.zzalt.zzg("is_delay_pl", this.zzaly.zzarn.zzcbm.zzxc().zzxy() ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
            }
            this.zzalt.zza(this.zzalu, "ttc");
            if (zzu.zzgq().zzuu() != null) {
                zzu.zzgq().zzuu().zza(this.zzalt);
            }
            if (this.zzaly.zzhp()) {
                zzen();
            }
        }
        if (zzkoVar.zzbvn == null) {
            return;
        }
        zzu.zzgm().zza(this.zzaly.zzahs, zzkoVar.zzbvn);
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public boolean zzb(AdRequestParcel adRequestParcel) {
        zzaa.zzhs("loadAd must be called on the main UI thread.");
        zzu.zzgr().zzjt();
        if (zzdr.zzbge.get().booleanValue()) {
            AdRequestParcel.zzj(adRequestParcel);
        }
        AdRequestParcel zza = zza(adRequestParcel);
        if (this.zzaly.zzark != null || this.zzaly.zzarl != null) {
            if (this.zzalz != null) {
                zzkx.zzdi("Aborting last ad request since another ad request is already in progress. The current request object will still be cached for future refreshes.");
            } else {
                zzkx.zzdi("Loading already in progress, saving this object for future refreshes.");
            }
            this.zzalz = zza;
            return false;
        }
        zzkx.zzdh("Starting ad request.");
        zzee();
        this.zzalu = this.zzalt.zzlz();
        if (!zza.zzayo) {
            String valueOf = String.valueOf(com.google.android.gms.ads.internal.client.zzm.zzkr().zzao(this.zzaly.zzahs));
            zzkx.zzdh(new StringBuilder(String.valueOf(valueOf).length() + 71).append("Use AdRequest.Builder.addTestDevice(\"").append(valueOf).append("\") to get test ads on this device.").toString());
        }
        this.zzalx.zzg(zza);
        this.zzalw = zza(zza, this.zzalt);
        return this.zzalw;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zzc(@Nullable zzko zzkoVar) {
        if (zzkoVar == null) {
            zzkx.zzdi("Ad state was null when trying to ping impression URLs.");
            return;
        }
        zzkx.zzdg("Pinging Impression URLs.");
        if (this.zzaly.zzarp != null) {
            this.zzaly.zzarp.zzug();
        }
        if (zzkoVar.zzbvl == null || zzkoVar.zzcsr) {
            return;
        }
        zzu.zzgm().zza(this.zzaly.zzahs, this.zzaly.zzari.zzda, zzkoVar.zzbvl);
        zzkoVar.zzcsr = true;
        zzd(zzkoVar);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean zzc(AdRequestParcel adRequestParcel) {
        if (this.zzaly.zzarj == null) {
            return false;
        }
        ViewParent parent = this.zzaly.zzarj.getParent();
        if (!(parent instanceof View)) {
            return false;
        }
        View view = (View) parent;
        return zzu.zzgm().zza(view, view.getContext());
    }

    public void zzd(AdRequestParcel adRequestParcel) {
        if (zzc(adRequestParcel)) {
            zzb(adRequestParcel);
            return;
        }
        zzkx.zzdh("Ad is not visible. Not refreshing ad.");
        this.zzalx.zzh(adRequestParcel);
    }

    public zzd zzec() {
        return this.zzamb;
    }

    public void zzee() {
        this.zzalt = new zzdz(zzdr.zzbeq.get().booleanValue(), "load_ad", this.zzaly.zzarm.zzazq);
        this.zzalu = new zzdx(-1L, null, null);
        this.zzalv = new zzdx(-1L, null, null);
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public com.google.android.gms.dynamic.zzd zzef() {
        zzaa.zzhs("getAdFrame must be called on the main UI thread.");
        return com.google.android.gms.dynamic.zze.zzac(this.zzaly.zzarj);
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    @Nullable
    public AdSizeParcel zzeg() {
        zzaa.zzhs("getAdSize must be called on the main UI thread.");
        if (this.zzaly.zzarm == null) {
            return null;
        }
        return new ThinAdSizeParcel(this.zzaly.zzarm);
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzp
    public void zzeh() {
        zzel();
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zzei() {
        zzaa.zzhs("recordManualImpression must be called on the main UI thread.");
        if (this.zzaly.zzarn == null) {
            zzkx.zzdi("Ad state was null when trying to ping manual tracking URLs.");
            return;
        }
        zzkx.zzdg("Pinging manual tracking URLs.");
        if (this.zzaly.zzarn.zzcld == null || this.zzaly.zzarn.zzcss) {
            return;
        }
        zzu.zzgm().zza(this.zzaly.zzahs, this.zzaly.zzari.zzda, this.zzaly.zzarn.zzcld);
        this.zzaly.zzarn.zzcss = true;
        zzd(this.zzaly.zzarn);
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public zzab zzej() {
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zzek() {
        zzkx.zzdh("Ad closing.");
        if (this.zzaly.zzarr != null) {
            try {
                this.zzaly.zzarr.onAdClosed();
            } catch (RemoteException e) {
                zzkx.zzc("Could not call AdListener.onAdClosed().", e);
            }
        }
        if (this.zzaly.zzasd != null) {
            try {
                this.zzaly.zzasd.onRewardedVideoAdClosed();
            } catch (RemoteException e2) {
                zzkx.zzc("Could not call RewardedVideoAdListener.onRewardedVideoAdClosed().", e2);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zzel() {
        zzkx.zzdh("Ad leaving application.");
        if (this.zzaly.zzarr != null) {
            try {
                this.zzaly.zzarr.onAdLeftApplication();
            } catch (RemoteException e) {
                zzkx.zzc("Could not call AdListener.onAdLeftApplication().", e);
            }
        }
        if (this.zzaly.zzasd != null) {
            try {
                this.zzaly.zzasd.onRewardedVideoAdLeftApplication();
            } catch (RemoteException e2) {
                zzkx.zzc("Could not call  RewardedVideoAdListener.onRewardedVideoAdLeftApplication().", e2);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zzem() {
        zzkx.zzdh("Ad opening.");
        if (this.zzaly.zzarr != null) {
            try {
                this.zzaly.zzarr.onAdOpened();
            } catch (RemoteException e) {
                zzkx.zzc("Could not call AdListener.onAdOpened().", e);
            }
        }
        if (this.zzaly.zzasd != null) {
            try {
                this.zzaly.zzasd.onRewardedVideoAdOpened();
            } catch (RemoteException e2) {
                zzkx.zzc("Could not call RewardedVideoAdListener.onRewardedVideoAdOpened().", e2);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zzen() {
        zzkx.zzdh("Ad finished loading.");
        this.zzalw = false;
        if (this.zzaly.zzarr != null) {
            try {
                this.zzaly.zzarr.onAdLoaded();
            } catch (RemoteException e) {
                zzkx.zzc("Could not call AdListener.onAdLoaded().", e);
            }
        }
        if (this.zzaly.zzasd != null) {
            try {
                this.zzaly.zzasd.onRewardedVideoAdLoaded();
            } catch (RemoteException e2) {
                zzkx.zzc("Could not call RewardedVideoAdListener.onRewardedVideoAdLoaded().", e2);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zzeo() {
        if (this.zzaly.zzasd == null) {
            return;
        }
        try {
            this.zzaly.zzasd.onRewardedVideoStarted();
        } catch (RemoteException e) {
            zzkx.zzc("Could not call RewardedVideoAdListener.onVideoStarted().", e);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zzh(int i) {
        zzkx.zzdi(new StringBuilder(30).append("Failed to load ad: ").append(i).toString());
        this.zzalw = false;
        if (this.zzaly.zzarr != null) {
            try {
                this.zzaly.zzarr.onAdFailedToLoad(i);
            } catch (RemoteException e) {
                zzkx.zzc("Could not call AdListener.onAdFailedToLoad().", e);
            }
        }
        if (this.zzaly.zzasd != null) {
            try {
                this.zzaly.zzasd.onRewardedVideoAdFailedToLoad(i);
            } catch (RemoteException e2) {
                zzkx.zzc("Could not call RewardedVideoAdListener.onRewardedVideoAdFailedToLoad().", e2);
            }
        }
    }

    long zzx(String str) {
        int indexOf = str.indexOf("ufe");
        int indexOf2 = str.indexOf(44, indexOf);
        if (indexOf2 == -1) {
            indexOf2 = str.length();
        }
        try {
            return Long.parseLong(str.substring(indexOf + 4, indexOf2));
        } catch (IndexOutOfBoundsException e) {
            zzkx.zzdi("Invalid index for Url fetch time in CSI latency info.");
            return -1L;
        } catch (NumberFormatException e2) {
            zzkx.zzdi("Cannot find valid format of Url fetch time in CSI latency info.");
            return -1L;
        }
    }
}
