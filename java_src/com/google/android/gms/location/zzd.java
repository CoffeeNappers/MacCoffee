package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.location.internal.ClientIdentity;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class zzd implements Parcelable.Creator<ActivityTransitionRequest> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(ActivityTransitionRequest activityTransitionRequest, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, activityTransitionRequest.zzbpy(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, activityTransitionRequest.getTag(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 3, activityTransitionRequest.zzbpz(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, activityTransitionRequest.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zznr */
    public ActivityTransitionRequest createFromParcel(Parcel parcel) {
        ArrayList arrayList = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        String str = null;
        ArrayList arrayList2 = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    arrayList2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq, ActivityTransition.CREATOR);
                    break;
                case 2:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 3:
                    arrayList = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq, ClientIdentity.CREATOR);
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
        return new ActivityTransitionRequest(i, arrayList2, str, arrayList);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzui */
    public ActivityTransitionRequest[] newArray(int i) {
        return new ActivityTransitionRequest[i];
    }
}
