package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzj implements Parcelable.Creator<LocationAvailability> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(LocationAvailability locationAvailability, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, locationAvailability.aki);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 2, locationAvailability.akj);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, locationAvailability.akk);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 4, locationAvailability.akl);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, locationAvailability.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zznv */
    public LocationAvailability createFromParcel(Parcel parcel) {
        int i = 1;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i2 = 0;
        int i3 = 1000;
        long j = 0;
        int i4 = 1;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i4 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 3:
                    j = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 4:
                    i3 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
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
        return new LocationAvailability(i2, i3, i4, i, j);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzup */
    public LocationAvailability[] newArray(int i) {
        return new LocationAvailability[i];
    }
}
