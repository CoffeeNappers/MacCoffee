package com.patloew.rxlocation;

import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
/* loaded from: classes2.dex */
public class StatusException extends RuntimeException {
    private final Result result;

    public StatusException(Result result) {
        super(result.getStatus().toString());
        this.result = result;
    }

    public Result getResult() {
        return this.result;
    }

    public Status getStatus() {
        return this.result.getStatus();
    }
}
