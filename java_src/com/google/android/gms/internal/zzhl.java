package com.google.android.gms.internal;

import android.app.Activity;
import android.os.Bundle;
import android.os.RemoteException;
import com.google.ads.mediation.MediationAdapter;
import com.google.ads.mediation.MediationBannerAdapter;
import com.google.ads.mediation.MediationInterstitialAdapter;
import com.google.ads.mediation.MediationServerParameters;
import com.google.ads.mediation.NetworkExtras;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.internal.zzha;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public final class zzhl<NETWORK_EXTRAS extends NetworkExtras, SERVER_PARAMETERS extends MediationServerParameters> extends zzha.zza {
    private final MediationAdapter<NETWORK_EXTRAS, SERVER_PARAMETERS> zzbxn;
    private final NETWORK_EXTRAS zzbxo;

    public zzhl(MediationAdapter<NETWORK_EXTRAS, SERVER_PARAMETERS> mediationAdapter, NETWORK_EXTRAS network_extras) {
        this.zzbxn = mediationAdapter;
        this.zzbxo = network_extras;
    }

    private SERVER_PARAMETERS zzb(String str, int i, String str2) throws RemoteException {
        HashMap hashMap;
        try {
            if (str != null) {
                JSONObject jSONObject = new JSONObject(str);
                hashMap = new HashMap(jSONObject.length());
                Iterator<String> keys = jSONObject.keys();
                while (keys.hasNext()) {
                    String next = keys.next();
                    hashMap.put(next, jSONObject.getString(next));
                }
            } else {
                hashMap = new HashMap(0);
            }
            Class<SERVER_PARAMETERS> serverParametersType = this.zzbxn.getServerParametersType();
            if (serverParametersType == null) {
                return null;
            }
            SERVER_PARAMETERS newInstance = serverParametersType.newInstance();
            newInstance.load(hashMap);
            return newInstance;
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not get MediationServerParameters.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.zzha
    public void destroy() throws RemoteException {
        try {
            this.zzbxn.destroy();
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not destroy adapter.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.zzha
    public Bundle getInterstitialAdapterInfo() {
        return new Bundle();
    }

    @Override // com.google.android.gms.internal.zzha
    public com.google.android.gms.dynamic.zzd getView() throws RemoteException {
        if (!(this.zzbxn instanceof MediationBannerAdapter)) {
            String valueOf = String.valueOf(this.zzbxn.getClass().getCanonicalName());
            com.google.android.gms.ads.internal.util.client.zzb.zzdi(valueOf.length() != 0 ? "MediationAdapter is not a MediationBannerAdapter: ".concat(valueOf) : new String("MediationAdapter is not a MediationBannerAdapter: "));
            throw new RemoteException();
        }
        try {
            return com.google.android.gms.dynamic.zze.zzac(((MediationBannerAdapter) this.zzbxn).getBannerView());
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not get banner view from adapter.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.zzha
    public boolean isInitialized() {
        return true;
    }

    @Override // com.google.android.gms.internal.zzha
    public void pause() throws RemoteException {
        throw new RemoteException();
    }

    @Override // com.google.android.gms.internal.zzha
    public void resume() throws RemoteException {
        throw new RemoteException();
    }

    @Override // com.google.android.gms.internal.zzha
    public void showInterstitial() throws RemoteException {
        if (!(this.zzbxn instanceof MediationInterstitialAdapter)) {
            String valueOf = String.valueOf(this.zzbxn.getClass().getCanonicalName());
            com.google.android.gms.ads.internal.util.client.zzb.zzdi(valueOf.length() != 0 ? "MediationAdapter is not a MediationInterstitialAdapter: ".concat(valueOf) : new String("MediationAdapter is not a MediationInterstitialAdapter: "));
            throw new RemoteException();
        }
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Showing interstitial from adapter.");
        try {
            ((MediationInterstitialAdapter) this.zzbxn).showInterstitial();
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not show interstitial from adapter.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.zzha
    public void showVideo() {
    }

    @Override // com.google.android.gms.internal.zzha
    public void zza(AdRequestParcel adRequestParcel, String str, String str2) {
    }

    @Override // com.google.android.gms.internal.zzha
    public void zza(com.google.android.gms.dynamic.zzd zzdVar, AdRequestParcel adRequestParcel, String str, com.google.android.gms.ads.internal.reward.mediation.client.zza zzaVar, String str2) throws RemoteException {
    }

    @Override // com.google.android.gms.internal.zzha
    public void zza(com.google.android.gms.dynamic.zzd zzdVar, AdRequestParcel adRequestParcel, String str, zzhb zzhbVar) throws RemoteException {
        zza(zzdVar, adRequestParcel, str, (String) null, zzhbVar);
    }

    @Override // com.google.android.gms.internal.zzha
    public void zza(com.google.android.gms.dynamic.zzd zzdVar, AdRequestParcel adRequestParcel, String str, String str2, zzhb zzhbVar) throws RemoteException {
        if (!(this.zzbxn instanceof MediationInterstitialAdapter)) {
            String valueOf = String.valueOf(this.zzbxn.getClass().getCanonicalName());
            com.google.android.gms.ads.internal.util.client.zzb.zzdi(valueOf.length() != 0 ? "MediationAdapter is not a MediationInterstitialAdapter: ".concat(valueOf) : new String("MediationAdapter is not a MediationInterstitialAdapter: "));
            throw new RemoteException();
        }
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Requesting interstitial ad from adapter.");
        try {
            ((MediationInterstitialAdapter) this.zzbxn).requestInterstitialAd(new zzhm(zzhbVar), (Activity) com.google.android.gms.dynamic.zze.zzae(zzdVar), zzb(str, adRequestParcel.zzayp, str2), zzhn.zzs(adRequestParcel), this.zzbxo);
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not request interstitial ad from adapter.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.zzha
    public void zza(com.google.android.gms.dynamic.zzd zzdVar, AdRequestParcel adRequestParcel, String str, String str2, zzhb zzhbVar, NativeAdOptionsParcel nativeAdOptionsParcel, List<String> list) {
    }

    @Override // com.google.android.gms.internal.zzha
    public void zza(com.google.android.gms.dynamic.zzd zzdVar, AdSizeParcel adSizeParcel, AdRequestParcel adRequestParcel, String str, zzhb zzhbVar) throws RemoteException {
        zza(zzdVar, adSizeParcel, adRequestParcel, str, null, zzhbVar);
    }

    @Override // com.google.android.gms.internal.zzha
    public void zza(com.google.android.gms.dynamic.zzd zzdVar, AdSizeParcel adSizeParcel, AdRequestParcel adRequestParcel, String str, String str2, zzhb zzhbVar) throws RemoteException {
        if (!(this.zzbxn instanceof MediationBannerAdapter)) {
            String valueOf = String.valueOf(this.zzbxn.getClass().getCanonicalName());
            com.google.android.gms.ads.internal.util.client.zzb.zzdi(valueOf.length() != 0 ? "MediationAdapter is not a MediationBannerAdapter: ".concat(valueOf) : new String("MediationAdapter is not a MediationBannerAdapter: "));
            throw new RemoteException();
        }
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Requesting banner ad from adapter.");
        try {
            ((MediationBannerAdapter) this.zzbxn).requestBannerAd(new zzhm(zzhbVar), (Activity) com.google.android.gms.dynamic.zze.zzae(zzdVar), zzb(str, adRequestParcel.zzayp, str2), zzhn.zzc(adSizeParcel), zzhn.zzs(adRequestParcel), this.zzbxo);
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not request banner ad from adapter.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.zzha
    public void zzc(AdRequestParcel adRequestParcel, String str) {
    }

    @Override // com.google.android.gms.internal.zzha
    public void zzj(com.google.android.gms.dynamic.zzd zzdVar) throws RemoteException {
    }

    @Override // com.google.android.gms.internal.zzha
    public zzhd zzom() {
        return null;
    }

    @Override // com.google.android.gms.internal.zzha
    public zzhe zzon() {
        return null;
    }

    @Override // com.google.android.gms.internal.zzha
    public Bundle zzoo() {
        return new Bundle();
    }

    @Override // com.google.android.gms.internal.zzha
    public Bundle zzop() {
        return new Bundle();
    }
}
