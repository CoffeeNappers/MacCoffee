package com.google.android.gms.ads.internal.request;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.os.Bundle;
import android.os.Messenger;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.common.internal.safeparcel.zza;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class zzf implements Parcelable.Creator<AdRequestInfoParcel> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(AdRequestInfoParcel adRequestInfoParcel, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, adRequestInfoParcel.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, adRequestInfoParcel.zzcjt, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, (Parcelable) adRequestInfoParcel.zzcju, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, (Parcelable) adRequestInfoParcel.zzarm, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, adRequestInfoParcel.zzarg, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, (Parcelable) adRequestInfoParcel.applicationInfo, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, (Parcelable) adRequestInfoParcel.zzcjv, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, adRequestInfoParcel.zzcjw, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 9, adRequestInfoParcel.zzcjx, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 10, adRequestInfoParcel.zzcjy, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 11, (Parcelable) adRequestInfoParcel.zzari, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 12, adRequestInfoParcel.zzcjz, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 13, adRequestInfoParcel.zzcka);
        com.google.android.gms.common.internal.safeparcel.zzb.zzb(parcel, 14, adRequestInfoParcel.zzase, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 15, adRequestInfoParcel.zzckb, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 16, adRequestInfoParcel.zzckc);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 17, (Parcelable) adRequestInfoParcel.zzckd, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 18, adRequestInfoParcel.zzcke);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 19, adRequestInfoParcel.zzckf);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 20, adRequestInfoParcel.zzavd);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 21, adRequestInfoParcel.zzckg, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 25, adRequestInfoParcel.zzckh);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 26, adRequestInfoParcel.zzcki, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzb(parcel, 27, adRequestInfoParcel.zzckj, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 28, adRequestInfoParcel.zzarf, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 29, (Parcelable) adRequestInfoParcel.zzasa, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzb(parcel, 30, adRequestInfoParcel.zzckk, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 31, adRequestInfoParcel.zzckl);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 32, (Parcelable) adRequestInfoParcel.zzckm, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 33, adRequestInfoParcel.zzckn, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 34, adRequestInfoParcel.zzcko);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 35, adRequestInfoParcel.zzckp);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 36, adRequestInfoParcel.zzckq);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 37, adRequestInfoParcel.zzckr);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 38, adRequestInfoParcel.zzcks);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 39, adRequestInfoParcel.zzckt, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 40, adRequestInfoParcel.zzcku);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 41, adRequestInfoParcel.zzckv, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 42, adRequestInfoParcel.zzbvo);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 43, adRequestInfoParcel.zzckw);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 44, adRequestInfoParcel.zzckx, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 45, adRequestInfoParcel.zzcky, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzat */
    public AdRequestInfoParcel[] newArray(int i) {
        return new AdRequestInfoParcel[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzm */
    public AdRequestInfoParcel createFromParcel(Parcel parcel) {
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        Bundle bundle = null;
        AdRequestParcel adRequestParcel = null;
        AdSizeParcel adSizeParcel = null;
        String str = null;
        ApplicationInfo applicationInfo = null;
        PackageInfo packageInfo = null;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        VersionInfoParcel versionInfoParcel = null;
        Bundle bundle2 = null;
        int i2 = 0;
        ArrayList<String> arrayList = null;
        Bundle bundle3 = null;
        boolean z = false;
        Messenger messenger = null;
        int i3 = 0;
        int i4 = 0;
        float f = 0.0f;
        String str5 = null;
        long j = 0;
        String str6 = null;
        ArrayList<String> arrayList2 = null;
        String str7 = null;
        NativeAdOptionsParcel nativeAdOptionsParcel = null;
        ArrayList<String> arrayList3 = null;
        long j2 = 0;
        CapabilityParcel capabilityParcel = null;
        String str8 = null;
        float f2 = 0.0f;
        boolean z2 = false;
        int i5 = 0;
        int i6 = 0;
        boolean z3 = false;
        boolean z4 = false;
        String str9 = null;
        String str10 = null;
        boolean z5 = false;
        int i7 = 0;
        Bundle bundle4 = null;
        String str11 = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    bundle = com.google.android.gms.common.internal.safeparcel.zza.zzs(parcel, zzcq);
                    break;
                case 3:
                    adRequestParcel = (AdRequestParcel) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, AdRequestParcel.CREATOR);
                    break;
                case 4:
                    adSizeParcel = (AdSizeParcel) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, AdSizeParcel.CREATOR);
                    break;
                case 5:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 6:
                    applicationInfo = (ApplicationInfo) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, ApplicationInfo.CREATOR);
                    break;
                case 7:
                    packageInfo = (PackageInfo) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, PackageInfo.CREATOR);
                    break;
                case 8:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 9:
                    str3 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 10:
                    str4 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 11:
                    versionInfoParcel = (VersionInfoParcel) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, VersionInfoParcel.CREATOR);
                    break;
                case 12:
                    bundle2 = com.google.android.gms.common.internal.safeparcel.zza.zzs(parcel, zzcq);
                    break;
                case 13:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 14:
                    arrayList = com.google.android.gms.common.internal.safeparcel.zza.zzae(parcel, zzcq);
                    break;
                case 15:
                    bundle3 = com.google.android.gms.common.internal.safeparcel.zza.zzs(parcel, zzcq);
                    break;
                case 16:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 17:
                    messenger = (Messenger) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, Messenger.CREATOR);
                    break;
                case 18:
                    i3 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 19:
                    i4 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 20:
                    f = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 21:
                    str5 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 22:
                case 23:
                case 24:
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
                case 25:
                    j = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 26:
                    str6 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 27:
                    arrayList2 = com.google.android.gms.common.internal.safeparcel.zza.zzae(parcel, zzcq);
                    break;
                case 28:
                    str7 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 29:
                    nativeAdOptionsParcel = (NativeAdOptionsParcel) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, NativeAdOptionsParcel.CREATOR);
                    break;
                case 30:
                    arrayList3 = com.google.android.gms.common.internal.safeparcel.zza.zzae(parcel, zzcq);
                    break;
                case 31:
                    j2 = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 32:
                    capabilityParcel = (CapabilityParcel) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, CapabilityParcel.CREATOR);
                    break;
                case 33:
                    str8 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 34:
                    f2 = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 35:
                    i5 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 36:
                    i6 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 37:
                    z3 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 38:
                    z4 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 39:
                    str9 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 40:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 41:
                    str10 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 42:
                    z5 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 43:
                    i7 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 44:
                    bundle4 = com.google.android.gms.common.internal.safeparcel.zza.zzs(parcel, zzcq);
                    break;
                case 45:
                    str11 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new AdRequestInfoParcel(i, bundle, adRequestParcel, adSizeParcel, str, applicationInfo, packageInfo, str2, str3, str4, versionInfoParcel, bundle2, i2, arrayList, bundle3, z, messenger, i3, i4, f, str5, j, str6, arrayList2, str7, nativeAdOptionsParcel, arrayList3, j2, capabilityParcel, str8, f2, z2, i5, i6, z3, z4, str9, str10, z5, i7, bundle4, str11);
    }
}
