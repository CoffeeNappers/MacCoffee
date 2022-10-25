package com.google.android.gms.appdatasearch;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzd implements Parcelable.Creator<DocumentSection> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(DocumentSection documentSection, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, documentSection.go, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, (Parcelable) documentSection.gp, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 4, documentSection.gq);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, documentSection.gr, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, documentSection.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzcj */
    public DocumentSection[] newArray(int i) {
        return new DocumentSection[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzz */
    public DocumentSection createFromParcel(Parcel parcel) {
        byte[] bArr = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        int i2 = -1;
        RegisterSectionInfo registerSectionInfo = null;
        String str = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 3:
                    registerSectionInfo = (RegisterSectionInfo) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, RegisterSectionInfo.CREATOR);
                    break;
                case 4:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 5:
                    bArr = com.google.android.gms.common.internal.safeparcel.zza.zzt(parcel, zzcq);
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
        return new DocumentSection(i, str, registerSectionInfo, i2, bArr);
    }
}
