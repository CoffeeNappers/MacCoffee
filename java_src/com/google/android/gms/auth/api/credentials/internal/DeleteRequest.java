package com.google.android.gms.auth.api.credentials.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.auth.api.credentials.Credential;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public final class DeleteRequest extends AbstractSafeParcelable {
    public static final Parcelable.Creator<DeleteRequest> CREATOR = new zzh();
    private final Credential iP;
    final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public DeleteRequest(int i, Credential credential) {
        this.mVersionCode = i;
        this.iP = credential;
    }

    public DeleteRequest(Credential credential) {
        this(1, credential);
    }

    public Credential getCredential() {
        return this.iP;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzh.zza(this, parcel, i);
    }
}
