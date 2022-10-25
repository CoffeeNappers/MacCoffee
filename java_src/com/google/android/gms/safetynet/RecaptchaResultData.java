package com.google.android.gms.safetynet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public class RecaptchaResultData extends AbstractSafeParcelable {
    public static final Parcelable.Creator<RecaptchaResultData> CREATOR = new zzc();
    private final String hN;
    public final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public RecaptchaResultData(int i, String str) {
        this.mVersionCode = i;
        this.hN = str;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzc.zza(this, parcel, i);
    }

    public String zzccq() {
        return this.hN;
    }
}
