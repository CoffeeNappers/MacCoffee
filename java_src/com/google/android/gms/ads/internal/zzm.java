package com.google.android.gms.ads.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes.dex */
public class zzm implements Parcelable.Creator<InterstitialAdParameterParcel> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(InterstitialAdParameterParcel interstitialAdParameterParcel, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, interstitialAdParameterParcel.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, interstitialAdParameterParcel.zzaok);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, interstitialAdParameterParcel.zzaol);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, interstitialAdParameterParcel.zzaom, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, interstitialAdParameterParcel.zzaon);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, interstitialAdParameterParcel.zzaoo);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 7, interstitialAdParameterParcel.zzaop);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzb */
    public InterstitialAdParameterParcel createFromParcel(Parcel parcel) {
        int i = 0;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        String str = null;
        float f = 0.0f;
        boolean z = false;
        boolean z2 = false;
        boolean z3 = false;
        int i2 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    z3 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 3:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 4:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 5:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 6:
                    f = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 7:
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
        return new InterstitialAdParameterParcel(i2, z3, z2, str, z, f, i);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzi */
    public InterstitialAdParameterParcel[] newArray(int i) {
        return new InterstitialAdParameterParcel[i];
    }
}
