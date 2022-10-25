package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzo implements Parcelable.Creator<LocationSettingsStates> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(LocationSettingsStates locationSettingsStates, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, locationSettingsStates.isGpsUsable());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, locationSettingsStates.isNetworkLocationUsable());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, locationSettingsStates.isBleUsable());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, locationSettingsStates.isGpsPresent());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, locationSettingsStates.isNetworkLocationPresent());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, locationSettingsStates.isBlePresent());
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, locationSettingsStates.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzoa */
    public LocationSettingsStates createFromParcel(Parcel parcel) {
        boolean z = false;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        boolean z2 = false;
        boolean z3 = false;
        boolean z4 = false;
        boolean z5 = false;
        boolean z6 = false;
        int i = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    z6 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 2:
                    z5 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 3:
                    z4 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 4:
                    z3 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 5:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 6:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
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
        return new LocationSettingsStates(i, z6, z5, z4, z3, z2, z);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzuw */
    public LocationSettingsStates[] newArray(int i) {
        return new LocationSettingsStates[i];
    }
}
