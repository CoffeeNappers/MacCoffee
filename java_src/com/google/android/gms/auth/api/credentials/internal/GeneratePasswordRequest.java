package com.google.android.gms.auth.api.credentials.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.auth.api.credentials.PasswordSpecification;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public final class GeneratePasswordRequest extends AbstractSafeParcelable {
    public static final Parcelable.Creator<GeneratePasswordRequest> CREATOR = new zzi();
    private final PasswordSpecification ih;
    final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public GeneratePasswordRequest(int i, PasswordSpecification passwordSpecification) {
        this.mVersionCode = i;
        this.ih = passwordSpecification;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzi.zza(this, parcel, i);
    }

    public PasswordSpecification zzaid() {
        return this.ih;
    }
}
