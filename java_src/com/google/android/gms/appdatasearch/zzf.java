package com.google.android.gms.appdatasearch;

import android.accounts.Account;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.appdatasearch.GetRecentContextCall;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzf implements Parcelable.Creator<GetRecentContextCall.Request> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(GetRecentContextCall.Request request, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, (Parcelable) request.gt, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, request.gu);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, request.gv);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, request.gw);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, request.gx, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, request.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzab */
    public GetRecentContextCall.Request createFromParcel(Parcel parcel) {
        String str = null;
        boolean z = false;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        boolean z2 = false;
        boolean z3 = false;
        Account account = null;
        int i = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    account = (Account) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, Account.CREATOR);
                    break;
                case 2:
                    z3 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 3:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 4:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 5:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
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
        return new GetRecentContextCall.Request(i, account, z3, z2, z, str);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzcl */
    public GetRecentContextCall.Request[] newArray(int i) {
        return new GetRecentContextCall.Request[i];
    }
}
