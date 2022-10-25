package io.reactivex.internal.util;

import io.reactivex.exceptions.CompositeException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class ExceptionHelper {
    public static final Throwable TERMINATED = new Termination();

    private ExceptionHelper() {
        throw new IllegalStateException("No instances!");
    }

    public static RuntimeException wrapOrThrow(Throwable error) {
        if (error instanceof Error) {
            throw ((Error) error);
        }
        return error instanceof RuntimeException ? (RuntimeException) error : new RuntimeException(error);
    }

    public static <T> boolean addThrowable(AtomicReference<Throwable> field, Throwable exception) {
        Throwable current;
        Throwable update;
        do {
            current = field.get();
            if (current == TERMINATED) {
                return false;
            }
            if (current == null) {
                update = exception;
            } else {
                update = new CompositeException(current, exception);
            }
        } while (!field.compareAndSet(current, update));
        return true;
    }

    public static <T> Throwable terminate(AtomicReference<Throwable> field) {
        Throwable current = field.get();
        if (current != TERMINATED) {
            return field.getAndSet(TERMINATED);
        }
        return current;
    }

    public static List<Throwable> flatten(Throwable t) {
        List<Throwable> list = new ArrayList<>();
        ArrayDeque<Throwable> deque = new ArrayDeque<>();
        deque.offer(t);
        while (!deque.isEmpty()) {
            Throwable e = deque.removeFirst();
            if (e instanceof CompositeException) {
                CompositeException ce = (CompositeException) e;
                List<Throwable> exceptions = ce.getExceptions();
                for (int i = exceptions.size() - 1; i >= 0; i--) {
                    deque.offerFirst(exceptions.get(i));
                }
            } else {
                list.add(e);
            }
        }
        return list;
    }

    /* loaded from: classes3.dex */
    static final class Termination extends Throwable {
        private static final long serialVersionUID = -4649703670690200604L;

        Termination() {
            super("No further exceptions");
        }

        @Override // java.lang.Throwable
        public Throwable fillInStackTrace() {
            return this;
        }
    }
}
