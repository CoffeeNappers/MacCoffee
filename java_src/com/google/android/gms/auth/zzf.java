package com.google.android.gms.auth;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class zzf implements Parcelable.Creator<TokenData> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(TokenData tokenData, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, tokenData.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, tokenData.getToken(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, tokenData.zzahy(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, tokenData.zzahz());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, tokenData.zzaia());
        com.google.android.gms.common.internal.safeparcel.zzb.zzb(parcel, 6, tokenData.zzaib(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzai */
    public TokenData createFromParcel(Parcel parcel) {
        ArrayList<String> arrayList = null;
        boolean z = false;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        boolean z2 = false;
        Long l = null;
        String str = null;
        int i = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 3:
                    l = com.google.android.gms.common.internal.safeparcel.zza.zzj(parcel, zzcq);
                    break;
                case 4:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 5:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 6:
                    arrayList = com.google.android.gms.common.internal.safeparcel.zza.zzae(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new TokenData(i, str, l, z2, z, arrayList);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzcw */
    public TokenData[] newArray(int i) {
        return new TokenData[i];
    }
}
