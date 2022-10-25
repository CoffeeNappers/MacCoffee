package com.google.android.gms.location.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public final class FusedLocationProviderResult extends AbstractSafeParcelable implements Result {
    private final Status hv;
    private final int mVersionCode;
    public static final FusedLocationProviderResult akQ = new FusedLocationProviderResult(Status.xZ);
    public static final Parcelable.Creator<FusedLocationProviderResult> CREATOR = new zze();

    /* JADX INFO: Access modifiers changed from: package-private */
    public FusedLocationProviderResult(int i, Status status) {
        this.mVersionCode = i;
        this.hv = status;
    }

    public FusedLocationProviderResult(Status status) {
        this(1, status);
    }

    @Override // com.google.android.gms.common.api.Result
    public Status getStatus() {
        return this.hv;
    }

    public int getVersionCode() {
        return this.mVersionCode;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zze.zza(this, parcel, i);
    }
}
