package com.google.android.gms.common.api;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.WorkerThread;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.internal.zzrz;
/* loaded from: classes2.dex */
public abstract class ResultTransform<R extends Result, S extends Result> {
    @NonNull
    public final PendingResult<S> createFailedResult(@NonNull Status status) {
        return new zzrz(status);
    }

    @NonNull
    public Status onFailure(@NonNull Status status) {
        return status;
    }

    @WorkerThread
    @Nullable
    public abstract PendingResult<S> onSuccess(@NonNull R r);
}
