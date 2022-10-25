package com.google.android.gms.ads.internal.client;

import android.os.RemoteException;
import com.google.android.gms.ads.internal.client.zzu;
import com.google.android.gms.internal.zzed;
import com.google.android.gms.internal.zzig;
import com.google.android.gms.internal.zzik;
/* loaded from: classes.dex */
public class zzak extends zzu.zza {
    private zzq zzanl;

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void destroy() {
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public String getMediationAdapterClassName() {
        return null;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public boolean isLoading() {
        return false;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public boolean isReady() {
        return false;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void pause() {
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void resume() {
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void setManualImpressionsEnabled(boolean z) {
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void setUserId(String str) {
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void showInterstitial() {
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void stopLoading() {
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(AdSizeParcel adSizeParcel) {
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(VideoOptionsParcel videoOptionsParcel) {
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(zzp zzpVar) {
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(zzq zzqVar) {
        this.zzanl = zzqVar;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(zzw zzwVar) {
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(zzy zzyVar) {
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(com.google.android.gms.ads.internal.reward.client.zzd zzdVar) {
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(zzed zzedVar) {
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(zzig zzigVar) {
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zza(zzik zzikVar, String str) {
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public boolean zzb(AdRequestParcel adRequestParcel) {
        com.google.android.gms.ads.internal.util.client.zzb.e("This app is using a lightweight version of the Google Mobile Ads SDK that requires the latest Google Play services to be installed, but Google Play services is either missing or out of date.");
        com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.ads.internal.client.zzak.1
            @Override // java.lang.Runnable
            public void run() {
                if (zzak.this.zzanl != null) {
                    try {
                        zzak.this.zzanl.onAdFailedToLoad(1);
                    } catch (RemoteException e) {
                        com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not notify onAdFailedToLoad event.", e);
                    }
                }
            }
        });
        return false;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public com.google.android.gms.dynamic.zzd zzef() {
        return null;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public AdSizeParcel zzeg() {
        return null;
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void zzei() {
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public zzab zzej() {
        return null;
    }
}
