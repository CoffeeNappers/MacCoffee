package com.google.android.gms.safetynet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public class AttestationData extends AbstractSafeParcelable {
    public static final Parcelable.Creator<AttestationData> CREATOR = new zza();
    private String aCd;
    public final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AttestationData(int i, String str) {
        this.mVersionCode = i;
        this.aCd = str;
    }

    public String getJwsResult() {
        return this.aCd;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zza.zza(this, parcel, i);
    }
}
