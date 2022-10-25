package com.google.android.gms.phenotype;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzb implements Parcelable.Creator<Flag> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(Flag flag, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, flag.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, flag.name, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, flag.aAw);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, flag.ahI);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, flag.ahK);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, flag.Fe, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, flag.aAx, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 8, flag.aAy);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 9, flag.aAz);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzrg */
    public Flag createFromParcel(Parcel parcel) {
        byte[] bArr = null;
        int i = 0;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        long j = 0;
        double d = 0.0d;
        int i2 = 0;
        String str = null;
        boolean z = false;
        String str2 = null;
        int i3 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i3 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 3:
                    j = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 4:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 5:
                    d = com.google.android.gms.common.internal.safeparcel.zza.zzn(parcel, zzcq);
                    break;
                case 6:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 7:
                    bArr = com.google.android.gms.common.internal.safeparcel.zza.zzt(parcel, zzcq);
                    break;
                case 8:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 9:
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
        return new Flag(i3, str2, j, z, d, str, bArr, i2, i);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzyy */
    public Flag[] newArray(int i) {
        return new Flag[i];
    }
}
