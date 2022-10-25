package com.patloew.rxlocation;
/* loaded from: classes2.dex */
public class GoogleApiConnectionSuspendedException extends RuntimeException {
    private final int cause;

    /* JADX INFO: Access modifiers changed from: package-private */
    public GoogleApiConnectionSuspendedException(int cause) {
        this.cause = cause;
    }

    public int getErrorCause() {
        return this.cause;
    }
}
