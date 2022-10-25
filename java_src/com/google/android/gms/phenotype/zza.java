package com.google.android.gms.phenotype;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zza implements Parcelable.Creator<Configuration> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(Configuration configuration, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, configuration.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 2, configuration.aAs);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, (Parcelable[]) configuration.aAt, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, configuration.aAu, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzrf */
    public Configuration createFromParcel(Parcel parcel) {
        String[] zzac;
        Flag[] flagArr;
        int i;
        int i2;
        String[] strArr = null;
        int i3 = 0;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        Flag[] flagArr2 = null;
        int i4 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    String[] strArr2 = strArr;
                    flagArr = flagArr2;
                    i = i3;
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    zzac = strArr2;
                    break;
                case 2:
                    i2 = i4;
                    Flag[] flagArr3 = flagArr2;
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    zzac = strArr;
                    flagArr = flagArr3;
                    break;
                case 3:
                    i = i3;
                    i2 = i4;
                    String[] strArr3 = strArr;
                    flagArr = (Flag[]) com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq, Flag.CREATOR);
                    zzac = strArr3;
                    break;
                case 4:
                    zzac = com.google.android.gms.common.internal.safeparcel.zza.zzac(parcel, zzcq);
                    flagArr = flagArr2;
                    i = i3;
                    i2 = i4;
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    zzac = strArr;
                    flagArr = flagArr2;
                    i = i3;
                    i2 = i4;
                    break;
            }
            i4 = i2;
            i3 = i;
            flagArr2 = flagArr;
            strArr = zzac;
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new Configuration(i4, i3, flagArr2, strArr);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzyx */
    public Configuration[] newArray(int i) {
        return new Configuration[i];
    }
}
