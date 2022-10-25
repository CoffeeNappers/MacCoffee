package com.google.android.gms.common.api;

import com.google.android.gms.common.internal.zzaa;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public final class BatchResult implements Result {
    private final Status hv;
    private final PendingResult<?>[] xs;

    /* JADX INFO: Access modifiers changed from: package-private */
    public BatchResult(Status status, PendingResult<?>[] pendingResultArr) {
        this.hv = status;
        this.xs = pendingResultArr;
    }

    @Override // com.google.android.gms.common.api.Result
    public Status getStatus() {
        return this.hv;
    }

    public <R extends Result> R take(BatchResultToken<R> batchResultToken) {
        zzaa.zzb(batchResultToken.mId < this.xs.length, "The result token does not belong to this batch");
        return (R) this.xs[batchResultToken.mId].await(0L, TimeUnit.MILLISECONDS);
    }
}
