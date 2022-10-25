package com.google.android.gms.tasks;

import android.support.annotation.NonNull;
/* loaded from: classes2.dex */
public class TaskCompletionSource<TResult> {
    private final zzh<TResult> aMS = new zzh<>();

    @NonNull
    public Task<TResult> getTask() {
        return this.aMS;
    }

    public void setException(@NonNull Exception exc) {
        this.aMS.setException(exc);
    }

    public void setResult(TResult tresult) {
        this.aMS.setResult(tresult);
    }

    public boolean trySetException(@NonNull Exception exc) {
        return this.aMS.trySetException(exc);
    }

    public boolean trySetResult(TResult tresult) {
        return this.aMS.trySetResult(tresult);
    }
}
