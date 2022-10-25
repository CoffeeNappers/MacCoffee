package com.google.firebase.appindexing.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzk implements Parcelable.Creator<UpdateTagsRequest> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(UpdateTagsRequest updateTagsRequest, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, updateTagsRequest.getUrl(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, updateTagsRequest.zzcor(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, updateTagsRequest.zzcos(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, updateTagsRequest.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzaff */
    public UpdateTagsRequest[] newArray(int i) {
        return new UpdateTagsRequest[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzwf */
    public UpdateTagsRequest createFromParcel(Parcel parcel) {
        String[] strArr = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        String[] strArr2 = null;
        String str = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 2:
                    strArr2 = com.google.android.gms.common.internal.safeparcel.zza.zzac(parcel, zzcq);
                    break;
                case 3:
                    strArr = com.google.android.gms.common.internal.safeparcel.zza.zzac(parcel, zzcq);
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
        return new UpdateTagsRequest(i, str, strArr2, strArr);
    }
}
