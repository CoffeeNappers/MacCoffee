package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.RemoteException;
import com.google.ads.mediation.admob.AdMobAdapter;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.mediation.MediationAdapter;
import com.google.android.gms.ads.mediation.MediationBannerAdapter;
import com.google.android.gms.ads.mediation.MediationInterstitialAdapter;
import com.google.android.gms.ads.mediation.MediationNativeAdapter;
import com.google.android.gms.ads.mediation.NativeAdMapper;
import com.google.android.gms.ads.mediation.NativeAppInstallAdMapper;
import com.google.android.gms.ads.mediation.NativeContentAdMapper;
import com.google.android.gms.ads.mediation.OnContextChangedListener;
import com.google.android.gms.ads.reward.mediation.MediationRewardedVideoAdAdapter;
import com.google.android.gms.internal.zzha;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public final class zzhg extends zzha.zza {
    private final MediationAdapter zzbxh;
    private zzhh zzbxi;

    public zzhg(MediationAdapter mediationAdapter) {
        this.zzbxh = mediationAdapter;
    }

    private Bundle zza(String str, int i, String str2) throws RemoteException {
        String valueOf = String.valueOf(str);
        com.google.android.gms.ads.internal.util.client.zzb.zzdi(valueOf.length() != 0 ? "Server parameters: ".concat(valueOf) : new String("Server parameters: "));
        try {
            Bundle bundle = new Bundle();
            if (str != null) {
                JSONObject jSONObject = new JSONObject(str);
                Bundle bundle2 = new Bundle();
                Iterator<String> keys = jSONObject.keys();
                while (keys.hasNext()) {
                    String next = keys.next();
                    bundle2.putString(next, jSONObject.getString(next));
                }
                bundle = bundle2;
            }
            if (this.zzbxh instanceof AdMobAdapter) {
                bundle.putString("adJson", str2);
                bundle.putInt("tagForChildDirectedTreatment", i);
            }
            return bundle;
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not get Server Parameters Bundle.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.zzha
    public void destroy() throws RemoteException {
        try {
            this.zzbxh.onDestroy();
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not destroy adapter.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.zzha
    public Bundle getInterstitialAdapterInfo() {
        if (!(this.zzbxh instanceof zzmr)) {
            String valueOf = String.valueOf(this.zzbxh.getClass().getCanonicalName());
            com.google.android.gms.ads.internal.util.client.zzb.zzdi(valueOf.length() != 0 ? "MediationAdapter is not a v2 MediationInterstitialAdapter: ".concat(valueOf) : new String("MediationAdapter is not a v2 MediationInterstitialAdapter: "));
            return new Bundle();
        }
        return ((zzmr) this.zzbxh).getInterstitialAdapterInfo();
    }

    @Override // com.google.android.gms.internal.zzha
    public com.google.android.gms.dynamic.zzd getView() throws RemoteException {
        if (!(this.zzbxh instanceof MediationBannerAdapter)) {
            String valueOf = String.valueOf(this.zzbxh.getClass().getCanonicalName());
            com.google.android.gms.ads.internal.util.client.zzb.zzdi(valueOf.length() != 0 ? "MediationAdapter is not a MediationBannerAdapter: ".concat(valueOf) : new String("MediationAdapter is not a MediationBannerAdapter: "));
            throw new RemoteException();
        }
        try {
            return com.google.android.gms.dynamic.zze.zzac(((MediationBannerAdapter) this.zzbxh).getBannerView());
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not get banner view from adapter.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.zzha
    public boolean isInitialized() throws RemoteException {
        if (!(this.zzbxh instanceof MediationRewardedVideoAdAdapter)) {
            String valueOf = String.valueOf(this.zzbxh.getClass().getCanonicalName());
            com.google.android.gms.ads.internal.util.client.zzb.zzdi(valueOf.length() != 0 ? "MediationAdapter is not a MediationRewardedVideoAdAdapter: ".concat(valueOf) : new String("MediationAdapter is not a MediationRewardedVideoAdAdapter: "));
            throw new RemoteException();
        }
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Check if adapter is initialized.");
        try {
            return ((MediationRewardedVideoAdAdapter) this.zzbxh).isInitialized();
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not check if adapter is initialized.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.zzha
    public void pause() throws RemoteException {
        try {
            this.zzbxh.onPause();
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not pause adapter.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.zzha
    public void resume() throws RemoteException {
        try {
            this.zzbxh.onResume();
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not resume adapter.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.zzha
    public void showInterstitial() throws RemoteException {
        if (!(this.zzbxh instanceof MediationInterstitialAdapter)) {
            String valueOf = String.valueOf(this.zzbxh.getClass().getCanonicalName());
            com.google.android.gms.ads.internal.util.client.zzb.zzdi(valueOf.length() != 0 ? "MediationAdapter is not a MediationInterstitialAdapter: ".concat(valueOf) : new String("MediationAdapter is not a MediationInterstitialAdapter: "));
            throw new RemoteException();
        }
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Showing interstitial from adapter.");
        try {
            ((MediationInterstitialAdapter) this.zzbxh).showInterstitial();
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not show interstitial from adapter.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.zzha
    public void showVideo() throws RemoteException {
        if (!(this.zzbxh instanceof MediationRewardedVideoAdAdapter)) {
            String valueOf = String.valueOf(this.zzbxh.getClass().getCanonicalName());
            com.google.android.gms.ads.internal.util.client.zzb.zzdi(valueOf.length() != 0 ? "MediationAdapter is not a MediationRewardedVideoAdAdapter: ".concat(valueOf) : new String("MediationAdapter is not a MediationRewardedVideoAdAdapter: "));
            throw new RemoteException();
        }
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Show rewarded video ad from adapter.");
        try {
            ((MediationRewardedVideoAdAdapter) this.zzbxh).showVideo();
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not show rewarded video ad from adapter.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.zzha
    public void zza(AdRequestParcel adRequestParcel, String str, String str2) throws RemoteException {
        if (!(this.zzbxh instanceof MediationRewardedVideoAdAdapter)) {
            String valueOf = String.valueOf(this.zzbxh.getClass().getCanonicalName());
            com.google.android.gms.ads.internal.util.client.zzb.zzdi(valueOf.length() != 0 ? "MediationAdapter is not a MediationRewardedVideoAdAdapter: ".concat(valueOf) : new String("MediationAdapter is not a MediationRewardedVideoAdAdapter: "));
            throw new RemoteException();
        }
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Requesting rewarded video ad from adapter.");
        try {
            MediationRewardedVideoAdAdapter mediationRewardedVideoAdAdapter = (MediationRewardedVideoAdAdapter) this.zzbxh;
            mediationRewardedVideoAdAdapter.loadAd(new zzhf(adRequestParcel.zzayl == -1 ? null : new Date(adRequestParcel.zzayl), adRequestParcel.zzaym, adRequestParcel.zzayn != null ? new HashSet(adRequestParcel.zzayn) : null, adRequestParcel.zzayt, adRequestParcel.zzayo, adRequestParcel.zzayp, adRequestParcel.zzaza), zza(str, adRequestParcel.zzayp, str2), adRequestParcel.zzayv != null ? adRequestParcel.zzayv.getBundle(mediationRewardedVideoAdAdapter.getClass().getName()) : null);
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not load rewarded video ad from adapter.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.zzha
    public void zza(com.google.android.gms.dynamic.zzd zzdVar, AdRequestParcel adRequestParcel, String str, com.google.android.gms.ads.internal.reward.mediation.client.zza zzaVar, String str2) throws RemoteException {
        if (!(this.zzbxh instanceof MediationRewardedVideoAdAdapter)) {
            String valueOf = String.valueOf(this.zzbxh.getClass().getCanonicalName());
            com.google.android.gms.ads.internal.util.client.zzb.zzdi(valueOf.length() != 0 ? "MediationAdapter is not a MediationRewardedVideoAdAdapter: ".concat(valueOf) : new String("MediationAdapter is not a MediationRewardedVideoAdAdapter: "));
            throw new RemoteException();
        }
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Initialize rewarded video adapter.");
        try {
            MediationRewardedVideoAdAdapter mediationRewardedVideoAdAdapter = (MediationRewardedVideoAdAdapter) this.zzbxh;
            mediationRewardedVideoAdAdapter.initialize((Context) com.google.android.gms.dynamic.zze.zzae(zzdVar), new zzhf(adRequestParcel.zzayl == -1 ? null : new Date(adRequestParcel.zzayl), adRequestParcel.zzaym, adRequestParcel.zzayn != null ? new HashSet(adRequestParcel.zzayn) : null, adRequestParcel.zzayt, adRequestParcel.zzayo, adRequestParcel.zzayp, adRequestParcel.zzaza), str, new com.google.android.gms.ads.internal.reward.mediation.client.zzb(zzaVar), zza(str2, adRequestParcel.zzayp, (String) null), adRequestParcel.zzayv != null ? adRequestParcel.zzayv.getBundle(mediationRewardedVideoAdAdapter.getClass().getName()) : null);
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not initialize rewarded video adapter.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.zzha
    public void zza(com.google.android.gms.dynamic.zzd zzdVar, AdRequestParcel adRequestParcel, String str, zzhb zzhbVar) throws RemoteException {
        zza(zzdVar, adRequestParcel, str, (String) null, zzhbVar);
    }

    @Override // com.google.android.gms.internal.zzha
    public void zza(com.google.android.gms.dynamic.zzd zzdVar, AdRequestParcel adRequestParcel, String str, String str2, zzhb zzhbVar) throws RemoteException {
        if (!(this.zzbxh instanceof MediationInterstitialAdapter)) {
            String valueOf = String.valueOf(this.zzbxh.getClass().getCanonicalName());
            com.google.android.gms.ads.internal.util.client.zzb.zzdi(valueOf.length() != 0 ? "MediationAdapter is not a MediationInterstitialAdapter: ".concat(valueOf) : new String("MediationAdapter is not a MediationInterstitialAdapter: "));
            throw new RemoteException();
        }
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Requesting interstitial ad from adapter.");
        try {
            MediationInterstitialAdapter mediationInterstitialAdapter = (MediationInterstitialAdapter) this.zzbxh;
            mediationInterstitialAdapter.requestInterstitialAd((Context) com.google.android.gms.dynamic.zze.zzae(zzdVar), new zzhh(zzhbVar), zza(str, adRequestParcel.zzayp, str2), new zzhf(adRequestParcel.zzayl == -1 ? null : new Date(adRequestParcel.zzayl), adRequestParcel.zzaym, adRequestParcel.zzayn != null ? new HashSet(adRequestParcel.zzayn) : null, adRequestParcel.zzayt, adRequestParcel.zzayo, adRequestParcel.zzayp, adRequestParcel.zzaza), adRequestParcel.zzayv != null ? adRequestParcel.zzayv.getBundle(mediationInterstitialAdapter.getClass().getName()) : null);
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not request interstitial ad from adapter.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.zzha
    public void zza(com.google.android.gms.dynamic.zzd zzdVar, AdRequestParcel adRequestParcel, String str, String str2, zzhb zzhbVar, NativeAdOptionsParcel nativeAdOptionsParcel, List<String> list) throws RemoteException {
        if (!(this.zzbxh instanceof MediationNativeAdapter)) {
            String valueOf = String.valueOf(this.zzbxh.getClass().getCanonicalName());
            com.google.android.gms.ads.internal.util.client.zzb.zzdi(valueOf.length() != 0 ? "MediationAdapter is not a MediationNativeAdapter: ".concat(valueOf) : new String("MediationAdapter is not a MediationNativeAdapter: "));
            throw new RemoteException();
        }
        try {
            MediationNativeAdapter mediationNativeAdapter = (MediationNativeAdapter) this.zzbxh;
            zzhk zzhkVar = new zzhk(adRequestParcel.zzayl == -1 ? null : new Date(adRequestParcel.zzayl), adRequestParcel.zzaym, adRequestParcel.zzayn != null ? new HashSet(adRequestParcel.zzayn) : null, adRequestParcel.zzayt, adRequestParcel.zzayo, adRequestParcel.zzayp, nativeAdOptionsParcel, list, adRequestParcel.zzaza);
            Bundle bundle = adRequestParcel.zzayv != null ? adRequestParcel.zzayv.getBundle(mediationNativeAdapter.getClass().getName()) : null;
            this.zzbxi = new zzhh(zzhbVar);
            mediationNativeAdapter.requestNativeAd((Context) com.google.android.gms.dynamic.zze.zzae(zzdVar), this.zzbxi, zza(str, adRequestParcel.zzayp, str2), zzhkVar, bundle);
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not request native ad from adapter.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.zzha
    public void zza(com.google.android.gms.dynamic.zzd zzdVar, AdSizeParcel adSizeParcel, AdRequestParcel adRequestParcel, String str, zzhb zzhbVar) throws RemoteException {
        zza(zzdVar, adSizeParcel, adRequestParcel, str, null, zzhbVar);
    }

    @Override // com.google.android.gms.internal.zzha
    public void zza(com.google.android.gms.dynamic.zzd zzdVar, AdSizeParcel adSizeParcel, AdRequestParcel adRequestParcel, String str, String str2, zzhb zzhbVar) throws RemoteException {
        if (!(this.zzbxh instanceof MediationBannerAdapter)) {
            String valueOf = String.valueOf(this.zzbxh.getClass().getCanonicalName());
            com.google.android.gms.ads.internal.util.client.zzb.zzdi(valueOf.length() != 0 ? "MediationAdapter is not a MediationBannerAdapter: ".concat(valueOf) : new String("MediationAdapter is not a MediationBannerAdapter: "));
            throw new RemoteException();
        }
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Requesting banner ad from adapter.");
        try {
            MediationBannerAdapter mediationBannerAdapter = (MediationBannerAdapter) this.zzbxh;
            mediationBannerAdapter.requestBannerAd((Context) com.google.android.gms.dynamic.zze.zzae(zzdVar), new zzhh(zzhbVar), zza(str, adRequestParcel.zzayp, str2), com.google.android.gms.ads.zza.zza(adSizeParcel.width, adSizeParcel.height, adSizeParcel.zzazq), new zzhf(adRequestParcel.zzayl == -1 ? null : new Date(adRequestParcel.zzayl), adRequestParcel.zzaym, adRequestParcel.zzayn != null ? new HashSet(adRequestParcel.zzayn) : null, adRequestParcel.zzayt, adRequestParcel.zzayo, adRequestParcel.zzayp, adRequestParcel.zzaza), adRequestParcel.zzayv != null ? adRequestParcel.zzayv.getBundle(mediationBannerAdapter.getClass().getName()) : null);
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not request banner ad from adapter.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.zzha
    public void zzc(AdRequestParcel adRequestParcel, String str) throws RemoteException {
        zza(adRequestParcel, str, (String) null);
    }

    @Override // com.google.android.gms.internal.zzha
    public void zzj(com.google.android.gms.dynamic.zzd zzdVar) throws RemoteException {
        try {
            ((OnContextChangedListener) this.zzbxh).onContextChanged((Context) com.google.android.gms.dynamic.zze.zzae(zzdVar));
        } catch (Throwable th) {
            com.google.android.gms.ads.internal.util.client.zzb.zza("Could not inform adapter of changed context", th);
        }
    }

    @Override // com.google.android.gms.internal.zzha
    public zzhd zzom() {
        NativeAdMapper zzoq = this.zzbxi.zzoq();
        if (zzoq instanceof NativeAppInstallAdMapper) {
            return new zzhi((NativeAppInstallAdMapper) zzoq);
        }
        return null;
    }

    @Override // com.google.android.gms.internal.zzha
    public zzhe zzon() {
        NativeAdMapper zzoq = this.zzbxi.zzoq();
        if (zzoq instanceof NativeContentAdMapper) {
            return new zzhj((NativeContentAdMapper) zzoq);
        }
        return null;
    }

    @Override // com.google.android.gms.internal.zzha
    public Bundle zzoo() {
        if (!(this.zzbxh instanceof zzmq)) {
            String valueOf = String.valueOf(this.zzbxh.getClass().getCanonicalName());
            com.google.android.gms.ads.internal.util.client.zzb.zzdi(valueOf.length() != 0 ? "MediationAdapter is not a v2 MediationBannerAdapter: ".concat(valueOf) : new String("MediationAdapter is not a v2 MediationBannerAdapter: "));
            return new Bundle();
        }
        return ((zzmq) this.zzbxh).zzoo();
    }

    @Override // com.google.android.gms.internal.zzha
    public Bundle zzop() {
        return new Bundle();
    }
}
