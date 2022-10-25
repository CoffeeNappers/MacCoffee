package com.google.android.gms.auth;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zza implements Parcelable.Creator<AccountChangeEvent> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(AccountChangeEvent accountChangeEvent, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, accountChangeEvent.mVersion);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, accountChangeEvent.hx);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, accountChangeEvent.hy, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 4, accountChangeEvent.hz);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 5, accountChangeEvent.hA);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, accountChangeEvent.hB, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzaf */
    public AccountChangeEvent createFromParcel(Parcel parcel) {
        String str = null;
        int i = 0;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        long j = 0;
        int i2 = 0;
        String str2 = null;
        int i3 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i3 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    j = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 3:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 4:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 5:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 6:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new AccountChangeEvent(i3, j, str2, i2, i, str);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzct */
    public AccountChangeEvent[] newArray(int i) {
        return new AccountChangeEvent[i];
    }
}
