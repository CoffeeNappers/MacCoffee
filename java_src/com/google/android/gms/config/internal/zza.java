package com.google.android.gms.config.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zza implements Parcelable.Creator<AnalyticsUserProperty> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(AnalyticsUserProperty analyticsUserProperty, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, analyticsUserProperty.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, analyticsUserProperty.getName(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, analyticsUserProperty.getValue(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzdd */
    public AnalyticsUserProperty createFromParcel(Parcel parcel) {
        String str = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        String str2 = null;
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
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new AnalyticsUserProperty(i, str2, str);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzhk */
    public AnalyticsUserProperty[] newArray(int i) {
        return new AnalyticsUserProperty[i];
    }
}
