package com.google.android.gms.common.data;

import android.database.CursorWindow;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zze implements Parcelable.Creator<DataHolder> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(DataHolder dataHolder, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, dataHolder.zzauo(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, (Parcelable[]) dataHolder.zzaup(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 3, dataHolder.getStatusCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, dataHolder.zzaui(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, dataHolder.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzch */
    public DataHolder createFromParcel(Parcel parcel) {
        int i = 0;
        Bundle bundle = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        CursorWindow[] cursorWindowArr = null;
        String[] strArr = null;
        int i2 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    strArr = com.google.android.gms.common.internal.safeparcel.zza.zzac(parcel, zzcq);
                    break;
                case 2:
                    cursorWindowArr = (CursorWindow[]) com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq, CursorWindow.CREATOR);
                    break;
                case 3:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 4:
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
        DataHolder dataHolder = new DataHolder(i2, strArr, cursorWindowArr, i, bundle);
        dataHolder.zzaun();
        return dataHolder;
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzgd */
    public DataHolder[] newArray(int i) {
        return new DataHolder[i];
    }
}
