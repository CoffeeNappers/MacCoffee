package com.google.android.gms.location.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzo implements Parcelable.Creator<ParcelableGeofence> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(ParcelableGeofence parcelableGeofence, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, parcelableGeofence.getRequestId(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, parcelableGeofence.getExpirationTime());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, parcelableGeofence.zzbql());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, parcelableGeofence.getLatitude());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, parcelableGeofence.getLongitude());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, parcelableGeofence.getRadius());
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 7, parcelableGeofence.zzbqm());
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, parcelableGeofence.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 8, parcelableGeofence.zzbqn());
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 9, parcelableGeofence.zzbqo());
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzof */
    public ParcelableGeofence createFromParcel(Parcel parcel) {
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        String str = null;
        int i2 = 0;
        short s = 0;
        double d = 0.0d;
        double d2 = 0.0d;
        float f = 0.0f;
        long j = 0;
        int i3 = 0;
        int i4 = -1;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 2:
                    j = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 3:
                    s = com.google.android.gms.common.internal.safeparcel.zza.zzf(parcel, zzcq);
                    break;
                case 4:
                    d = com.google.android.gms.common.internal.safeparcel.zza.zzn(parcel, zzcq);
                    break;
                case 5:
                    d2 = com.google.android.gms.common.internal.safeparcel.zza.zzn(parcel, zzcq);
                    break;
                case 6:
                    f = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 7:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 8:
                    i3 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 9:
                    i4 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
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
        return new ParcelableGeofence(i, str, i2, s, d, d2, f, j, i3, i4);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzvg */
    public ParcelableGeofence[] newArray(int i) {
        return new ParcelableGeofence[i];
    }
}
