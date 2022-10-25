package com.google.android.gms.common.api;

import com.google.android.gms.common.internal.zzaa;
/* loaded from: classes2.dex */
public class BooleanResult implements Result {
    private final Status hv;
    private final boolean xv;

    public BooleanResult(Status status, boolean z) {
        this.hv = (Status) zzaa.zzb(status, "Status must not be null");
        this.xv = z;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof BooleanResult)) {
            return false;
        }
        BooleanResult booleanResult = (BooleanResult) obj;
        return this.hv.equals(booleanResult.hv) && this.xv == booleanResult.xv;
    }

    @Override // com.google.android.gms.common.api.Result
    public Status getStatus() {
        return this.hv;
    }

    public boolean getValue() {
        return this.xv;
    }

    public final int hashCode() {
        return (this.xv ? 1 : 0) + ((this.hv.hashCode() + 527) * 31);
    }
}
