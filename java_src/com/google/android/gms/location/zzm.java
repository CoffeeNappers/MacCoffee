package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class zzm implements Parcelable.Creator<LocationSettingsRequest> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(LocationSettingsRequest locationSettingsRequest, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, locationSettingsRequest.zzbgh(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, locationSettingsRequest.zzbqc());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, locationSettingsRequest.zzbqd());
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, locationSettingsRequest.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzny */
    public LocationSettingsRequest createFromParcel(Parcel parcel) {
        boolean z = false;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        ArrayList arrayList = null;
        boolean z2 = false;
        int i = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    arrayList = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq, LocationRequest.CREATOR);
                    break;
                case 2:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 3:
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
        return new LocationSettingsRequest(i, arrayList, z2, z);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzuu */
    public LocationSettingsRequest[] newArray(int i) {
        return new LocationSettingsRequest[i];
    }
}
