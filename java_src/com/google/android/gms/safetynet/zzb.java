package com.google.android.gms.safetynet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzb implements Parcelable.Creator<HarmfulAppsData> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(HarmfulAppsData harmfulAppsData, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, harmfulAppsData.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, harmfulAppsData.apkPackageName, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, harmfulAppsData.aCe, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 4, harmfulAppsData.aCf);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzrv */
    public HarmfulAppsData createFromParcel(Parcel parcel) {
        byte[] bArr = null;
        int i = 0;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        String str = null;
        int i2 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 3:
                    bArr = com.google.android.gms.common.internal.safeparcel.zza.zzt(parcel, zzcq);
                    break;
                case 4:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new HarmfulAppsData(i2, str, bArr, i);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzzo */
    public HarmfulAppsData[] newArray(int i) {
        return new HarmfulAppsData[i];
    }
}
