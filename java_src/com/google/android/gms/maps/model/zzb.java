package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzb implements Parcelable.Creator<CircleOptions> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(CircleOptions circleOptions, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, circleOptions.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, (Parcelable) circleOptions.getCenter(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, circleOptions.getRadius());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, circleOptions.getStrokeWidth());
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 5, circleOptions.getStrokeColor());
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 6, circleOptions.getFillColor());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, circleOptions.getZIndex());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, circleOptions.isVisible());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 9, circleOptions.isClickable());
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzpg */
    public CircleOptions createFromParcel(Parcel parcel) {
        float f = 0.0f;
        boolean z = false;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        LatLng latLng = null;
        double d = 0.0d;
        boolean z2 = false;
        int i = 0;
        int i2 = 0;
        float f2 = 0.0f;
        int i3 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i3 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    latLng = (LatLng) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, LatLng.CREATOR);
                    break;
                case 3:
                    d = com.google.android.gms.common.internal.safeparcel.zza.zzn(parcel, zzcq);
                    break;
                case 4:
                    f2 = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 5:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 6:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 7:
                    f = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 8:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 9:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new CircleOptions(i3, latLng, d, f2, i2, i, f, z2, z);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzwk */
    public CircleOptions[] newArray(int i) {
        return new CircleOptions[i];
    }
}
