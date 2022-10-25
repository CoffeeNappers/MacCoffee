package com.google.android.gms.ads.internal.cache;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes.dex */
public class zzd implements Parcelable.Creator<CacheOffering> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(CacheOffering cacheOffering, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, cacheOffering.version);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, cacheOffering.url, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, cacheOffering.zzayd);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, cacheOffering.zzaye, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, cacheOffering.zzayf, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, cacheOffering.zzayg, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, cacheOffering.zzayh, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, cacheOffering.zzayi);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzd */
    public CacheOffering createFromParcel(Parcel parcel) {
        boolean z = false;
        Bundle bundle = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        long j = 0;
        String str = null;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        int i = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    str4 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 3:
                    j = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 4:
                    str3 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 5:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 6:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 7:
                    bundle = com.google.android.gms.common.internal.safeparcel.zza.zzs(parcel, zzcq);
                    break;
                case 8:
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
        return new CacheOffering(i, str4, j, str3, str2, str, bundle, z);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzu */
    public CacheOffering[] newArray(int i) {
        return new CacheOffering[i];
    }
}
