package com.google.android.gms.ads.internal.reward.client;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes.dex */
public class zzh implements Parcelable.Creator<RewardedVideoAdRequestParcel> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(RewardedVideoAdRequestParcel rewardedVideoAdRequestParcel, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, rewardedVideoAdRequestParcel.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, (Parcelable) rewardedVideoAdRequestParcel.zzcju, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, rewardedVideoAdRequestParcel.zzarg, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzba */
    public RewardedVideoAdRequestParcel[] newArray(int i) {
        return new RewardedVideoAdRequestParcel[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzs */
    public RewardedVideoAdRequestParcel createFromParcel(Parcel parcel) {
        String zzq;
        AdRequestParcel adRequestParcel;
        int i;
        String str = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i2 = 0;
        AdRequestParcel adRequestParcel2 = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    String str2 = str;
                    adRequestParcel = adRequestParcel2;
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    zzq = str2;
                    break;
                case 2:
                    AdRequestParcel adRequestParcel3 = (AdRequestParcel) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, AdRequestParcel.CREATOR);
                    i = i2;
                    zzq = str;
                    adRequestParcel = adRequestParcel3;
                    break;
                case 3:
                    zzq = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    adRequestParcel = adRequestParcel2;
                    i = i2;
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    zzq = str;
                    adRequestParcel = adRequestParcel2;
                    i = i2;
                    break;
            }
            i2 = i;
            adRequestParcel2 = adRequestParcel;
            str = zzq;
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new RewardedVideoAdRequestParcel(i2, adRequestParcel2, str);
    }
}
