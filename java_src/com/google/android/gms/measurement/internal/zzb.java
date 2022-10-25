package com.google.android.gms.measurement.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzb implements Parcelable.Creator<AppMetadata> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(AppMetadata appMetadata, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, appMetadata.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, appMetadata.packageName, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, appMetadata.aqZ, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, appMetadata.aii, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, appMetadata.ara, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, appMetadata.arb);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, appMetadata.arc);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, appMetadata.ard, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 9, appMetadata.are);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 10, appMetadata.arf);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 11, appMetadata.arg);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 12, appMetadata.arh, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzpw */
    public AppMetadata createFromParcel(Parcel parcel) {
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        String str = null;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        long j = 0;
        long j2 = 0;
        String str5 = null;
        boolean z = false;
        boolean z2 = false;
        long j3 = 0;
        String str6 = null;
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
                    str3 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 5:
                    str4 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 6:
                    j = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 7:
                    j2 = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 8:
                    str5 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 9:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 10:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 11:
                    j3 = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 12:
                    str6 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new AppMetadata(i, str, str2, str3, str4, j, j2, str5, z, z2, j3, str6);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzxb */
    public AppMetadata[] newArray(int i) {
        return new AppMetadata[i];
    }
}
