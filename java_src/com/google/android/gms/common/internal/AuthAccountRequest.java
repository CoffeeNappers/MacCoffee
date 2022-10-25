package com.google.android.gms.common.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public class AuthAccountRequest extends AbstractSafeParcelable {
    public static final Parcelable.Creator<AuthAccountRequest> CREATOR = new zzd();
    final IBinder Df;
    final Scope[] Dg;
    Integer Dh;
    Integer Di;
    final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AuthAccountRequest(int i, IBinder iBinder, Scope[] scopeArr, Integer num, Integer num2) {
        this.mVersionCode = i;
        this.Df = iBinder;
        this.Dg = scopeArr;
        this.Dh = num;
        this.Di = num2;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzd.zza(this, parcel, i);
    }
}
