package com.google.android.gms.appdatasearch;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.appdatasearch.GetRecentContextCall;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.zza;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class zzg implements Parcelable.Creator<GetRecentContextCall.Response> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(GetRecentContextCall.Response response, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, (Parcelable) response.gy, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 2, response.gz, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, response.gA, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, response.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzac */
    public GetRecentContextCall.Response createFromParcel(Parcel parcel) {
        ArrayList arrayList;
        Status status;
        int zzg;
        String[] strArr;
        String[] strArr2 = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        ArrayList arrayList2 = null;
        Status status2 = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    zzg = i;
                    ArrayList arrayList3 = arrayList2;
                    status = (Status) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, Status.CREATOR);
                    strArr = strArr2;
                    arrayList = arrayList3;
                    break;
                case 2:
                    status = status2;
                    zzg = i;
                    String[] strArr3 = strArr2;
                    arrayList = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq, UsageInfo.CREATOR);
                    strArr = strArr3;
                    break;
                case 3:
                    strArr = com.google.android.gms.common.internal.safeparcel.zza.zzac(parcel, zzcq);
                    arrayList = arrayList2;
                    status = status2;
                    zzg = i;
                    break;
                case 1000:
                    String[] strArr4 = strArr2;
                    arrayList = arrayList2;
                    status = status2;
                    zzg = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    strArr = strArr4;
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    strArr = strArr2;
                    arrayList = arrayList2;
                    status = status2;
                    zzg = i;
                    break;
            }
            i = zzg;
            status2 = status;
            arrayList2 = arrayList;
            strArr2 = strArr;
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new GetRecentContextCall.Response(i, status2, arrayList2, strArr2);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzcm */
    public GetRecentContextCall.Response[] newArray(int i) {
        return new GetRecentContextCall.Response[i];
    }
}
