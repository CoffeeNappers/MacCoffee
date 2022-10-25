package com.google.android.gms.common.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzp;
/* loaded from: classes2.dex */
public class ResolveAccountResponse extends AbstractSafeParcelable {
    public static final Parcelable.Creator<ResolveAccountResponse> CREATOR = new zzac();
    IBinder Df;
    private ConnectionResult EJ;
    private boolean EK;
    final int mVersionCode;
    private boolean zN;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ResolveAccountResponse(int i, IBinder iBinder, ConnectionResult connectionResult, boolean z, boolean z2) {
        this.mVersionCode = i;
        this.Df = iBinder;
        this.EJ = connectionResult;
        this.zN = z;
        this.EK = z2;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ResolveAccountResponse)) {
            return false;
        }
        ResolveAccountResponse resolveAccountResponse = (ResolveAccountResponse) obj;
        return this.EJ.equals(resolveAccountResponse.EJ) && zzawm().equals(resolveAccountResponse.zzawm());
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzac.zza(this, parcel, i);
    }

    public zzp zzawm() {
        return zzp.zza.zzdr(this.Df);
    }

    public ConnectionResult zzawn() {
        return this.EJ;
    }

    public boolean zzawo() {
        return this.zN;
    }

    public boolean zzawp() {
        return this.EK;
    }
}
