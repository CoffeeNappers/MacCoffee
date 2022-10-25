package com.google.android.gms.auth.api.credentials;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class zza implements Parcelable.Creator<Credential> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(Credential credential, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, credential.getId(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, credential.getName(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, (Parcelable) credential.getProfilePictureUri(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 4, credential.getIdTokens(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, credential.getPassword(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, credential.getAccountType(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, credential.getGeneratedPassword(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, credential.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, credential.zzaif(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 9, credential.getGivenName(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 10, credential.getFamilyName(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzaj */
    public Credential createFromParcel(Parcel parcel) {
        String str = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        String str6 = null;
        ArrayList arrayList = null;
        Uri uri = null;
        String str7 = null;
        String str8 = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    str8 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 2:
                    str7 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 3:
                    uri = (Uri) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, Uri.CREATOR);
                    break;
                case 4:
                    arrayList = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq, IdToken.CREATOR);
                    break;
                case 5:
                    str6 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 6:
                    str5 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 7:
                    str4 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 8:
                    str3 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 9:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 10:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
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
        return new Credential(i, str8, str7, uri, arrayList, str6, str5, str4, str3, str2, str);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzcx */
    public Credential[] newArray(int i) {
        return new Credential[i];
    }
}
