package com.google.android.gms.search;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
/* loaded from: classes2.dex */
public class zza implements Parcelable.Creator<GoogleNowAuthState> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(GoogleNowAuthState googleNowAuthState, Parcel parcel, int i) {
        int zzcs = zzb.zzcs(parcel);
        zzb.zza(parcel, 1, googleNowAuthState.getAuthCode(), false);
        zzb.zza(parcel, 2, googleNowAuthState.getAccessToken(), false);
        zzb.zza(parcel, 3, googleNowAuthState.getNextAllowedTimeMillis());
        zzb.zzc(parcel, 1000, googleNowAuthState.mVersionCode);
        zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzry */
    public GoogleNowAuthState createFromParcel(Parcel parcel) {
        String str = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        long j = 0;
        String str2 = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 2:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 3:
                    j = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
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
        return new GoogleNowAuthState(i, str2, str, j);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzzs */
    public GoogleNowAuthState[] newArray(int i) {
        return new GoogleNowAuthState[i];
    }
}
