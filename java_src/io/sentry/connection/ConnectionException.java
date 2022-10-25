package io.sentry.connection;
/* loaded from: classes3.dex */
public class ConnectionException extends RuntimeException {
    private Long recommendedLockdownTime;

    public ConnectionException() {
        this.recommendedLockdownTime = null;
    }

    public ConnectionException(String message) {
        super(message);
        this.recommendedLockdownTime = null;
    }

    public ConnectionException(String message, Throwable cause) {
        super(message, cause);
        this.recommendedLockdownTime = null;
    }

    public ConnectionException(String message, Throwable cause, Long recommendedLockdownTime) {
        super(message, cause);
        this.recommendedLockdownTime = null;
        this.recommendedLockdownTime = recommendedLockdownTime;
    }

    public ConnectionException(Throwable cause) {
        super(cause);
        this.recommendedLockdownTime = null;
    }

    public Long getRecommendedLockdownTime() {
        return this.recommendedLockdownTime;
    }
}
