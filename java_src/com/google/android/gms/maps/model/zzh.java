package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzh implements Parcelable.Creator<PointOfInterest> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(PointOfInterest pointOfInterest, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, pointOfInterest.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, (Parcelable) pointOfInterest.latLng, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, pointOfInterest.placeId, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, pointOfInterest.name, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzpm */
    public PointOfInterest createFromParcel(Parcel parcel) {
        String zzq;
        String str;
        LatLng latLng;
        int i;
        String str2 = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i2 = 0;
        String str3 = null;
        LatLng latLng2 = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    String str4 = str2;
                    str = str3;
                    latLng = latLng2;
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    zzq = str4;
                    break;
                case 2:
                    i = i2;
                    String str5 = str3;
                    latLng = (LatLng) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, LatLng.CREATOR);
                    zzq = str2;
                    str = str5;
                    break;
                case 3:
                    latLng = latLng2;
                    i = i2;
                    String str6 = str2;
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    zzq = str6;
                    break;
                case 4:
                    zzq = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    str = str3;
                    latLng = latLng2;
                    i = i2;
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    zzq = str2;
                    str = str3;
                    latLng = latLng2;
                    i = i2;
                    break;
            }
            i2 = i;
            latLng2 = latLng;
            str3 = str;
            str2 = zzq;
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new PointOfInterest(i2, latLng2, str3, str2);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzwq */
    public PointOfInterest[] newArray(int i) {
        return new PointOfInterest[i];
    }
}
