package com.google.android.gms.ads.internal.client;

import android.location.Location;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class zzg implements Parcelable.Creator<AdRequestParcel> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(AdRequestParcel adRequestParcel, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, adRequestParcel.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, adRequestParcel.zzayl);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, adRequestParcel.extras, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 4, adRequestParcel.zzaym);
        com.google.android.gms.common.internal.safeparcel.zzb.zzb(parcel, 5, adRequestParcel.zzayn, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, adRequestParcel.zzayo);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 7, adRequestParcel.zzayp);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, adRequestParcel.zzayq);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 9, adRequestParcel.zzayr, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 10, (Parcelable) adRequestParcel.zzays, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 11, (Parcelable) adRequestParcel.zzayt, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 12, adRequestParcel.zzayu, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 13, adRequestParcel.zzayv, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 14, adRequestParcel.zzayw, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzb(parcel, 15, adRequestParcel.zzayx, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 16, adRequestParcel.zzayy, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 17, adRequestParcel.zzayz, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 18, adRequestParcel.zzaza);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zze */
    public AdRequestParcel createFromParcel(Parcel parcel) {
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        long j = 0;
        Bundle bundle = null;
        int i2 = 0;
        ArrayList<String> arrayList = null;
        boolean z = false;
        int i3 = 0;
        boolean z2 = false;
        String str = null;
        SearchAdRequestParcel searchAdRequestParcel = null;
        Location location = null;
        String str2 = null;
        Bundle bundle2 = null;
        Bundle bundle3 = null;
        ArrayList<String> arrayList2 = null;
        String str3 = null;
        String str4 = null;
        boolean z3 = false;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    j = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 3:
                    bundle = com.google.android.gms.common.internal.safeparcel.zza.zzs(parcel, zzcq);
                    break;
                case 4:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 5:
                    arrayList = com.google.android.gms.common.internal.safeparcel.zza.zzae(parcel, zzcq);
                    break;
                case 6:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 7:
                    i3 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 8:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 9:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 10:
                    searchAdRequestParcel = (SearchAdRequestParcel) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, SearchAdRequestParcel.CREATOR);
                    break;
                case 11:
                    location = (Location) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, Location.CREATOR);
                    break;
                case 12:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 13:
                    bundle2 = com.google.android.gms.common.internal.safeparcel.zza.zzs(parcel, zzcq);
                    break;
                case 14:
                    bundle3 = com.google.android.gms.common.internal.safeparcel.zza.zzs(parcel, zzcq);
                    break;
                case 15:
                    arrayList2 = com.google.android.gms.common.internal.safeparcel.zza.zzae(parcel, zzcq);
                    break;
                case 16:
                    str3 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 17:
                    str4 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 18:
                    z3 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new AdRequestParcel(i, j, bundle, i2, arrayList, z, i3, z2, str, searchAdRequestParcel, location, str2, bundle2, bundle3, arrayList2, str3, str4, z3);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzv */
    public AdRequestParcel[] newArray(int i) {
        return new AdRequestParcel[i];
    }
}
