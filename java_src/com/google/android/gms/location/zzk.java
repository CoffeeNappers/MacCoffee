package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.vkontakte.android.TimeUtils;
/* loaded from: classes2.dex */
public class zzk implements Parcelable.Creator<LocationRequest> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(LocationRequest locationRequest, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, locationRequest.mPriority);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, locationRequest.akm);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, locationRequest.akn);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, locationRequest.VT);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, locationRequest.ajR);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 6, locationRequest.ako);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, locationRequest.akp);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, locationRequest.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, locationRequest.akq);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zznw */
    public LocationRequest createFromParcel(Parcel parcel) {
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        int i2 = 102;
        long j = TimeUtils.HOUR;
        long j2 = 600000;
        boolean z = false;
        long j3 = Long.MAX_VALUE;
        int i3 = Integer.MAX_VALUE;
        float f = 0.0f;
        long j4 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    j = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 3:
                    j2 = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 4:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 5:
                    j3 = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 6:
                    i3 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 7:
                    f = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 8:
                    j4 = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 1000:
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
        return new LocationRequest(i, i2, j, j2, z, j3, i3, f, j4);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzus */
    public LocationRequest[] newArray(int i) {
        return new LocationRequest[i];
    }
}
