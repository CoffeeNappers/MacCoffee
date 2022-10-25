package com.google.android.gms.auth.api.credentials;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzc implements Parcelable.Creator<CredentialRequest> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(CredentialRequest credentialRequest, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, credentialRequest.isPasswordLoginSupported());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, credentialRequest.getAccountTypes(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, (Parcelable) credentialRequest.getCredentialPickerConfig(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, (Parcelable) credentialRequest.getCredentialHintPickerConfig(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, credentialRequest.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzal */
    public CredentialRequest createFromParcel(Parcel parcel) {
        boolean z = false;
        CredentialPickerConfig credentialPickerConfig = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        CredentialPickerConfig credentialPickerConfig2 = null;
        String[] strArr = null;
        int i = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 2:
                    strArr = com.google.android.gms.common.internal.safeparcel.zza.zzac(parcel, zzcq);
                    break;
                case 3:
                    credentialPickerConfig2 = (CredentialPickerConfig) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, CredentialPickerConfig.CREATOR);
                    break;
                case 4:
                    credentialPickerConfig = (CredentialPickerConfig) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, CredentialPickerConfig.CREATOR);
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
        return new CredentialRequest(i, z, strArr, credentialPickerConfig2, credentialPickerConfig);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzcz */
    public CredentialRequest[] newArray(int i) {
        return new CredentialRequest[i];
    }
}
