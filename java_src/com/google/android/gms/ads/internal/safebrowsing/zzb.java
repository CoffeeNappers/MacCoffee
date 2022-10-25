package com.google.android.gms.ads.internal.safebrowsing;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class zzb implements Parcelable.Creator<SafeBrowsingConfigParcel> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(SafeBrowsingConfigParcel safeBrowsingConfigParcel, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, safeBrowsingConfigParcel.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, safeBrowsingConfigParcel.zzcsd, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, safeBrowsingConfigParcel.zzcse, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, safeBrowsingConfigParcel.zzcsf);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, safeBrowsingConfigParcel.zzcsg);
        com.google.android.gms.common.internal.safeparcel.zzb.zzb(parcel, 6, safeBrowsingConfigParcel.zzcsh, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzbe */
    public SafeBrowsingConfigParcel[] newArray(int i) {
        return new SafeBrowsingConfigParcel[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzu */
    public SafeBrowsingConfigParcel createFromParcel(Parcel parcel) {
        ArrayList<String> arrayList = null;
        boolean z = false;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        boolean z2 = false;
        String str = null;
        String str2 = null;
        int i = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 3:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 4:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 5:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 6:
                    arrayList = com.google.android.gms.common.internal.safeparcel.zza.zzae(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new SafeBrowsingConfigParcel(i, str2, str, z2, z, arrayList);
    }
}
