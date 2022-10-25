package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class zzj implements Parcelable.Creator<PolylineOptions> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(PolylineOptions polylineOptions, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, polylineOptions.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 2, polylineOptions.getPoints(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, polylineOptions.getWidth());
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 4, polylineOptions.getColor());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, polylineOptions.getZIndex());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, polylineOptions.isVisible());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, polylineOptions.isGeodesic());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, polylineOptions.isClickable());
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzpo */
    public PolylineOptions createFromParcel(Parcel parcel) {
        float f = 0.0f;
        boolean z = false;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        ArrayList arrayList = null;
        boolean z2 = false;
        boolean z3 = false;
        int i = 0;
        float f2 = 0.0f;
        int i2 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    arrayList = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq, LatLng.CREATOR);
                    break;
                case 3:
                    f2 = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 4:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 5:
                    f = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 6:
                    z3 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 7:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 8:
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
        return new PolylineOptions(i2, arrayList, f2, i, f, z3, z2, z);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzws */
    public PolylineOptions[] newArray(int i) {
        return new PolylineOptions[i];
    }
}
