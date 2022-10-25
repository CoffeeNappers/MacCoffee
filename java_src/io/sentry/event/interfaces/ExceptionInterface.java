package io.sentry.event.interfaces;

import java.util.Deque;
/* loaded from: classes3.dex */
public class ExceptionInterface implements SentryInterface {
    public static final String EXCEPTION_INTERFACE = "sentry.interfaces.Exception";
    private final Deque<SentryException> exceptions;

    public ExceptionInterface(Throwable throwable) {
        this(SentryException.extractExceptionQueue(throwable));
    }

    public ExceptionInterface(Deque<SentryException> exceptions) {
        this.exceptions = exceptions;
    }

    @Override // io.sentry.event.interfaces.SentryInterface
    public String getInterfaceName() {
        return EXCEPTION_INTERFACE;
    }

    public Deque<SentryException> getExceptions() {
        return this.exceptions;
    }

    public String toString() {
        return "ExceptionInterface{exceptions=" + this.exceptions + '}';
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ExceptionInterface that = (ExceptionInterface) o;
        return this.exceptions.equals(that.exceptions);
    }

    public int hashCode() {
        return this.exceptions.hashCode();
    }
}
