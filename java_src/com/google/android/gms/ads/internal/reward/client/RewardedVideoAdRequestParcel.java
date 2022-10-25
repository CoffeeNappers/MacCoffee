package com.google.android.gms.ads.internal.reward.client;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public final class RewardedVideoAdRequestParcel extends AbstractSafeParcelable {
    public static final Parcelable.Creator<RewardedVideoAdRequestParcel> CREATOR = new zzh();
    public final int versionCode;
    public final String zzarg;
    public final AdRequestParcel zzcju;

    public RewardedVideoAdRequestParcel(int i, AdRequestParcel adRequestParcel, String str) {
        this.versionCode = i;
        this.zzcju = adRequestParcel;
        this.zzarg = str;
    }

    public RewardedVideoAdRequestParcel(AdRequestParcel adRequestParcel, String str) {
        this(1, adRequestParcel, str);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzh.zza(this, parcel, i);
    }
}
