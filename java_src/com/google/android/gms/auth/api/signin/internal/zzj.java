package com.google.android.gms.auth.api.signin.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzj implements Parcelable.Creator<SignInConfiguration> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(SignInConfiguration signInConfiguration, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, signInConfiguration.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, signInConfiguration.zzajj(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, (Parcelable) signInConfiguration.zzajk(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzay */
    public SignInConfiguration createFromParcel(Parcel parcel) {
        GoogleSignInOptions googleSignInOptions = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        String str = null;
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
                case 4:
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
                case 5:
                    googleSignInOptions = (GoogleSignInOptions) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, GoogleSignInOptions.CREATOR);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new SignInConfiguration(i, str, googleSignInOptions);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzdm */
    public SignInConfiguration[] newArray(int i) {
        return new SignInConfiguration[i];
    }
}
