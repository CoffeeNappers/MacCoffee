package com.google.android.gms.identity.intents.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzb implements Parcelable.Creator<UserAddress> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(UserAddress userAddress, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, userAddress.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, userAddress.name, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, userAddress.ahQ, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, userAddress.ahR, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, userAddress.ahS, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, userAddress.ahT, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, userAddress.ahU, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, userAddress.ahV, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 9, userAddress.ahW, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 10, userAddress.zzcpw, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 11, userAddress.ahX, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 12, userAddress.ahY, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 13, userAddress.phoneNumber, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 14, userAddress.ahZ);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 15, userAddress.aia, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 16, userAddress.aib, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzne */
    public UserAddress createFromParcel(Parcel parcel) {
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        String str = null;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        String str6 = null;
        String str7 = null;
        String str8 = null;
        String str9 = null;
        String str10 = null;
        String str11 = null;
        String str12 = null;
        boolean z = false;
        String str13 = null;
        String str14 = null;
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
                    str5 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 7:
                    str6 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 8:
                    str7 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 9:
                    str8 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 10:
                    str9 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 11:
                    str10 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 12:
                    str11 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 13:
                    str12 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 14:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 15:
                    str13 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 16:
                    str14 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new UserAddress(i, str, str2, str3, str4, str5, str6, str7, str8, str9, str10, str11, str12, z, str13, str14);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zztt */
    public UserAddress[] newArray(int i) {
        return new UserAddress[i];
    }
}
