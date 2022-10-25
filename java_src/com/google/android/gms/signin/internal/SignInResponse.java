package com.google.android.gms.signin.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.ResolveAccountResponse;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public class SignInResponse extends AbstractSafeParcelable {
    public static final Parcelable.Creator<SignInResponse> CREATOR = new zzi();
    private final ConnectionResult EJ;
    private final ResolveAccountResponse aDx;
    final int mVersionCode;

    public SignInResponse(int i) {
        this(new ConnectionResult(i, null), null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public SignInResponse(int i, ConnectionResult connectionResult, ResolveAccountResponse resolveAccountResponse) {
        this.mVersionCode = i;
        this.EJ = connectionResult;
        this.aDx = resolveAccountResponse;
    }

    public SignInResponse(ConnectionResult connectionResult, ResolveAccountResponse resolveAccountResponse) {
        this(1, connectionResult, resolveAccountResponse);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzi.zza(this, parcel, i);
    }

    public ConnectionResult zzawn() {
        return this.EJ;
    }

    public ResolveAccountResponse zzcdn() {
        return this.aDx;
    }
}
