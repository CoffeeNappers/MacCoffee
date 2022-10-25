package com.google.android.gms.ads.internal.client;

import android.os.Parcel;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class ThinAdSizeParcel extends AdSizeParcel {
    public ThinAdSizeParcel(AdSizeParcel adSizeParcel) {
        super(adSizeParcel.versionCode, adSizeParcel.zzazq, adSizeParcel.height, adSizeParcel.heightPixels, adSizeParcel.zzazr, adSizeParcel.width, adSizeParcel.widthPixels, adSizeParcel.zzazs, adSizeParcel.zzazt, adSizeParcel.zzazu, adSizeParcel.zzazv);
    }

    @Override // com.google.android.gms.ads.internal.client.AdSizeParcel, android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, this.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, this.zzazq, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 3, this.height);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 6, this.width);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }
}
