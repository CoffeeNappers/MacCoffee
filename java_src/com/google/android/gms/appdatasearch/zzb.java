package com.google.android.gms.appdatasearch;

import android.accounts.Account;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzb implements Parcelable.Creator<DocumentContents> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(DocumentContents documentContents, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, (Parcelable[]) documentContents.gd, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, documentContents.ge, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, documentContents.gf);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, (Parcelable) documentContents.account, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, documentContents.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzch */
    public DocumentContents[] newArray(int i) {
        return new DocumentContents[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzx */
    public DocumentContents createFromParcel(Parcel parcel) {
        boolean z = false;
        Account account = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        String str = null;
        DocumentSection[] documentSectionArr = null;
        int i = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    documentSectionArr = (DocumentSection[]) com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq, DocumentSection.CREATOR);
                    break;
                case 2:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 3:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 4:
                    account = (Account) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, Account.CREATOR);
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
        return new DocumentContents(i, documentSectionArr, str, z, account);
    }
}
