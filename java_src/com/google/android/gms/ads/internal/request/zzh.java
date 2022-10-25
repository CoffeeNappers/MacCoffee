package com.google.android.gms.ads.internal.request;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.ads.internal.reward.mediation.client.RewardItemParcel;
import com.google.android.gms.ads.internal.safebrowsing.SafeBrowsingConfigParcel;
import com.google.android.gms.common.internal.safeparcel.zza;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class zzh implements Parcelable.Creator<AdResponseParcel> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(AdResponseParcel adResponseParcel, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, adResponseParcel.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, adResponseParcel.zzcbo, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, adResponseParcel.body, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzb(parcel, 4, adResponseParcel.zzbvk, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 5, adResponseParcel.errorCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zzb(parcel, 6, adResponseParcel.zzbvl, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, adResponseParcel.zzcla);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, adResponseParcel.zzclb);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 9, adResponseParcel.zzclc);
        com.google.android.gms.common.internal.safeparcel.zzb.zzb(parcel, 10, adResponseParcel.zzcld, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 11, adResponseParcel.zzbvq);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 12, adResponseParcel.orientation);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 13, adResponseParcel.zzcle, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 14, adResponseParcel.zzclf);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 15, adResponseParcel.zzclg, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 18, adResponseParcel.zzclh);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 19, adResponseParcel.zzcli, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 21, adResponseParcel.zzclj, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 22, adResponseParcel.zzclk);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 23, adResponseParcel.zzazt);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 24, adResponseParcel.zzckc);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 25, adResponseParcel.zzcll);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 26, adResponseParcel.zzclm);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 28, (Parcelable) adResponseParcel.zzcln, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 29, adResponseParcel.zzclo, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 30, adResponseParcel.zzclp, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 31, adResponseParcel.zzazu);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 32, adResponseParcel.zzazv);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 33, (Parcelable) adResponseParcel.zzclq, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzb(parcel, 34, adResponseParcel.zzclr, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzb(parcel, 35, adResponseParcel.zzcls, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 36, adResponseParcel.zzclt);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 37, (Parcelable) adResponseParcel.zzclu, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 38, adResponseParcel.zzcks);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 39, adResponseParcel.zzckt, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzb(parcel, 40, adResponseParcel.zzbvn, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 42, adResponseParcel.zzbvo);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 43, adResponseParcel.zzclv, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 44, (Parcelable) adResponseParcel.zzclw, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 45, adResponseParcel.zzclx, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 46, adResponseParcel.zzcly);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzau */
    public AdResponseParcel[] newArray(int i) {
        return new AdResponseParcel[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzn */
    public AdResponseParcel createFromParcel(Parcel parcel) {
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        String str = null;
        String str2 = null;
        ArrayList<String> arrayList = null;
        int i2 = 0;
        ArrayList<String> arrayList2 = null;
        long j = 0;
        boolean z = false;
        long j2 = 0;
        ArrayList<String> arrayList3 = null;
        long j3 = 0;
        int i3 = 0;
        String str3 = null;
        long j4 = 0;
        String str4 = null;
        boolean z2 = false;
        String str5 = null;
        String str6 = null;
        boolean z3 = false;
        boolean z4 = false;
        boolean z5 = false;
        boolean z6 = false;
        boolean z7 = false;
        LargeParcelTeleporter largeParcelTeleporter = null;
        String str7 = null;
        String str8 = null;
        boolean z8 = false;
        boolean z9 = false;
        RewardItemParcel rewardItemParcel = null;
        ArrayList<String> arrayList4 = null;
        ArrayList<String> arrayList5 = null;
        boolean z10 = false;
        AutoClickProtectionConfigurationParcel autoClickProtectionConfigurationParcel = null;
        boolean z11 = false;
        String str9 = null;
        ArrayList<String> arrayList6 = null;
        boolean z12 = false;
        String str10 = null;
        SafeBrowsingConfigParcel safeBrowsingConfigParcel = null;
        String str11 = null;
        boolean z13 = false;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 3:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 4:
                    arrayList = com.google.android.gms.common.internal.safeparcel.zza.zzae(parcel, zzcq);
                    break;
                case 5:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 6:
                    arrayList2 = com.google.android.gms.common.internal.safeparcel.zza.zzae(parcel, zzcq);
                    break;
                case 7:
                    j = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 8:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 9:
                    j2 = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 10:
                    arrayList3 = com.google.android.gms.common.internal.safeparcel.zza.zzae(parcel, zzcq);
                    break;
                case 11:
                    j3 = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 12:
                    i3 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 13:
                    str3 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 14:
                    j4 = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 15:
                    str4 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 16:
                case 17:
                case 20:
                case 27:
                case 41:
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
                case 18:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 19:
                    str5 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 21:
                    str6 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 22:
                    z3 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 23:
                    z4 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 24:
                    z5 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 25:
                    z6 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 26:
                    z7 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 28:
                    largeParcelTeleporter = (LargeParcelTeleporter) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, LargeParcelTeleporter.CREATOR);
                    break;
                case 29:
                    str7 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 30:
                    str8 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 31:
                    z8 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 32:
                    z9 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 33:
                    rewardItemParcel = (RewardItemParcel) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, RewardItemParcel.CREATOR);
                    break;
                case 34:
                    arrayList4 = com.google.android.gms.common.internal.safeparcel.zza.zzae(parcel, zzcq);
                    break;
                case 35:
                    arrayList5 = com.google.android.gms.common.internal.safeparcel.zza.zzae(parcel, zzcq);
                    break;
                case 36:
                    z10 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 37:
                    autoClickProtectionConfigurationParcel = (AutoClickProtectionConfigurationParcel) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, AutoClickProtectionConfigurationParcel.CREATOR);
                    break;
                case 38:
                    z11 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 39:
                    str9 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 40:
                    arrayList6 = com.google.android.gms.common.internal.safeparcel.zza.zzae(parcel, zzcq);
                    break;
                case 42:
                    z12 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 43:
                    str10 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 44:
                    safeBrowsingConfigParcel = (SafeBrowsingConfigParcel) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, SafeBrowsingConfigParcel.CREATOR);
                    break;
                case 45:
                    str11 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 46:
                    z13 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new AdResponseParcel(i, str, str2, arrayList, i2, arrayList2, j, z, j2, arrayList3, j3, i3, str3, j4, str4, z2, str5, str6, z3, z4, z5, z6, z7, largeParcelTeleporter, str7, str8, z8, z9, rewardItemParcel, arrayList4, arrayList5, z10, autoClickProtectionConfigurationParcel, z11, str9, arrayList6, z12, str10, safeBrowsingConfigParcel, str11, z13);
    }
}
