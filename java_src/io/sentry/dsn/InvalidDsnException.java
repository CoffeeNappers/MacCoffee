package io.sentry.dsn;
/* loaded from: classes3.dex */
public class InvalidDsnException extends RuntimeException {
    public InvalidDsnException() {
    }

    public InvalidDsnException(String message) {
        super(message);
    }

    public InvalidDsnException(String message, Throwable cause) {
        super(message, cause);
    }

    public InvalidDsnException(Throwable cause) {
        super(cause);
    }
}
