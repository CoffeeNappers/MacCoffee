package com.google.android.gms.auth.api.credentials.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.auth.api.credentials.PasswordSpecification;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzi implements Parcelable.Creator<GeneratePasswordRequest> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(GeneratePasswordRequest generatePasswordRequest, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, (Parcelable) generatePasswordRequest.zzaid(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, generatePasswordRequest.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzaq */
    public GeneratePasswordRequest createFromParcel(Parcel parcel) {
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        PasswordSpecification passwordSpecification = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    passwordSpecification = (PasswordSpecification) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, PasswordSpecification.CREATOR);
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
        return new GeneratePasswordRequest(i, passwordSpecification);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzde */
    public GeneratePasswordRequest[] newArray(int i) {
        return new GeneratePasswordRequest[i];
    }
}
