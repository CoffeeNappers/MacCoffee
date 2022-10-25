package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.WorkSource;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zza implements Parcelable.Creator<ActivityRecognitionRequest> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(ActivityRecognitionRequest activityRecognitionRequest, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, activityRecognitionRequest.getIntervalMillis());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, activityRecognitionRequest.zzbps());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, (Parcelable) activityRecognitionRequest.zzbpt(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, activityRecognitionRequest.getTag(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, activityRecognitionRequest.zzbpu(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, activityRecognitionRequest.zzbpv());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, activityRecognitionRequest.getAccountName(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, activityRecognitionRequest.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, activityRecognitionRequest.zzbpw());
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzno */
    public ActivityRecognitionRequest createFromParcel(Parcel parcel) {
        long j = 0;
        boolean z = false;
        String str = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int[] iArr = null;
        String str2 = null;
        WorkSource workSource = null;
        boolean z2 = false;
        long j2 = 0;
        int i = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    j2 = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 2:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 3:
                    workSource = (WorkSource) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, WorkSource.CREATOR);
                    break;
                case 4:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 5:
                    iArr = com.google.android.gms.common.internal.safeparcel.zza.zzw(parcel, zzcq);
                    break;
                case 6:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 7:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 8:
                    j = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
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
        return new ActivityRecognitionRequest(i, j2, z2, workSource, str2, iArr, z, str, j);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzuf */
    public ActivityRecognitionRequest[] newArray(int i) {
        return new ActivityRecognitionRequest[i];
    }
}
