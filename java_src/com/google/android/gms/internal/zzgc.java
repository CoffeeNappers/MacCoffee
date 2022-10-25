package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.RemoteException;
import android.support.annotation.Nullable;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.VideoOptionsParcel;
import com.google.android.gms.ads.internal.client.zzu;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.internal.zzgb;
@zzji
/* loaded from: classes.dex */
public class zzgc extends zzu.zza {
    private final String zzant;
    private final zzfw zzbsn;
    @Nullable
    private com.google.android.gms.ads.internal.zzl zzbss;
    private final zzfy zzbsz;
    @Nullable
    private zzik zzbta;
    private String zzbtb;

    public zzgc(Context context, String str, zzgz zzgzVar, VersionInfoParcel versionInfoParcel, com.google.android.gms.ads.internal.zzd zzdVar) {
        this(str, new zzfw(context, zzgzVar, versionInfoParcel, zzdVar));
    }

    zzgc(String str, zzfw zzfwVar) {
        this.zzant = str;
        this.zzbsn = zzfwVar;
        this.zzbsz = new zzfy();
        com.google.android.gms.ads.internal.zzu.zzhb().zza(zzfwVar);
    }

    private void zznu() {
        if (this.zzbss == null || this.zzbta == null) {
            return;
        }
        this.zzbss.zza(this.zzbta, this.zzbtb);
    }

    static boolean zzq(AdRequestParcel adRequestParcel) {
        Bundle zzk = zzfz.zzk(adRequestParcel);
        return zzk != null && zzk.containsKey("gw");
    }

    static boolean zzr(AdRequestParcel adRequestParcel) {
        Bundle zzk = zzfz.zzk(adRequestParcel);
        return zzk != null && zzk.containsKey("_ad");
    }

    void abort() {
        if (this.zzbss != null) {
            return;
        }
        this.zzbss = this.zzbsn.zzbj(this.zzant);
        this.zzbsz.zzc(this.zzbss);
        zznu();
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void destroy() throws RemoteException {
        if (this.zzbss != null) {
            this.zzbss.destroy();
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    @Nullable
    public String getMediationAdapterClassName() throws RemoteException {
        if (this.zzbss != null) {
            return this.zzbss.getMediationAdapterClassName();
        }
        return null;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public boolean isLoading() throws RemoteException {
        return this.zzbss != null && this.zzbss.isLoading();
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public boolean isReady() throws RemoteException {
        return this.zzbss != null && this.zzbss.isReady();
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void pause() throws RemoteException {
        if (this.zzbss != null) {
            this.zzbss.pause();
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void resume() throws RemoteException {
        if (this.zzbss != null) {
            this.zzbss.resume();
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void setManualImpressionsEnabled(boolean z) throws RemoteException {
        abort();
        if (this.zzbss != null) {
            this.zzbss.setManualImpressionsEnabled(z);
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void setUserId(String str) {
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void showInterstitial() throws RemoteException {
        if (this.zzbss != null) {
            this.zzbss.showInterstitial();
        } else {
            zzkx.zzdi("Interstitial ad must be loaded before showInterstitial().");
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void stopLoading() throws RemoteException {
        if (this.zzbss != null) {
            this.zzbss.stopLoading();
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(AdSizeParcel adSizeParcel) throws RemoteException {
        if (this.zzbss != null) {
            this.zzbss.zza(adSizeParcel);
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(VideoOptionsParcel videoOptionsParcel) {
        throw new IllegalStateException("getVideoController not implemented for interstitials");
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(com.google.android.gms.ads.internal.client.zzp zzpVar) throws RemoteException {
        this.zzbsz.zzbsi = zzpVar;
        if (this.zzbss != null) {
            this.zzbsz.zzc(this.zzbss);
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(com.google.android.gms.ads.internal.client.zzq zzqVar) throws RemoteException {
        this.zzbsz.zzanl = zzqVar;
        if (this.zzbss != null) {
            this.zzbsz.zzc(this.zzbss);
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(com.google.android.gms.ads.internal.client.zzw zzwVar) throws RemoteException {
        this.zzbsz.zzbsf = zzwVar;
        if (this.zzbss != null) {
            this.zzbsz.zzc(this.zzbss);
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(com.google.android.gms.ads.internal.client.zzy zzyVar) throws RemoteException {
        abort();
        if (this.zzbss != null) {
            this.zzbss.zza(zzyVar);
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(com.google.android.gms.ads.internal.reward.client.zzd zzdVar) {
        this.zzbsz.zzbsj = zzdVar;
        if (this.zzbss != null) {
            this.zzbsz.zzc(this.zzbss);
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(zzed zzedVar) throws RemoteException {
        this.zzbsz.zzbsh = zzedVar;
        if (this.zzbss != null) {
            this.zzbsz.zzc(this.zzbss);
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(zzig zzigVar) throws RemoteException {
        this.zzbsz.zzbsg = zzigVar;
        if (this.zzbss != null) {
            this.zzbsz.zzc(this.zzbss);
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(zzik zzikVar, String str) throws RemoteException {
        this.zzbta = zzikVar;
        this.zzbtb = str;
        zznu();
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public boolean zzb(AdRequestParcel adRequestParcel) throws RemoteException {
        if (zzdr.zzbge.get().booleanValue()) {
            AdRequestParcel.zzj(adRequestParcel);
        }
        if (!zzq(adRequestParcel)) {
            abort();
        }
        if (zzfz.zzm(adRequestParcel)) {
            abort();
        }
        if (adRequestParcel.zzays != null) {
            abort();
        }
        if (this.zzbss != null) {
            return this.zzbss.zzb(adRequestParcel);
        }
        zzfz zzhb = com.google.android.gms.ads.internal.zzu.zzhb();
        if (zzr(adRequestParcel)) {
            zzhb.zzb(adRequestParcel, this.zzant);
        }
        zzgb.zza zza = zzhb.zza(adRequestParcel, this.zzant);
        if (zza == null) {
            abort();
            return this.zzbss.zzb(adRequestParcel);
        }
        if (!zza.zzbsw) {
            zza.zznt();
        }
        this.zzbss = zza.zzbss;
        zza.zzbsu.zza(this.zzbsz);
        this.zzbsz.zzc(this.zzbss);
        zznu();
        return zza.zzbsx;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    @Nullable
    public com.google.android.gms.dynamic.zzd zzef() throws RemoteException {
        if (this.zzbss != null) {
            return this.zzbss.zzef();
        }
        return null;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    @Nullable
    public AdSizeParcel zzeg() throws RemoteException {
        if (this.zzbss != null) {
            return this.zzbss.zzeg();
        }
        return null;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zzei() throws RemoteException {
        if (this.zzbss != null) {
            this.zzbss.zzei();
        } else {
            zzkx.zzdi("Interstitial ad must be loaded before pingManualTrackingUrl().");
        }
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public com.google.android.gms.ads.internal.client.zzab zzej() {
        throw new IllegalStateException("getVideoController not implemented for interstitials");
    }
}
