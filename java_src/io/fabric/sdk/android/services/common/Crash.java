package io.fabric.sdk.android.services.common;
/* loaded from: classes3.dex */
public abstract class Crash {
    private static final String UNKNOWN_EXCEPTION = "<unknown>";
    private final String exceptionName;
    private final String sessionId;

    public Crash(String sessionId) {
        this(sessionId, UNKNOWN_EXCEPTION);
    }

    public Crash(String sessionId, String exceptionName) {
        this.sessionId = sessionId;
        this.exceptionName = exceptionName;
    }

    public String getSessionId() {
        return this.sessionId;
    }

    public String getExceptionName() {
        return this.exceptionName;
    }

    /* loaded from: classes3.dex */
    public static class LoggedException extends Crash {
        public LoggedException(String sessionId) {
            super(sessionId);
        }

        public LoggedException(String sessionId, String exceptionName) {
            super(sessionId, exceptionName);
        }
    }

    /* loaded from: classes3.dex */
    public static class FatalException extends Crash {
        public FatalException(String sessionId) {
            super(sessionId);
        }

        public FatalException(String sessionId, String exceptionName) {
            super(sessionId, exceptionName);
        }
    }
}
