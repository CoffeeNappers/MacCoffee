package com.google.android.gms.ads.internal.overlay;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.ads.internal.InterstitialAdParameterParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes.dex */
public class zzf implements Parcelable.Creator<AdOverlayInfoParcel> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(AdOverlayInfoParcel adOverlayInfoParcel, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, adOverlayInfoParcel.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, (Parcelable) adOverlayInfoParcel.zzcbj, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, adOverlayInfoParcel.zzpv(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, adOverlayInfoParcel.zzpw(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, adOverlayInfoParcel.zzpx(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, adOverlayInfoParcel.zzpy(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, adOverlayInfoParcel.zzcbo, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, adOverlayInfoParcel.zzcbp);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 9, adOverlayInfoParcel.zzcbq, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 10, adOverlayInfoParcel.zzqa(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 11, adOverlayInfoParcel.orientation);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 12, adOverlayInfoParcel.zzcbs);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 13, adOverlayInfoParcel.url, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 14, (Parcelable) adOverlayInfoParcel.zzari, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 15, adOverlayInfoParcel.zzpz(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 16, adOverlayInfoParcel.zzcbu, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 17, (Parcelable) adOverlayInfoParcel.zzcbv, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzal */
    public AdOverlayInfoParcel[] newArray(int i) {
        return new AdOverlayInfoParcel[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzk */
    public AdOverlayInfoParcel createFromParcel(Parcel parcel) {
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        AdLauncherIntentInfoParcel adLauncherIntentInfoParcel = null;
        IBinder iBinder = null;
        IBinder iBinder2 = null;
        IBinder iBinder3 = null;
        IBinder iBinder4 = null;
        String str = null;
        boolean z = false;
        String str2 = null;
        IBinder iBinder5 = null;
        int i2 = 0;
        int i3 = 0;
        String str3 = null;
        VersionInfoParcel versionInfoParcel = null;
        IBinder iBinder6 = null;
        String str4 = null;
        InterstitialAdParameterParcel interstitialAdParameterParcel = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    adLauncherIntentInfoParcel = (AdLauncherIntentInfoParcel) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, AdLauncherIntentInfoParcel.CREATOR);
                    break;
                case 3:
                    iBinder = com.google.android.gms.common.internal.safeparcel.zza.zzr(parcel, zzcq);
                    break;
                case 4:
                    iBinder2 = com.google.android.gms.common.internal.safeparcel.zza.zzr(parcel, zzcq);
                    break;
                case 5:
                    iBinder3 = com.google.android.gms.common.internal.safeparcel.zza.zzr(parcel, zzcq);
                    break;
                case 6:
                    iBinder4 = com.google.android.gms.common.internal.safeparcel.zza.zzr(parcel, zzcq);
                    break;
                case 7:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 8:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 9:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 10:
                    iBinder5 = com.google.android.gms.common.internal.safeparcel.zza.zzr(parcel, zzcq);
                    break;
                case 11:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 12:
                    i3 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 13:
                    str3 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 14:
                    versionInfoParcel = (VersionInfoParcel) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, VersionInfoParcel.CREATOR);
                    break;
                case 15:
                    iBinder6 = com.google.android.gms.common.internal.safeparcel.zza.zzr(parcel, zzcq);
                    break;
                case 16:
                    str4 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 17:
                    interstitialAdParameterParcel = (InterstitialAdParameterParcel) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, InterstitialAdParameterParcel.CREATOR);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new AdOverlayInfoParcel(i, adLauncherIntentInfoParcel, iBinder, iBinder2, iBinder3, iBinder4, str, z, str2, iBinder5, i2, i3, str3, versionInfoParcel, iBinder6, str4, interstitialAdParameterParcel);
    }
}
