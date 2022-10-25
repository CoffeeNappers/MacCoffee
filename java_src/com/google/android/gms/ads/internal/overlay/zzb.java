package com.google.android.gms.ads.internal.overlay;

import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes.dex */
public class zzb implements Parcelable.Creator<AdLauncherIntentInfoParcel> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(AdLauncherIntentInfoParcel adLauncherIntentInfoParcel, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, adLauncherIntentInfoParcel.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, adLauncherIntentInfoParcel.zzbzl, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, adLauncherIntentInfoParcel.url, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, adLauncherIntentInfoParcel.mimeType, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, adLauncherIntentInfoParcel.packageName, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, adLauncherIntentInfoParcel.zzbzm, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, adLauncherIntentInfoParcel.zzbzn, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, adLauncherIntentInfoParcel.zzbzo, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 9, (Parcelable) adLauncherIntentInfoParcel.intent, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzah */
    public AdLauncherIntentInfoParcel[] newArray(int i) {
        return new AdLauncherIntentInfoParcel[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzj */
    public AdLauncherIntentInfoParcel createFromParcel(Parcel parcel) {
        Intent intent = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        String str = null;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        String str6 = null;
        String str7 = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    str7 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 3:
                    str6 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 4:
                    str5 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 5:
                    str4 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 6:
                    str3 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 7:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 8:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 9:
                    intent = (Intent) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, Intent.CREATOR);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new AdLauncherIntentInfoParcel(i, str7, str6, str5, str4, str3, str2, str, intent);
    }
}
