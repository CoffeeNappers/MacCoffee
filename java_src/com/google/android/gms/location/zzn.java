package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzn implements Parcelable.Creator<LocationSettingsResult> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(LocationSettingsResult locationSettingsResult, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, (Parcelable) locationSettingsResult.getStatus(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, (Parcelable) locationSettingsResult.getLocationSettingsStates(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, locationSettingsResult.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zznz */
    public LocationSettingsResult createFromParcel(Parcel parcel) {
        Status status;
        int zzg;
        LocationSettingsStates locationSettingsStates;
        LocationSettingsStates locationSettingsStates2 = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        Status status2 = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    Status status3 = (Status) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, Status.CREATOR);
                    zzg = i;
                    locationSettingsStates = locationSettingsStates2;
                    status = status3;
                    break;
                case 2:
                    locationSettingsStates = (LocationSettingsStates) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, LocationSettingsStates.CREATOR);
                    status = status2;
                    zzg = i;
                    break;
                case 1000:
                    LocationSettingsStates locationSettingsStates3 = locationSettingsStates2;
                    status = status2;
                    zzg = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    locationSettingsStates = locationSettingsStates3;
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    locationSettingsStates = locationSettingsStates2;
                    status = status2;
                    zzg = i;
                    break;
            }
            i = zzg;
            status2 = status;
            locationSettingsStates2 = locationSettingsStates;
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new LocationSettingsResult(i, status2, locationSettingsStates2);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzuv */
    public LocationSettingsResult[] newArray(int i) {
        return new LocationSettingsResult[i];
    }
}
