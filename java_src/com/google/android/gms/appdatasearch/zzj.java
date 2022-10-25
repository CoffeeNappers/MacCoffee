package com.google.android.gms.appdatasearch;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzj implements Parcelable.Creator<UsageInfo> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(UsageInfo usageInfo, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, (Parcelable) usageInfo.gR, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, usageInfo.gS);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 3, usageInfo.gT);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, usageInfo.zzbcj, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, (Parcelable) usageInfo.gU, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, usageInfo.gV);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 7, usageInfo.gW);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, usageInfo.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 8, usageInfo.gX);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzae */
    public UsageInfo createFromParcel(Parcel parcel) {
        DocumentContents documentContents = null;
        int i = 0;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        long j = 0;
        int i2 = -1;
        boolean z = false;
        String str = null;
        int i3 = 0;
        DocumentId documentId = null;
        int i4 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    documentId = (DocumentId) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, DocumentId.CREATOR);
                    break;
                case 2:
                    j = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 3:
                    i3 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 4:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 5:
                    documentContents = (DocumentContents) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, DocumentContents.CREATOR);
                    break;
                case 6:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 7:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 8:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 1000:
                    i4 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new UsageInfo(i4, documentId, j, i3, str, documentContents, z, i2, i);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzcs */
    public UsageInfo[] newArray(int i) {
        return new UsageInfo[i];
    }
}
