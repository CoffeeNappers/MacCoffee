package com.google.android.gms.internal;

import com.google.android.gms.common.api.Releasable;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.DataHolder;
/* loaded from: classes2.dex */
public abstract class zzqy implements Releasable, Result {
    protected final Status hv;
    protected final DataHolder zy;

    protected zzqy(DataHolder dataHolder, Status status) {
        this.hv = status;
        this.zy = dataHolder;
    }

    @Override // com.google.android.gms.common.api.Result
    public Status getStatus() {
        return this.hv;
    }

    @Override // com.google.android.gms.common.api.Releasable
    public void release() {
        if (this.zy != null) {
            this.zy.close();
        }
    }
}
