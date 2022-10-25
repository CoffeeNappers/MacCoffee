package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzab implements Parcelable.Creator<ResolveAccountRequest> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(ResolveAccountRequest resolveAccountRequest, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, resolveAccountRequest.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, (Parcelable) resolveAccountRequest.getAccount(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 3, resolveAccountRequest.getSessionId());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, (Parcelable) resolveAccountRequest.zzawl(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzcm */
    public ResolveAccountRequest createFromParcel(Parcel parcel) {
        GoogleSignInAccount googleSignInAccount;
        int i;
        Account account;
        int i2;
        GoogleSignInAccount googleSignInAccount2 = null;
        int i3 = 0;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        Account account2 = null;
        int i4 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    GoogleSignInAccount googleSignInAccount3 = googleSignInAccount2;
                    i = i3;
                    account = account2;
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    googleSignInAccount = googleSignInAccount3;
                    break;
                case 2:
                    i2 = i4;
                    int i5 = i3;
                    account = (Account) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, Account.CREATOR);
                    googleSignInAccount = googleSignInAccount2;
                    i = i5;
                    break;
                case 3:
                    account = account2;
                    i2 = i4;
                    GoogleSignInAccount googleSignInAccount4 = googleSignInAccount2;
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    googleSignInAccount = googleSignInAccount4;
                    break;
                case 4:
                    googleSignInAccount = (GoogleSignInAccount) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, GoogleSignInAccount.CREATOR);
                    i = i3;
                    account = account2;
                    i2 = i4;
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    googleSignInAccount = googleSignInAccount2;
                    i = i3;
                    account = account2;
                    i2 = i4;
                    break;
            }
            i4 = i2;
            account2 = account;
            i3 = i;
            googleSignInAccount2 = googleSignInAccount;
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new ResolveAccountRequest(i4, account2, i3, googleSignInAccount2);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzgq */
    public ResolveAccountRequest[] newArray(int i) {
        return new ResolveAccountRequest[i];
    }
}
