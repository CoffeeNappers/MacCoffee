package com.google.android.gms.config.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.safeparcel.zza;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class zzg implements Parcelable.Creator<FetchConfigIpcRequest> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(FetchConfigIpcRequest fetchConfigIpcRequest, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, fetchConfigIpcRequest.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, fetchConfigIpcRequest.getPackageName(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, fetchConfigIpcRequest.zzazk());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, (Parcelable) fetchConfigIpcRequest.zzazl(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, fetchConfigIpcRequest.zzazm(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, fetchConfigIpcRequest.zzazn(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, fetchConfigIpcRequest.zzazo(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzb(parcel, 8, fetchConfigIpcRequest.zzazp(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 9, fetchConfigIpcRequest.zzazh());
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 10, fetchConfigIpcRequest.zzazq(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzdf */
    public FetchConfigIpcRequest createFromParcel(Parcel parcel) {
        int i = 0;
        ArrayList arrayList = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        long j = 0;
        ArrayList<String> arrayList2 = null;
        String str = null;
        String str2 = null;
        String str3 = null;
        DataHolder dataHolder = null;
        String str4 = null;
        int i2 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    str4 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 3:
                    j = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 4:
                    dataHolder = (DataHolder) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, DataHolder.CREATOR);
                    break;
                case 5:
                    str3 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 6:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 7:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 8:
                    arrayList2 = com.google.android.gms.common.internal.safeparcel.zza.zzae(parcel, zzcq);
                    break;
                case 9:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 10:
                    arrayList = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq, AnalyticsUserProperty.CREATOR);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new FetchConfigIpcRequest(i2, str4, j, dataHolder, str3, str2, str, arrayList2, i, arrayList);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzho */
    public FetchConfigIpcRequest[] newArray(int i) {
        return new FetchConfigIpcRequest[i];
    }
}
