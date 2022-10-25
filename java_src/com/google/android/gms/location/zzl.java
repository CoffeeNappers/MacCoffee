package com.google.android.gms.location;

import android.location.Location;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import java.util.List;
/* loaded from: classes2.dex */
public class zzl implements Parcelable.Creator<LocationResult> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(LocationResult locationResult, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, locationResult.getLocations(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, locationResult.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zznx */
    public LocationResult createFromParcel(Parcel parcel) {
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        List<Location> list = LocationResult.akr;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    list = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq, Location.CREATOR);
                    break;
                case 1000:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new LocationResult(i, list);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzut */
    public LocationResult[] newArray(int i) {
        return new LocationResult[i];
    }
}
