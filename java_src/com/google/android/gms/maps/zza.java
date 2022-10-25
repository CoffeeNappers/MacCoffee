package com.google.android.gms.maps;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLngBounds;
/* loaded from: classes2.dex */
public class zza implements Parcelable.Creator<GoogleMapOptions> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(GoogleMapOptions googleMapOptions, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, googleMapOptions.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, googleMapOptions.zzbse());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, googleMapOptions.zzbsf());
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 4, googleMapOptions.getMapType());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, (Parcelable) googleMapOptions.getCamera(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, googleMapOptions.zzbsg());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, googleMapOptions.zzbsh());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, googleMapOptions.zzbsi());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 9, googleMapOptions.zzbsj());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 10, googleMapOptions.zzbsk());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 11, googleMapOptions.zzbsl());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 12, googleMapOptions.zzbsm());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 14, googleMapOptions.zzbsn());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 15, googleMapOptions.zzbso());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 16, googleMapOptions.getMinZoomPreference(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 17, googleMapOptions.getMaxZoomPreference(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 18, (Parcelable) googleMapOptions.getLatLngBoundsForCameraTarget(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzpd */
    public GoogleMapOptions createFromParcel(Parcel parcel) {
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        byte b = -1;
        byte b2 = -1;
        int i2 = 0;
        CameraPosition cameraPosition = null;
        byte b3 = -1;
        byte b4 = -1;
        byte b5 = -1;
        byte b6 = -1;
        byte b7 = -1;
        byte b8 = -1;
        byte b9 = -1;
        byte b10 = -1;
        byte b11 = -1;
        Float f = null;
        Float f2 = null;
        LatLngBounds latLngBounds = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    b = com.google.android.gms.common.internal.safeparcel.zza.zze(parcel, zzcq);
                    break;
                case 3:
                    b2 = com.google.android.gms.common.internal.safeparcel.zza.zze(parcel, zzcq);
                    break;
                case 4:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 5:
                    cameraPosition = (CameraPosition) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, CameraPosition.CREATOR);
                    break;
                case 6:
                    b3 = com.google.android.gms.common.internal.safeparcel.zza.zze(parcel, zzcq);
                    break;
                case 7:
                    b4 = com.google.android.gms.common.internal.safeparcel.zza.zze(parcel, zzcq);
                    break;
                case 8:
                    b5 = com.google.android.gms.common.internal.safeparcel.zza.zze(parcel, zzcq);
                    break;
                case 9:
                    b6 = com.google.android.gms.common.internal.safeparcel.zza.zze(parcel, zzcq);
                    break;
                case 10:
                    b7 = com.google.android.gms.common.internal.safeparcel.zza.zze(parcel, zzcq);
                    break;
                case 11:
                    b8 = com.google.android.gms.common.internal.safeparcel.zza.zze(parcel, zzcq);
                    break;
                case 12:
                    b9 = com.google.android.gms.common.internal.safeparcel.zza.zze(parcel, zzcq);
                    break;
                case 13:
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
                case 14:
                    b10 = com.google.android.gms.common.internal.safeparcel.zza.zze(parcel, zzcq);
                    break;
                case 15:
                    b11 = com.google.android.gms.common.internal.safeparcel.zza.zze(parcel, zzcq);
                    break;
                case 16:
                    f = com.google.android.gms.common.internal.safeparcel.zza.zzm(parcel, zzcq);
                    break;
                case 17:
                    f2 = com.google.android.gms.common.internal.safeparcel.zza.zzm(parcel, zzcq);
                    break;
                case 18:
                    latLngBounds = (LatLngBounds) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, LatLngBounds.CREATOR);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new GoogleMapOptions(i, b, b2, i2, cameraPosition, b3, b4, b5, b6, b7, b8, b9, b10, b11, f, f2, latLngBounds);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzwh */
    public GoogleMapOptions[] newArray(int i) {
        return new GoogleMapOptions[i];
    }
}
