package io.sentry.event.interfaces;

import io.sentry.jvmti.Frame;
import java.util.Arrays;
/* loaded from: classes3.dex */
public class StackTraceInterface implements SentryInterface {
    public static final String STACKTRACE_INTERFACE = "sentry.interfaces.Stacktrace";
    private final int framesCommonWithEnclosing;
    private final SentryStackTraceElement[] stackTrace;

    public StackTraceInterface(StackTraceElement[] stackTrace) {
        this(stackTrace, new StackTraceElement[0], null);
    }

    public StackTraceInterface(StackTraceElement[] stackTrace, StackTraceElement[] enclosingStackTrace) {
        this(stackTrace, enclosingStackTrace, null);
    }

    public StackTraceInterface(StackTraceElement[] stackTrace, StackTraceElement[] enclosingStackTrace, Frame[] cachedFrames) {
        this.stackTrace = SentryStackTraceElement.fromStackTraceElements(stackTrace, cachedFrames);
        int m = stackTrace.length - 1;
        for (int n = enclosingStackTrace.length - 1; m >= 0 && n >= 0 && stackTrace[m].equals(enclosingStackTrace[n]); n--) {
            m--;
        }
        this.framesCommonWithEnclosing = (stackTrace.length - 1) - m;
    }

    public StackTraceInterface(SentryStackTraceElement[] stackTrace) {
        this.stackTrace = (SentryStackTraceElement[]) Arrays.copyOf(stackTrace, stackTrace.length);
        this.framesCommonWithEnclosing = 0;
    }

    @Override // io.sentry.event.interfaces.SentryInterface
    public String getInterfaceName() {
        return STACKTRACE_INTERFACE;
    }

    public SentryStackTraceElement[] getStackTrace() {
        return (SentryStackTraceElement[]) Arrays.copyOf(this.stackTrace, this.stackTrace.length);
    }

    public int getFramesCommonWithEnclosing() {
        return this.framesCommonWithEnclosing;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        StackTraceInterface that = (StackTraceInterface) o;
        return Arrays.equals(this.stackTrace, that.stackTrace);
    }

    public int hashCode() {
        return Arrays.hashCode(this.stackTrace);
    }

    public String toString() {
        return "StackTraceInterface{stackTrace=" + Arrays.toString(this.stackTrace) + '}';
    }
}
