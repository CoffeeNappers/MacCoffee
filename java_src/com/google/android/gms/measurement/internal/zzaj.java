package com.google.android.gms.measurement.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzaj implements Parcelable.Creator<UserAttributeParcel> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(UserAttributeParcel userAttributeParcel, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, userAttributeParcel.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, userAttributeParcel.name, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, userAttributeParcel.avT);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, userAttributeParcel.avU, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, userAttributeParcel.avV, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, userAttributeParcel.Fe, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, userAttributeParcel.arK, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, userAttributeParcel.avW, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzpz */
    public UserAttributeParcel createFromParcel(Parcel parcel) {
        Double d = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        long j = 0;
        String str = null;
        String str2 = null;
        Float f = null;
        Long l = null;
        String str3 = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    str3 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 3:
                    j = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 4:
                    l = com.google.android.gms.common.internal.safeparcel.zza.zzj(parcel, zzcq);
                    break;
                case 5:
                    f = com.google.android.gms.common.internal.safeparcel.zza.zzm(parcel, zzcq);
                    break;
                case 6:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 7:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 8:
                    d = com.google.android.gms.common.internal.safeparcel.zza.zzo(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new UserAttributeParcel(i, str3, j, l, f, str2, str, d);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzxf */
    public UserAttributeParcel[] newArray(int i) {
        return new UserAttributeParcel[i];
    }
}
