package com.google.android.gms.location.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.location.LocationRequest;
import java.util.List;
/* loaded from: classes2.dex */
public class zzm implements Parcelable.Creator<LocationRequestInternal> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(LocationRequestInternal locationRequestInternal, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, (Parcelable) locationRequestInternal.VR, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, locationRequestInternal.ajy);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 5, locationRequestInternal.ajK, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, locationRequestInternal.mTag, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, locationRequestInternal.ald);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, locationRequestInternal.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, locationRequestInternal.ale);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzod */
    public LocationRequestInternal createFromParcel(Parcel parcel) {
        String str = null;
        boolean z = false;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        boolean z2 = true;
        List<ClientIdentity> list = LocationRequestInternal.alc;
        boolean z3 = false;
        LocationRequest locationRequest = null;
        int i = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    locationRequest = (LocationRequest) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, LocationRequest.CREATOR);
                    break;
                case 4:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 5:
                    list = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq, ClientIdentity.CREATOR);
                    break;
                case 6:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 7:
                    z3 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 8:
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
        return new LocationRequestInternal(i, locationRequest, z2, list, str, z3, z);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzvc */
    public LocationRequestInternal[] newArray(int i) {
        return new LocationRequestInternal[i];
    }
}
