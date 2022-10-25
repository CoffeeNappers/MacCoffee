package com.google.android.gms.ads.internal.formats;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.ads.internal.client.VideoOptionsParcel;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes.dex */
public class zzk implements Parcelable.Creator<NativeAdOptionsParcel> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(NativeAdOptionsParcel nativeAdOptionsParcel, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, nativeAdOptionsParcel.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, nativeAdOptionsParcel.zzboj);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 3, nativeAdOptionsParcel.zzbok);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, nativeAdOptionsParcel.zzbol);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 5, nativeAdOptionsParcel.zzbom);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, (Parcelable) nativeAdOptionsParcel.zzbon, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzac */
    public NativeAdOptionsParcel[] newArray(int i) {
        return new NativeAdOptionsParcel[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzi */
    public NativeAdOptionsParcel createFromParcel(Parcel parcel) {
        int i = 0;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        VideoOptionsParcel videoOptionsParcel = null;
        boolean z = false;
        int i2 = 0;
        boolean z2 = false;
        int i3 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i3 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 3:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 4:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 5:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 6:
                    videoOptionsParcel = (VideoOptionsParcel) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, VideoOptionsParcel.CREATOR);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new NativeAdOptionsParcel(i3, z2, i2, z, i, videoOptionsParcel);
    }
}
