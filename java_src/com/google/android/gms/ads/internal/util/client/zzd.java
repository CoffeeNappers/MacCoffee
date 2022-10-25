package com.google.android.gms.ads.internal.util.client;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes.dex */
public class zzd implements Parcelable.Creator<VersionInfoParcel> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(VersionInfoParcel versionInfoParcel, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, versionInfoParcel.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, versionInfoParcel.zzda, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 3, versionInfoParcel.zzcya);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 4, versionInfoParcel.zzcyb);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, versionInfoParcel.zzcyc);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzbj */
    public VersionInfoParcel[] newArray(int i) {
        return new VersionInfoParcel[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzv */
    public VersionInfoParcel createFromParcel(Parcel parcel) {
        boolean z = false;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        String str = null;
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i3 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 3:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 4:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 5:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new VersionInfoParcel(i3, str, i2, i, z);
    }
}
