package io.sentry.event.interfaces;

import io.sentry.jvmti.FrameCache;
import java.io.Serializable;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes3.dex */
public final class SentryException implements Serializable {
    public static final String DEFAULT_PACKAGE_NAME = "(default)";
    private final String exceptionClassName;
    private final String exceptionMessage;
    private final String exceptionPackageName;
    private final StackTraceInterface stackTraceInterface;

    public SentryException(Throwable throwable, StackTraceElement[] childExceptionStackTrace) {
        this.exceptionMessage = throwable.getMessage();
        this.exceptionClassName = throwable.getClass().getSimpleName();
        Package exceptionPackage = throwable.getClass().getPackage();
        this.exceptionPackageName = exceptionPackage != null ? exceptionPackage.getName() : null;
        this.stackTraceInterface = new StackTraceInterface(throwable.getStackTrace(), childExceptionStackTrace, FrameCache.get(throwable));
    }

    public SentryException(String exceptionMessage, String exceptionClassName, String exceptionPackageName, StackTraceInterface stackTraceInterface) {
        this.exceptionMessage = exceptionMessage;
        this.exceptionClassName = exceptionClassName;
        this.exceptionPackageName = exceptionPackageName;
        this.stackTraceInterface = stackTraceInterface;
    }

    public static Deque<SentryException> extractExceptionQueue(Throwable throwable) {
        Deque<SentryException> exceptions = new ArrayDeque<>();
        Set<Throwable> circularityDetector = new HashSet<>();
        StackTraceElement[] childExceptionStackTrace = new StackTraceElement[0];
        while (throwable != null && circularityDetector.add(throwable)) {
            exceptions.add(new SentryException(throwable, childExceptionStackTrace));
            childExceptionStackTrace = throwable.getStackTrace();
            throwable = throwable.getCause();
        }
        return exceptions;
    }

    public String getExceptionMessage() {
        return this.exceptionMessage;
    }

    public String getExceptionClassName() {
        return this.exceptionClassName;
    }

    public String getExceptionPackageName() {
        return this.exceptionPackageName != null ? this.exceptionPackageName : DEFAULT_PACKAGE_NAME;
    }

    public StackTraceInterface getStackTraceInterface() {
        return this.stackTraceInterface;
    }

    public String toString() {
        return "SentryException{exceptionMessage='" + this.exceptionMessage + "', exceptionClassName='" + this.exceptionClassName + "', exceptionPackageName='" + this.exceptionPackageName + "', stackTraceInterface=" + this.stackTraceInterface + '}';
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        SentryException that = (SentryException) o;
        if (!this.exceptionClassName.equals(that.exceptionClassName)) {
            return false;
        }
        if (this.exceptionMessage != null) {
            if (!this.exceptionMessage.equals(that.exceptionMessage)) {
                return false;
            }
        } else if (that.exceptionMessage != null) {
            return false;
        }
        if (this.exceptionPackageName != null) {
            if (!this.exceptionPackageName.equals(that.exceptionPackageName)) {
                return false;
            }
        } else if (that.exceptionPackageName != null) {
            return false;
        }
        return this.stackTraceInterface.equals(that.stackTraceInterface);
    }

    public int hashCode() {
        int i = 0;
        int result = this.exceptionMessage != null ? this.exceptionMessage.hashCode() : 0;
        int hashCode = ((result * 31) + this.exceptionClassName.hashCode()) * 31;
        if (this.exceptionPackageName != null) {
            i = this.exceptionPackageName.hashCode();
        }
        int result2 = hashCode + i;
        return result2;
    }
}
