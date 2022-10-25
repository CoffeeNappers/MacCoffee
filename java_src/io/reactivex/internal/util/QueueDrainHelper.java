package io.reactivex.internal.util;

import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.functions.BooleanSupplier;
import io.reactivex.internal.fuseable.SimplePlainQueue;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.queue.SpscArrayQueue;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import java.util.Queue;
import java.util.concurrent.atomic.AtomicLong;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class QueueDrainHelper {
    static final long COMPLETED_MASK = Long.MIN_VALUE;
    static final long REQUESTED_MASK = Long.MAX_VALUE;

    private QueueDrainHelper() {
        throw new IllegalStateException("No instances!");
    }

    public static <T, U> void drainMaxLoop(SimplePlainQueue<T> q, Subscriber<? super U> a, boolean delayError, Disposable dispose, QueueDrain<T, U> qd) {
        int missed = 1;
        while (true) {
            boolean d = qd.done();
            T v = q.mo1188poll();
            boolean empty = v == null;
            if (checkTerminated(d, empty, a, delayError, q, qd)) {
                if (dispose != null) {
                    dispose.dispose();
                    return;
                }
                return;
            } else if (!empty) {
                long r = qd.requested();
                if (r != 0) {
                    if (qd.accept(a, v) && r != Long.MAX_VALUE) {
                        qd.produced(1L);
                    }
                } else {
                    q.clear();
                    if (dispose != null) {
                        dispose.dispose();
                    }
                    a.onError(new MissingBackpressureException("Could not emit value due to lack of requests."));
                    return;
                }
            } else {
                missed = qd.leave(-missed);
                if (missed == 0) {
                    return;
                }
            }
        }
    }

    public static <T, U> boolean checkTerminated(boolean d, boolean empty, Subscriber<?> s, boolean delayError, SimpleQueue<?> q, QueueDrain<T, U> qd) {
        if (qd.cancelled()) {
            q.clear();
            return true;
        }
        if (d) {
            if (delayError) {
                if (empty) {
                    Throwable err = qd.error();
                    if (err != null) {
                        s.onError(err);
                        return true;
                    }
                    s.onComplete();
                    return true;
                }
            } else {
                Throwable err2 = qd.error();
                if (err2 != null) {
                    q.clear();
                    s.onError(err2);
                    return true;
                } else if (empty) {
                    s.onComplete();
                    return true;
                }
            }
        }
        return false;
    }

    public static <T, U> void drainLoop(SimplePlainQueue<T> q, Observer<? super U> a, boolean delayError, Disposable dispose, ObservableQueueDrain<T, U> qd) {
        int missed = 1;
        while (!checkTerminated(qd.done(), q.isEmpty(), a, delayError, q, dispose, qd)) {
            while (true) {
                boolean d = qd.done();
                T v = q.mo1188poll();
                boolean empty = v == null;
                if (!checkTerminated(d, empty, a, delayError, q, dispose, qd)) {
                    if (!empty) {
                        qd.accept(a, v);
                    } else {
                        missed = qd.leave(-missed);
                        if (missed == 0) {
                            return;
                        }
                    }
                } else {
                    return;
                }
            }
        }
    }

    public static <T, U> boolean checkTerminated(boolean d, boolean empty, Observer<?> s, boolean delayError, SimpleQueue<?> q, Disposable disposable, ObservableQueueDrain<T, U> qd) {
        if (qd.cancelled()) {
            q.clear();
            disposable.dispose();
            return true;
        }
        if (d) {
            if (delayError) {
                if (empty) {
                    disposable.dispose();
                    Throwable err = qd.error();
                    if (err != null) {
                        s.onError(err);
                        return true;
                    }
                    s.onComplete();
                    return true;
                }
            } else {
                Throwable err2 = qd.error();
                if (err2 != null) {
                    q.clear();
                    disposable.dispose();
                    s.onError(err2);
                    return true;
                } else if (empty) {
                    disposable.dispose();
                    s.onComplete();
                    return true;
                }
            }
        }
        return false;
    }

    public static <T> SimpleQueue<T> createQueue(int capacityHint) {
        return capacityHint < 0 ? new SpscLinkedArrayQueue(-capacityHint) : new SpscArrayQueue(capacityHint);
    }

    public static void request(Subscription s, int prefetch) {
        s.request(prefetch < 0 ? Long.MAX_VALUE : prefetch);
    }

    public static <T> boolean postCompleteRequest(long n, Subscriber<? super T> actual, Queue<T> queue, AtomicLong state, BooleanSupplier isCancelled) {
        long r;
        long u;
        do {
            r = state.get();
            long r0 = r & Long.MAX_VALUE;
            u = (Long.MIN_VALUE & r) | BackpressureHelper.addCap(r0, n);
        } while (!state.compareAndSet(r, u));
        if (r == Long.MIN_VALUE) {
            postCompleteDrain(Long.MIN_VALUE | n, actual, queue, state, isCancelled);
            return true;
        }
        return false;
    }

    static boolean isCancelled(BooleanSupplier cancelled) {
        try {
            return cancelled.getAsBoolean();
        } catch (Throwable ex) {
            Exceptions.throwIfFatal(ex);
            return true;
        }
    }

    static <T> boolean postCompleteDrain(long n, Subscriber<? super T> actual, Queue<T> queue, AtomicLong state, BooleanSupplier isCancelled) {
        long e = n & Long.MIN_VALUE;
        while (true) {
            if (e != n) {
                if (isCancelled(isCancelled)) {
                    return true;
                }
                Object obj = (T) queue.poll();
                if (obj == null) {
                    actual.onComplete();
                    return true;
                }
                actual.onNext(obj);
                e++;
            } else if (isCancelled(isCancelled)) {
                return true;
            } else {
                if (queue.isEmpty()) {
                    actual.onComplete();
                    return true;
                }
                n = state.get();
                if (n == e) {
                    n = state.addAndGet(-(Long.MAX_VALUE & e));
                    if ((Long.MAX_VALUE & n) == 0) {
                        return false;
                    }
                    e = n & Long.MIN_VALUE;
                } else {
                    continue;
                }
            }
        }
    }

    public static <T> void postComplete(Subscriber<? super T> actual, Queue<T> queue, AtomicLong state, BooleanSupplier isCancelled) {
        long r;
        long u;
        if (queue.isEmpty()) {
            actual.onComplete();
        } else if (!postCompleteDrain(state.get(), actual, queue, state, isCancelled)) {
            do {
                r = state.get();
                if ((r & Long.MIN_VALUE) == 0) {
                    u = r | Long.MIN_VALUE;
                } else {
                    return;
                }
            } while (!state.compareAndSet(r, u));
            if (r != 0) {
                postCompleteDrain(u, actual, queue, state, isCancelled);
            }
        }
    }
}
