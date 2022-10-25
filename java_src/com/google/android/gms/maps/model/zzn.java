package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzn implements Parcelable.Creator<StreetViewPanoramaOrientation> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(StreetViewPanoramaOrientation streetViewPanoramaOrientation, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, streetViewPanoramaOrientation.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, streetViewPanoramaOrientation.tilt);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, streetViewPanoramaOrientation.bearing);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzps */
    public StreetViewPanoramaOrientation createFromParcel(Parcel parcel) {
        float f = 0.0f;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        float f2 = 0.0f;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    f2 = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 3:
                    f = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new StreetViewPanoramaOrientation(i, f2, f);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzww */
    public StreetViewPanoramaOrientation[] newArray(int i) {
        return new StreetViewPanoramaOrientation[i];
    }
}
