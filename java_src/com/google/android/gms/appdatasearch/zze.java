package com.google.android.gms.appdatasearch;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zze implements Parcelable.Creator<Feature> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(Feature feature, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, feature.id);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, feature.gs, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, feature.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzaa */
    public Feature createFromParcel(Parcel parcel) {
        int i = 0;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        Bundle bundle = null;
        int i2 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    bundle = com.google.android.gms.common.internal.safeparcel.zza.zzs(parcel, zzcq);
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
        return new Feature(i2, i, bundle);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzck */
    public Feature[] newArray(int i) {
        return new Feature[i];
    }
}
