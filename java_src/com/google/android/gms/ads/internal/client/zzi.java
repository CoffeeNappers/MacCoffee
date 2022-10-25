package com.google.android.gms.ads.internal.client;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes.dex */
public class zzi implements Parcelable.Creator<AdSizeParcel> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(AdSizeParcel adSizeParcel, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, adSizeParcel.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, adSizeParcel.zzazq, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 3, adSizeParcel.height);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 4, adSizeParcel.heightPixels);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, adSizeParcel.zzazr);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 6, adSizeParcel.width);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 7, adSizeParcel.widthPixels);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, (Parcelable[]) adSizeParcel.zzazs, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 9, adSizeParcel.zzazt);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 10, adSizeParcel.zzazu);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 11, adSizeParcel.zzazv);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzf */
    public AdSizeParcel createFromParcel(Parcel parcel) {
        AdSizeParcel[] adSizeParcelArr = null;
        boolean z = false;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        boolean z2 = false;
        boolean z3 = false;
        int i = 0;
        int i2 = 0;
        boolean z4 = false;
        int i3 = 0;
        int i4 = 0;
        String str = null;
        int i5 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i5 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 3:
                    i4 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 4:
                    i3 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 5:
                    z4 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 6:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 7:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 8:
                    adSizeParcelArr = (AdSizeParcel[]) com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq, AdSizeParcel.CREATOR);
                    break;
                case 9:
                    z3 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 10:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 11:
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
        return new AdSizeParcel(i5, str, i4, i3, z4, i2, i, adSizeParcelArr, z3, z2, z);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzw */
    public AdSizeParcel[] newArray(int i) {
        return new AdSizeParcel[i];
    }
}
