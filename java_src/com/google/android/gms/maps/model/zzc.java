package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzc implements Parcelable.Creator<GroundOverlayOptions> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(GroundOverlayOptions groundOverlayOptions, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, groundOverlayOptions.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, groundOverlayOptions.zzbsx(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, (Parcelable) groundOverlayOptions.getLocation(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, groundOverlayOptions.getWidth());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, groundOverlayOptions.getHeight());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, (Parcelable) groundOverlayOptions.getBounds(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, groundOverlayOptions.getBearing());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, groundOverlayOptions.getZIndex());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 9, groundOverlayOptions.isVisible());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 10, groundOverlayOptions.getTransparency());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 11, groundOverlayOptions.getAnchorU());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 12, groundOverlayOptions.getAnchorV());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 13, groundOverlayOptions.isClickable());
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzph */
    public GroundOverlayOptions createFromParcel(Parcel parcel) {
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        IBinder iBinder = null;
        LatLng latLng = null;
        float f = 0.0f;
        float f2 = 0.0f;
        LatLngBounds latLngBounds = null;
        float f3 = 0.0f;
        float f4 = 0.0f;
        boolean z = false;
        float f5 = 0.0f;
        float f6 = 0.0f;
        float f7 = 0.0f;
        boolean z2 = false;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    iBinder = com.google.android.gms.common.internal.safeparcel.zza.zzr(parcel, zzcq);
                    break;
                case 3:
                    latLng = (LatLng) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, LatLng.CREATOR);
                    break;
                case 4:
                    f = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 5:
                    f2 = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 6:
                    latLngBounds = (LatLngBounds) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, LatLngBounds.CREATOR);
                    break;
                case 7:
                    f3 = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 8:
                    f4 = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 9:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 10:
                    f5 = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 11:
                    f6 = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 12:
                    f7 = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 13:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new GroundOverlayOptions(i, iBinder, latLng, f, f2, latLngBounds, f3, f4, z, f5, f6, f7, z2);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzwl */
    public GroundOverlayOptions[] newArray(int i) {
        return new GroundOverlayOptions[i];
    }
}
