package com.google.android.gms.location.internal;

import android.app.PendingIntent;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzn implements Parcelable.Creator<LocationRequestUpdateData> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(LocationRequestUpdateData locationRequestUpdateData, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, locationRequestUpdateData.alf);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, (Parcelable) locationRequestUpdateData.alg, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, locationRequestUpdateData.zzbqi(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, (Parcelable) locationRequestUpdateData.mPendingIntent, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, locationRequestUpdateData.zzbqj(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, locationRequestUpdateData.zzbqk(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, locationRequestUpdateData.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzoe */
    public LocationRequestUpdateData createFromParcel(Parcel parcel) {
        IBinder iBinder = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        int i2 = 1;
        IBinder iBinder2 = null;
        PendingIntent pendingIntent = null;
        IBinder iBinder3 = null;
        LocationRequestInternal locationRequestInternal = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    locationRequestInternal = (LocationRequestInternal) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, LocationRequestInternal.CREATOR);
                    break;
                case 3:
                    iBinder3 = com.google.android.gms.common.internal.safeparcel.zza.zzr(parcel, zzcq);
                    break;
                case 4:
                    pendingIntent = (PendingIntent) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, PendingIntent.CREATOR);
                    break;
                case 5:
                    iBinder2 = com.google.android.gms.common.internal.safeparcel.zza.zzr(parcel, zzcq);
                    break;
                case 6:
                    iBinder = com.google.android.gms.common.internal.safeparcel.zza.zzr(parcel, zzcq);
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
        return new LocationRequestUpdateData(i, i2, locationRequestInternal, iBinder3, pendingIntent, iBinder2, iBinder);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzvd */
    public LocationRequestUpdateData[] newArray(int i) {
        return new LocationRequestUpdateData[i];
    }
}
