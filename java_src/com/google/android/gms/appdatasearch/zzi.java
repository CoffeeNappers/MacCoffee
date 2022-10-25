package com.google.android.gms.appdatasearch;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzi implements Parcelable.Creator<RegisterSectionInfo> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(RegisterSectionInfo registerSectionInfo, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, registerSectionInfo.name, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, registerSectionInfo.gD, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, registerSectionInfo.gE);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 4, registerSectionInfo.weight);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, registerSectionInfo.gF);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, registerSectionInfo.gG, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, (Parcelable[]) registerSectionInfo.gH, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, registerSectionInfo.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, registerSectionInfo.gI, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 11, registerSectionInfo.gJ, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzad */
    public RegisterSectionInfo createFromParcel(Parcel parcel) {
        boolean z = false;
        String str = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 1;
        int[] iArr = null;
        Feature[] featureArr = null;
        String str2 = null;
        boolean z2 = false;
        String str3 = null;
        String str4 = null;
        int i2 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    str4 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 2:
                    str3 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 3:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 4:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 5:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 6:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 7:
                    featureArr = (Feature[]) com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq, Feature.CREATOR);
                    break;
                case 8:
                    iArr = com.google.android.gms.common.internal.safeparcel.zza.zzw(parcel, zzcq);
                    break;
                case 11:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 1000:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new RegisterSectionInfo(i2, str4, str3, z2, i, z, str2, featureArr, iArr, str);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzcp */
    public RegisterSectionInfo[] newArray(int i) {
        return new RegisterSectionInfo[i];
    }
}
