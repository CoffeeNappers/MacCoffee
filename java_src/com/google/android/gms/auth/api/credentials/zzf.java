package com.google.android.gms.auth.api.credentials;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class zzf implements Parcelable.Creator<PasswordSpecification> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(PasswordSpecification passwordSpecification, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, passwordSpecification.iI, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzb(parcel, 2, passwordSpecification.iJ, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, passwordSpecification.iK, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 4, passwordSpecification.iL);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 5, passwordSpecification.iM);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, passwordSpecification.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzao */
    public PasswordSpecification createFromParcel(Parcel parcel) {
        ArrayList<Integer> arrayList = null;
        int i = 0;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i2 = 0;
        ArrayList<String> arrayList2 = null;
        String str = null;
        int i3 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 2:
                    arrayList2 = com.google.android.gms.common.internal.safeparcel.zza.zzae(parcel, zzcq);
                    break;
                case 3:
                    arrayList = com.google.android.gms.common.internal.safeparcel.zza.zzad(parcel, zzcq);
                    break;
                case 4:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 5:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 1000:
                    i3 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new PasswordSpecification(i3, str, arrayList2, arrayList, i2, i);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzdc */
    public PasswordSpecification[] newArray(int i) {
        return new PasswordSpecification[i];
    }
}
