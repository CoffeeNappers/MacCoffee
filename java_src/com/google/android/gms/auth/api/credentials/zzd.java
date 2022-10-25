package com.google.android.gms.auth.api.credentials;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzd implements Parcelable.Creator<HintRequest> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(HintRequest hintRequest, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, (Parcelable) hintRequest.getHintPickerConfig(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, hintRequest.isEmailAddressIdentifierSupported());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, hintRequest.zzaih());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, hintRequest.getAccountTypes(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, hintRequest.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzam */
    public HintRequest createFromParcel(Parcel parcel) {
        String[] strArr = null;
        boolean z = false;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        boolean z2 = false;
        CredentialPickerConfig credentialPickerConfig = null;
        int i = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    credentialPickerConfig = (CredentialPickerConfig) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, CredentialPickerConfig.CREATOR);
                    break;
                case 2:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 3:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 4:
                    strArr = com.google.android.gms.common.internal.safeparcel.zza.zzac(parcel, zzcq);
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
        return new HintRequest(i, credentialPickerConfig, z2, z, strArr);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzda */
    public HintRequest[] newArray(int i) {
        return new HintRequest[i];
    }
}
