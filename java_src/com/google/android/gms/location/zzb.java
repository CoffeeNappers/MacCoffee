package com.google.android.gms.location;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class zzb implements Parcelable.Creator<ActivityRecognitionResult> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(ActivityRecognitionResult activityRecognitionResult, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, activityRecognitionResult.ajD, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, activityRecognitionResult.ajE);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, activityRecognitionResult.ajF);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 4, activityRecognitionResult.ajG);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, activityRecognitionResult.extras, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, activityRecognitionResult.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zznp */
    public ActivityRecognitionResult createFromParcel(Parcel parcel) {
        long j = 0;
        Bundle bundle = null;
        int i = 0;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        long j2 = 0;
        ArrayList arrayList = null;
        int i2 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    arrayList = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq, DetectedActivity.CREATOR);
                    break;
                case 2:
                    j2 = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 3:
                    j = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 4:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 5:
                    bundle = com.google.android.gms.common.internal.safeparcel.zza.zzs(parcel, zzcq);
                    break;
                case 1000:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new ActivityRecognitionResult(i2, arrayList, j2, j, i, bundle);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzug */
    public ActivityRecognitionResult[] newArray(int i) {
        return new ActivityRecognitionResult[i];
    }
}
