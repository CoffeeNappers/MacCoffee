package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zze implements Parcelable.Creator<LatLng> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(LatLng latLng, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, latLng.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, latLng.latitude);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, latLng.longitude);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzpj */
    public LatLng createFromParcel(Parcel parcel) {
        double d = 0.0d;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        double d2 = 0.0d;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    d2 = com.google.android.gms.common.internal.safeparcel.zza.zzn(parcel, zzcq);
                    break;
                case 3:
                    d = com.google.android.gms.common.internal.safeparcel.zza.zzn(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new LatLng(i, d2, d);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzwn */
    public LatLng[] newArray(int i) {
        return new LatLng[i];
    }
}
