package com.google.android.gms.internal;

import android.support.annotation.NonNull;
import com.google.android.gms.common.api.OptionalPendingResult;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.ResultTransform;
import com.google.android.gms.common.api.TransformedResult;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public final class zzru<R extends Result> extends OptionalPendingResult<R> {
    private final zzqq<R> Bp;

    public zzru(PendingResult<R> pendingResult) {
        if (!(pendingResult instanceof zzqq)) {
            throw new IllegalArgumentException("OptionalPendingResult can only wrap PendingResults generated by an API call.");
        }
        this.Bp = (zzqq) pendingResult;
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public R await() {
        return this.Bp.await();
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public R await(long j, TimeUnit timeUnit) {
        return this.Bp.await(j, timeUnit);
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public void cancel() {
        this.Bp.cancel();
    }

    @Override // com.google.android.gms.common.api.OptionalPendingResult
    public R get() {
        if (isDone()) {
            return await(0L, TimeUnit.MILLISECONDS);
        }
        throw new IllegalStateException("Result is not available. Check that isDone() returns true before calling get().");
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public boolean isCanceled() {
        return this.Bp.isCanceled();
    }

    @Override // com.google.android.gms.common.api.OptionalPendingResult
    public boolean isDone() {
        return this.Bp.isReady();
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public void setResultCallback(ResultCallback<? super R> resultCallback) {
        this.Bp.setResultCallback(resultCallback);
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public void setResultCallback(ResultCallback<? super R> resultCallback, long j, TimeUnit timeUnit) {
        this.Bp.setResultCallback(resultCallback, j, timeUnit);
    }

    @Override // com.google.android.gms.common.api.PendingResult
    @NonNull
    public <S extends Result> TransformedResult<S> then(@NonNull ResultTransform<? super R, ? extends S> resultTransform) {
        return this.Bp.then(resultTransform);
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public void zza(PendingResult.zza zzaVar) {
        this.Bp.zza(zzaVar);
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public Integer zzarh() {
        return this.Bp.zzarh();
    }
}
