package com.google.android.gms.internal;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.ResultTransform;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.TransformedResult;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public class zzrz<R extends Result> extends PendingResult<R> {
    private final Status hv;

    public zzrz(Status status) {
        com.google.android.gms.common.internal.zzaa.zzb(status, "Status must not be null");
        com.google.android.gms.common.internal.zzaa.zzb(!status.isSuccess(), "Status must not be success");
        this.hv = status;
    }

    @Override // com.google.android.gms.common.api.PendingResult
    @NonNull
    public R await() {
        throw new UnsupportedOperationException("Operation not supported on PendingResults generated by ResultTransform.createFailedResult()");
    }

    @Override // com.google.android.gms.common.api.PendingResult
    @NonNull
    public R await(long j, @NonNull TimeUnit timeUnit) {
        throw new UnsupportedOperationException("Operation not supported on PendingResults generated by ResultTransform.createFailedResult()");
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public void cancel() {
        throw new UnsupportedOperationException("Operation not supported on PendingResults generated by ResultTransform.createFailedResult()");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @NonNull
    public Status getStatus() {
        return this.hv;
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public boolean isCanceled() {
        throw new UnsupportedOperationException("Operation not supported on PendingResults generated by ResultTransform.createFailedResult()");
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public void setResultCallback(@NonNull ResultCallback<? super R> resultCallback) {
        throw new UnsupportedOperationException("Operation not supported on PendingResults generated by ResultTransform.createFailedResult()");
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public void setResultCallback(@NonNull ResultCallback<? super R> resultCallback, long j, @NonNull TimeUnit timeUnit) {
        throw new UnsupportedOperationException("Operation not supported on PendingResults generated by ResultTransform.createFailedResult()");
    }

    @Override // com.google.android.gms.common.api.PendingResult
    @NonNull
    public <S extends Result> TransformedResult<S> then(@NonNull ResultTransform<? super R, ? extends S> resultTransform) {
        throw new UnsupportedOperationException("Operation not supported on PendingResults generated by ResultTransform.createFailedResult()");
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public void zza(@NonNull PendingResult.zza zzaVar) {
        throw new UnsupportedOperationException("Operation not supported on PendingResults generated by ResultTransform.createFailedResult()");
    }

    @Override // com.google.android.gms.common.api.PendingResult
    @Nullable
    public Integer zzarh() {
        throw new UnsupportedOperationException("Operation not supported on PendingResults generated by ResultTransform.createFailedResult()");
    }
}
