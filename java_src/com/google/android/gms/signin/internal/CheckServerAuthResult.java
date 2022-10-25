package com.google.android.gms.signin.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import java.util.List;
/* loaded from: classes2.dex */
public class CheckServerAuthResult extends AbstractSafeParcelable {
    public static final Parcelable.Creator<CheckServerAuthResult> CREATOR = new zzc();
    final boolean aDs;
    final List<Scope> aDt;
    final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public CheckServerAuthResult(int i, boolean z, List<Scope> list) {
        this.mVersionCode = i;
        this.aDs = z;
        this.aDt = list;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzc.zza(this, parcel, i);
    }
}
