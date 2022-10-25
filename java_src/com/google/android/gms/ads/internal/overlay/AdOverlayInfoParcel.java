package com.google.android.gms.ads.internal.overlay;

import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.ads.internal.InterstitialAdParameterParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.internal.zzfa;
import com.google.android.gms.internal.zzfg;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzmd;
@zzji
/* loaded from: classes.dex */
public final class AdOverlayInfoParcel extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<AdOverlayInfoParcel> CREATOR = new zzf();
    public final int orientation;
    public final String url;
    public final int versionCode;
    public final VersionInfoParcel zzari;
    public final AdLauncherIntentInfoParcel zzcbj;
    public final com.google.android.gms.ads.internal.client.zza zzcbk;
    public final zzg zzcbl;
    public final zzmd zzcbm;
    public final zzfa zzcbn;
    public final String zzcbo;
    public final boolean zzcbp;
    public final String zzcbq;
    public final zzp zzcbr;
    public final int zzcbs;
    public final zzfg zzcbt;
    public final String zzcbu;
    public final InterstitialAdParameterParcel zzcbv;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AdOverlayInfoParcel(int i, AdLauncherIntentInfoParcel adLauncherIntentInfoParcel, IBinder iBinder, IBinder iBinder2, IBinder iBinder3, IBinder iBinder4, String str, boolean z, String str2, IBinder iBinder5, int i2, int i3, String str3, VersionInfoParcel versionInfoParcel, IBinder iBinder6, String str4, InterstitialAdParameterParcel interstitialAdParameterParcel) {
        this.versionCode = i;
        this.zzcbj = adLauncherIntentInfoParcel;
        this.zzcbk = (com.google.android.gms.ads.internal.client.zza) com.google.android.gms.dynamic.zze.zzae(zzd.zza.zzfd(iBinder));
        this.zzcbl = (zzg) com.google.android.gms.dynamic.zze.zzae(zzd.zza.zzfd(iBinder2));
        this.zzcbm = (zzmd) com.google.android.gms.dynamic.zze.zzae(zzd.zza.zzfd(iBinder3));
        this.zzcbn = (zzfa) com.google.android.gms.dynamic.zze.zzae(zzd.zza.zzfd(iBinder4));
        this.zzcbo = str;
        this.zzcbp = z;
        this.zzcbq = str2;
        this.zzcbr = (zzp) com.google.android.gms.dynamic.zze.zzae(zzd.zza.zzfd(iBinder5));
        this.orientation = i2;
        this.zzcbs = i3;
        this.url = str3;
        this.zzari = versionInfoParcel;
        this.zzcbt = (zzfg) com.google.android.gms.dynamic.zze.zzae(zzd.zza.zzfd(iBinder6));
        this.zzcbu = str4;
        this.zzcbv = interstitialAdParameterParcel;
    }

    public AdOverlayInfoParcel(com.google.android.gms.ads.internal.client.zza zzaVar, zzg zzgVar, zzp zzpVar, zzmd zzmdVar, int i, VersionInfoParcel versionInfoParcel, String str, InterstitialAdParameterParcel interstitialAdParameterParcel) {
        this.versionCode = 4;
        this.zzcbj = null;
        this.zzcbk = zzaVar;
        this.zzcbl = zzgVar;
        this.zzcbm = zzmdVar;
        this.zzcbn = null;
        this.zzcbo = null;
        this.zzcbp = false;
        this.zzcbq = null;
        this.zzcbr = zzpVar;
        this.orientation = i;
        this.zzcbs = 1;
        this.url = null;
        this.zzari = versionInfoParcel;
        this.zzcbt = null;
        this.zzcbu = str;
        this.zzcbv = interstitialAdParameterParcel;
    }

    public AdOverlayInfoParcel(com.google.android.gms.ads.internal.client.zza zzaVar, zzg zzgVar, zzp zzpVar, zzmd zzmdVar, boolean z, int i, VersionInfoParcel versionInfoParcel) {
        this.versionCode = 4;
        this.zzcbj = null;
        this.zzcbk = zzaVar;
        this.zzcbl = zzgVar;
        this.zzcbm = zzmdVar;
        this.zzcbn = null;
        this.zzcbo = null;
        this.zzcbp = z;
        this.zzcbq = null;
        this.zzcbr = zzpVar;
        this.orientation = i;
        this.zzcbs = 2;
        this.url = null;
        this.zzari = versionInfoParcel;
        this.zzcbt = null;
        this.zzcbu = null;
        this.zzcbv = null;
    }

    public AdOverlayInfoParcel(com.google.android.gms.ads.internal.client.zza zzaVar, zzg zzgVar, zzfa zzfaVar, zzp zzpVar, zzmd zzmdVar, boolean z, int i, String str, VersionInfoParcel versionInfoParcel, zzfg zzfgVar) {
        this.versionCode = 4;
        this.zzcbj = null;
        this.zzcbk = zzaVar;
        this.zzcbl = zzgVar;
        this.zzcbm = zzmdVar;
        this.zzcbn = zzfaVar;
        this.zzcbo = null;
        this.zzcbp = z;
        this.zzcbq = null;
        this.zzcbr = zzpVar;
        this.orientation = i;
        this.zzcbs = 3;
        this.url = str;
        this.zzari = versionInfoParcel;
        this.zzcbt = zzfgVar;
        this.zzcbu = null;
        this.zzcbv = null;
    }

    public AdOverlayInfoParcel(com.google.android.gms.ads.internal.client.zza zzaVar, zzg zzgVar, zzfa zzfaVar, zzp zzpVar, zzmd zzmdVar, boolean z, int i, String str, String str2, VersionInfoParcel versionInfoParcel, zzfg zzfgVar) {
        this.versionCode = 4;
        this.zzcbj = null;
        this.zzcbk = zzaVar;
        this.zzcbl = zzgVar;
        this.zzcbm = zzmdVar;
        this.zzcbn = zzfaVar;
        this.zzcbo = str2;
        this.zzcbp = z;
        this.zzcbq = str;
        this.zzcbr = zzpVar;
        this.orientation = i;
        this.zzcbs = 3;
        this.url = null;
        this.zzari = versionInfoParcel;
        this.zzcbt = zzfgVar;
        this.zzcbu = null;
        this.zzcbv = null;
    }

    public AdOverlayInfoParcel(AdLauncherIntentInfoParcel adLauncherIntentInfoParcel, com.google.android.gms.ads.internal.client.zza zzaVar, zzg zzgVar, zzp zzpVar, VersionInfoParcel versionInfoParcel) {
        this.versionCode = 4;
        this.zzcbj = adLauncherIntentInfoParcel;
        this.zzcbk = zzaVar;
        this.zzcbl = zzgVar;
        this.zzcbm = null;
        this.zzcbn = null;
        this.zzcbo = null;
        this.zzcbp = false;
        this.zzcbq = null;
        this.zzcbr = zzpVar;
        this.orientation = -1;
        this.zzcbs = 4;
        this.url = null;
        this.zzari = versionInfoParcel;
        this.zzcbt = null;
        this.zzcbu = null;
        this.zzcbv = null;
    }

    public static void zza(Intent intent, AdOverlayInfoParcel adOverlayInfoParcel) {
        Bundle bundle = new Bundle(1);
        bundle.putParcelable("com.google.android.gms.ads.inernal.overlay.AdOverlayInfo", adOverlayInfoParcel);
        intent.putExtra("com.google.android.gms.ads.inernal.overlay.AdOverlayInfo", bundle);
    }

    public static AdOverlayInfoParcel zzb(Intent intent) {
        try {
            Bundle bundleExtra = intent.getBundleExtra("com.google.android.gms.ads.inernal.overlay.AdOverlayInfo");
            bundleExtra.setClassLoader(AdOverlayInfoParcel.class.getClassLoader());
            return (AdOverlayInfoParcel) bundleExtra.getParcelable("com.google.android.gms.ads.inernal.overlay.AdOverlayInfo");
        } catch (Exception e) {
            return null;
        }
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzf.zza(this, parcel, i);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IBinder zzpv() {
        return com.google.android.gms.dynamic.zze.zzac(this.zzcbk).asBinder();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IBinder zzpw() {
        return com.google.android.gms.dynamic.zze.zzac(this.zzcbl).asBinder();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IBinder zzpx() {
        return com.google.android.gms.dynamic.zze.zzac(this.zzcbm).asBinder();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IBinder zzpy() {
        return com.google.android.gms.dynamic.zze.zzac(this.zzcbn).asBinder();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IBinder zzpz() {
        return com.google.android.gms.dynamic.zze.zzac(this.zzcbt).asBinder();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IBinder zzqa() {
        return com.google.android.gms.dynamic.zze.zzac(this.zzcbr).asBinder();
    }
}
