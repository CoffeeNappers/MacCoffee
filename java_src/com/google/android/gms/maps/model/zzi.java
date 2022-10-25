package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class zzi implements Parcelable.Creator<PolygonOptions> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(PolygonOptions polygonOptions, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, polygonOptions.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 2, polygonOptions.getPoints(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzd(parcel, 3, polygonOptions.zzbta(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, polygonOptions.getStrokeWidth());
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 5, polygonOptions.getStrokeColor());
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 6, polygonOptions.getFillColor());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, polygonOptions.getZIndex());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, polygonOptions.isVisible());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 9, polygonOptions.isGeodesic());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 10, polygonOptions.isClickable());
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzpn */
    public PolygonOptions createFromParcel(Parcel parcel) {
        float f = 0.0f;
        boolean z = false;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        ArrayList arrayList = null;
        ArrayList arrayList2 = new ArrayList();
        boolean z2 = false;
        boolean z3 = false;
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
                    arrayList = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq, LatLng.CREATOR);
                    break;
                case 3:
                    com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, arrayList2, getClass().getClassLoader());
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
                    z3 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 9:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 10:
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
        return new PolygonOptions(i3, arrayList, arrayList2, f2, i2, i, f, z3, z2, z);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzwr */
    public PolygonOptions[] newArray(int i) {
        return new PolygonOptions[i];
    }
}
