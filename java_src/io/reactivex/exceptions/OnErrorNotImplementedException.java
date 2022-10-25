package io.reactivex.exceptions;

import io.reactivex.annotations.Experimental;
@Experimental
/* loaded from: classes3.dex */
public final class OnErrorNotImplementedException extends RuntimeException {
    private static final long serialVersionUID = -6298857009889503852L;

    public OnErrorNotImplementedException(String message, Throwable e) {
        super(message, e == null ? new NullPointerException() : e);
    }

    public OnErrorNotImplementedException(Throwable e) {
        super(e != null ? e.getMessage() : null, e == null ? new NullPointerException() : e);
    }
}
