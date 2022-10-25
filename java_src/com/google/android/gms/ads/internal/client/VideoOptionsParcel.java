package com.google.android.gms.ads.internal.client;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.ads.VideoOptions;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class VideoOptionsParcel extends AbstractSafeParcelable {
    public static final Parcelable.Creator<VideoOptionsParcel> CREATOR = new zzaq();
    public final int versionCode;
    public final boolean zzbck;

    public VideoOptionsParcel(int i, boolean z) {
        this.versionCode = i;
        this.zzbck = z;
    }

    public VideoOptionsParcel(VideoOptions videoOptions) {
        this(1, videoOptions.getStartMuted());
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzaq.zza(this, parcel, i);
    }
}
