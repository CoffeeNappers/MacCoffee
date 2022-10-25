package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzd implements Parcelable.Creator<LatLngBounds> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(LatLngBounds latLngBounds, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, latLngBounds.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, (Parcelable) latLngBounds.southwest, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, (Parcelable) latLngBounds.northeast, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzpi */
    public LatLngBounds createFromParcel(Parcel parcel) {
        LatLng latLng;
        LatLng latLng2;
        int i;
        LatLng latLng3 = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i2 = 0;
        LatLng latLng4 = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    LatLng latLng5 = latLng3;
                    latLng2 = latLng4;
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    latLng = latLng5;
                    break;
                case 2:
                    LatLng latLng6 = (LatLng) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, LatLng.CREATOR);
                    i = i2;
                    latLng = latLng3;
                    latLng2 = latLng6;
                    break;
                case 3:
                    latLng = (LatLng) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, LatLng.CREATOR);
                    latLng2 = latLng4;
                    i = i2;
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    latLng = latLng3;
                    latLng2 = latLng4;
                    i = i2;
                    break;
            }
            i2 = i;
            latLng4 = latLng2;
            latLng3 = latLng;
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new LatLngBounds(i2, latLng4, latLng3);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzwm */
    public LatLngBounds[] newArray(int i) {
        return new LatLngBounds[i];
    }
}
