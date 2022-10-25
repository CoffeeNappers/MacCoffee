package com.google.android.gms.common.server;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
/* loaded from: classes2.dex */
public class zza implements Parcelable.Creator<FavaDiagnosticsEntity> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(FavaDiagnosticsEntity favaDiagnosticsEntity, Parcel parcel, int i) {
        int zzcs = zzb.zzcs(parcel);
        zzb.zzc(parcel, 1, favaDiagnosticsEntity.mVersionCode);
        zzb.zza(parcel, 2, favaDiagnosticsEntity.EY, false);
        zzb.zzc(parcel, 3, favaDiagnosticsEntity.EZ);
        zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzct */
    public FavaDiagnosticsEntity createFromParcel(Parcel parcel) {
        int i = 0;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        String str = null;
        int i2 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 3:
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
        return new FavaDiagnosticsEntity(i2, str, i);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzgw */
    public FavaDiagnosticsEntity[] newArray(int i) {
        return new FavaDiagnosticsEntity[i];
    }
}
