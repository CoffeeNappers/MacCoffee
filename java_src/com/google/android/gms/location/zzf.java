package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.location.internal.ParcelableGeofence;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class zzf implements Parcelable.Creator<GeofencingRequest> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(GeofencingRequest geofencingRequest, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, geofencingRequest.zzbqa(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 2, geofencingRequest.getInitialTrigger());
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, geofencingRequest.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zznt */
    public GeofencingRequest createFromParcel(Parcel parcel) {
        int i = 0;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        ArrayList arrayList = null;
        int i2 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    arrayList = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq, ParcelableGeofence.CREATOR);
                    break;
                case 2:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 1000:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new GeofencingRequest(i2, arrayList, i);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzun */
    public GeofencingRequest[] newArray(int i) {
        return new GeofencingRequest[i];
    }
}
