package com.google.android.gms.common.server.response;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.server.response.FieldMappingDictionary;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class zzd implements Parcelable.Creator<FieldMappingDictionary.Entry> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(FieldMappingDictionary.Entry entry, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, entry.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, entry.className, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 3, entry.Ft, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzda */
    public FieldMappingDictionary.Entry createFromParcel(Parcel parcel) {
        ArrayList arrayList = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        String str = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 3:
                    arrayList = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq, FieldMappingDictionary.FieldMapPair.CREATOR);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new FieldMappingDictionary.Entry(i, str, arrayList);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzhd */
    public FieldMappingDictionary.Entry[] newArray(int i) {
        return new FieldMappingDictionary.Entry[i];
    }
}
