package com.google.android.gms.auth.api.signin;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzc implements Parcelable.Creator<SignInAccount> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(SignInAccount signInAccount, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, signInAccount.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, signInAccount.jg, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, (Parcelable) signInAccount.zzaiz(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, signInAccount.ck, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzax */
    public SignInAccount createFromParcel(Parcel parcel) {
        String zzq;
        GoogleSignInAccount googleSignInAccount;
        String str;
        int i;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i2 = 0;
        String str2 = "";
        GoogleSignInAccount googleSignInAccount2 = null;
        String str3 = "";
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    String str4 = str3;
                    googleSignInAccount = googleSignInAccount2;
                    str = str2;
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    zzq = str4;
                    break;
                case 2:
                case 3:
                case 5:
                case 6:
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    zzq = str3;
                    googleSignInAccount = googleSignInAccount2;
                    str = str2;
                    i = i2;
                    break;
                case 4:
                    i = i2;
                    GoogleSignInAccount googleSignInAccount3 = googleSignInAccount2;
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    zzq = str3;
                    googleSignInAccount = googleSignInAccount3;
                    break;
                case 7:
                    str = str2;
                    i = i2;
                    String str5 = str3;
                    googleSignInAccount = (GoogleSignInAccount) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, GoogleSignInAccount.CREATOR);
                    zzq = str5;
                    break;
                case 8:
                    zzq = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    googleSignInAccount = googleSignInAccount2;
                    str = str2;
                    i = i2;
                    break;
            }
            i2 = i;
            str2 = str;
            googleSignInAccount2 = googleSignInAccount;
            str3 = zzq;
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new SignInAccount(i2, str2, googleSignInAccount2, str3);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzdl */
    public SignInAccount[] newArray(int i) {
        return new SignInAccount[i];
    }
}
