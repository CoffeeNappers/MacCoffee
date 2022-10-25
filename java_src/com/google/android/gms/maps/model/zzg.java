package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzg implements Parcelable.Creator<MarkerOptions> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(MarkerOptions markerOptions, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, markerOptions.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, (Parcelable) markerOptions.getPosition(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, markerOptions.getTitle(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, markerOptions.getSnippet(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, markerOptions.zzbsz(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, markerOptions.getAnchorU());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, markerOptions.getAnchorV());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, markerOptions.isDraggable());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 9, markerOptions.isVisible());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 10, markerOptions.isFlat());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 11, markerOptions.getRotation());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 12, markerOptions.getInfoWindowAnchorU());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 13, markerOptions.getInfoWindowAnchorV());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 14, markerOptions.getAlpha());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 15, markerOptions.getZIndex());
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzpl */
    public MarkerOptions createFromParcel(Parcel parcel) {
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        LatLng latLng = null;
        String str = null;
        String str2 = null;
        IBinder iBinder = null;
        float f = 0.0f;
        float f2 = 0.0f;
        boolean z = false;
        boolean z2 = false;
        boolean z3 = false;
        float f3 = 0.0f;
        float f4 = 0.5f;
        float f5 = 0.0f;
        float f6 = 1.0f;
        float f7 = 0.0f;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    latLng = (LatLng) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, LatLng.CREATOR);
                    break;
                case 3:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 4:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 5:
                    iBinder = com.google.android.gms.common.internal.safeparcel.zza.zzr(parcel, zzcq);
                    break;
                case 6:
                    f = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 7:
                    f2 = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 8:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 9:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 10:
                    z3 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 11:
                    f3 = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 12:
                    f4 = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 13:
                    f5 = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 14:
                    f6 = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 15:
                    f7 = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new MarkerOptions(i, latLng, str, str2, iBinder, f, f2, z, z2, z3, f3, f4, f5, f6, f7);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzwp */
    public MarkerOptions[] newArray(int i) {
        return new MarkerOptions[i];
    }
}
