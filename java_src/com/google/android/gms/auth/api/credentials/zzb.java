package com.google.android.gms.auth.api.credentials;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes.dex */
public class zzb implements Parcelable.Creator<CredentialPickerConfig> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(CredentialPickerConfig credentialPickerConfig, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, credentialPickerConfig.shouldShowAddAccountButton());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, credentialPickerConfig.shouldShowCancelButton());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, credentialPickerConfig.isForNewAccount());
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 4, credentialPickerConfig.zzaig());
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, credentialPickerConfig.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzak */
    public CredentialPickerConfig createFromParcel(Parcel parcel) {
        int i = 0;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        boolean z = false;
        boolean z2 = false;
        boolean z3 = false;
        int i2 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    z3 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 2:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 3:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 4:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 1000:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new CredentialPickerConfig(i2, z3, z2, z, i);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzcy */
    public CredentialPickerConfig[] newArray(int i) {
        return new CredentialPickerConfig[i];
    }
}
