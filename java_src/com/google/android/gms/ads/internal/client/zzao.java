package com.google.android.gms.ads.internal.client;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes.dex */
public class zzao implements Parcelable.Creator<SearchAdRequestParcel> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(SearchAdRequestParcel searchAdRequestParcel, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, searchAdRequestParcel.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 2, searchAdRequestParcel.zzbbx);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 3, searchAdRequestParcel.backgroundColor);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 4, searchAdRequestParcel.zzbby);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 5, searchAdRequestParcel.zzbbz);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 6, searchAdRequestParcel.zzbca);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 7, searchAdRequestParcel.zzbcb);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 8, searchAdRequestParcel.zzbcc);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 9, searchAdRequestParcel.zzbcd);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 10, searchAdRequestParcel.zzbce, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 11, searchAdRequestParcel.zzbcf);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 12, searchAdRequestParcel.zzbcg, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 13, searchAdRequestParcel.zzbch);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 14, searchAdRequestParcel.zzbci);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 15, searchAdRequestParcel.zzbcj, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzg */
    public SearchAdRequestParcel createFromParcel(Parcel parcel) {
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        int i4 = 0;
        int i5 = 0;
        int i6 = 0;
        int i7 = 0;
        int i8 = 0;
        int i9 = 0;
        String str = null;
        int i10 = 0;
        String str2 = null;
        int i11 = 0;
        int i12 = 0;
        String str3 = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 3:
                    i3 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 4:
                    i4 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 5:
                    i5 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 6:
                    i6 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 7:
                    i7 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 8:
                    i8 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 9:
                    i9 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 10:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 11:
                    i10 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 12:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 13:
                    i11 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 14:
                    i12 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 15:
                    str3 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new SearchAdRequestParcel(i, i2, i3, i4, i5, i6, i7, i8, i9, str, i10, str2, i11, i12, str3);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzz */
    public SearchAdRequestParcel[] newArray(int i) {
        return new SearchAdRequestParcel[i];
    }
}
