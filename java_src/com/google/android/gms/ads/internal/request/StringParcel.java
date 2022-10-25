package com.google.android.gms.ads.internal.request;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class StringParcel extends AbstractSafeParcelable {
    public static final Parcelable.Creator<StringParcel> CREATOR = new zzo();
    final int mVersionCode;
    String zzbme;

    /* JADX INFO: Access modifiers changed from: package-private */
    public StringParcel(int i, String str) {
        this.mVersionCode = i;
        this.zzbme = str;
    }

    public StringParcel(String str) {
        this.mVersionCode = 1;
        this.zzbme = str;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzo.zza(this, parcel, i);
    }

    public String zzth() {
        return this.zzbme;
    }
}
