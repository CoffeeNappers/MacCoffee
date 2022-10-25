package io.reactivex.processors;

import io.reactivex.annotations.CheckReturnValue;
import io.reactivex.annotations.Experimental;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.AppendOnlyLinkedArrayList;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.internal.util.NotificationLite;
import io.reactivex.plugins.RxJavaPlugins;
import java.lang.reflect.Array;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes.dex */
public final class BehaviorProcessor<T> extends FlowableProcessor<T> {
    boolean done;
    long index;
    final ReadWriteLock lock;
    final Lock readLock;
    final AtomicReference<BehaviorSubscription<T>[]> subscribers;
    final AtomicReference<Object> value;
    final Lock writeLock;
    static final Object[] EMPTY_ARRAY = new Object[0];
    static final BehaviorSubscription[] EMPTY = new BehaviorSubscription[0];
    static final BehaviorSubscription[] TERMINATED = new BehaviorSubscription[0];

    @CheckReturnValue
    public static <T> BehaviorProcessor<T> create() {
        return new BehaviorProcessor<>();
    }

    @CheckReturnValue
    public static <T> BehaviorProcessor<T> createDefault(T defaultValue) {
        ObjectHelper.requireNonNull(defaultValue, "defaultValue is null");
        return new BehaviorProcessor<>(defaultValue);
    }

    BehaviorProcessor() {
        this.value = new AtomicReference<>();
        this.lock = new ReentrantReadWriteLock();
        this.readLock = this.lock.readLock();
        this.writeLock = this.lock.writeLock();
        this.subscribers = new AtomicReference<>(EMPTY);
    }

    BehaviorProcessor(T defaultValue) {
        this();
        this.value.lazySet(ObjectHelper.requireNonNull(defaultValue, "defaultValue is null"));
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super T> s) {
        BehaviorSubscription<T> bs = new BehaviorSubscription<>(s, this);
        s.onSubscribe(bs);
        if (add(bs)) {
            if (bs.cancelled) {
                remove(bs);
                return;
            } else {
                bs.emitFirst();
                return;
            }
        }
        Object o = this.value.get();
        if (NotificationLite.isComplete(o)) {
            s.onComplete();
        } else {
            s.onError(NotificationLite.getError(o));
        }
    }

    @Override // org.reactivestreams.Subscriber
    public void onSubscribe(Subscription s) {
        if (this.done) {
            s.cancel();
        } else {
            s.request(Long.MAX_VALUE);
        }
    }

    @Override // org.reactivestreams.Subscriber
    public void onNext(T t) {
        if (t == null) {
            onError(new NullPointerException("onNext called with null. Null values are generally not allowed in 2.x operators and sources."));
        } else if (!this.done) {
            Object o = NotificationLite.next(t);
            setCurrent(o);
            BehaviorSubscription<T>[] arr$ = this.subscribers.get();
            for (BehaviorSubscription<T> bs : arr$) {
                bs.emitNext(o, this.index);
            }
        }
    }

    @Override // org.reactivestreams.Subscriber
    public void onError(Throwable t) {
        if (t == null) {
            t = new NullPointerException("onError called with null. Null values are generally not allowed in 2.x operators and sources.");
        }
        if (this.done) {
            RxJavaPlugins.onError(t);
            return;
        }
        this.done = true;
        Object o = NotificationLite.error(t);
        BehaviorSubscription<T>[] arr$ = terminate(o);
        for (BehaviorSubscription<T> bs : arr$) {
            bs.emitNext(o, this.index);
        }
    }

    @Override // org.reactivestreams.Subscriber
    public void onComplete() {
        if (!this.done) {
            this.done = true;
            Object o = NotificationLite.complete();
            BehaviorSubscription<T>[] arr$ = terminate(o);
            for (BehaviorSubscription<T> bs : arr$) {
                bs.emitNext(o, this.index);
            }
        }
    }

    @Experimental
    public boolean offer(T t) {
        if (t == null) {
            onError(new NullPointerException("onNext called with null. Null values are generally not allowed in 2.x operators and sources."));
            return true;
        }
        BehaviorSubscription<T>[] array = this.subscribers.get();
        for (BehaviorSubscription<T> s : array) {
            if (s.isFull()) {
                return false;
            }
        }
        Object o = NotificationLite.next(t);
        setCurrent(o);
        for (BehaviorSubscription<T> bs : array) {
            bs.emitNext(o, this.index);
        }
        return true;
    }

    @Override // io.reactivex.processors.FlowableProcessor
    public boolean hasSubscribers() {
        return this.subscribers.get().length != 0;
    }

    int subscriberCount() {
        return this.subscribers.get().length;
    }

    @Override // io.reactivex.processors.FlowableProcessor
    public Throwable getThrowable() {
        Object o = this.value.get();
        if (NotificationLite.isError(o)) {
            return NotificationLite.getError(o);
        }
        return null;
    }

    public T getValue() {
        Object o = this.value.get();
        if (NotificationLite.isComplete(o) || NotificationLite.isError(o)) {
            return null;
        }
        return (T) NotificationLite.getValue(o);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public Object[] getValues() {
        T[] b = getValues(EMPTY_ARRAY);
        if (b == EMPTY_ARRAY) {
            return new Object[0];
        }
        return b;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T[] getValues(T[] array) {
        Object o = this.value.get();
        if (o == null || NotificationLite.isComplete(o) || NotificationLite.isError(o)) {
            if (array.length != 0) {
                array[0] = 0;
            }
            return array;
        }
        Object value = NotificationLite.getValue(o);
        if (array.length != 0) {
            array[0] = value;
            if (array.length != 1) {
                array[1] = 0;
            }
        } else {
            array = (T[]) ((Object[]) Array.newInstance(array.getClass().getComponentType(), 1));
            array[0] = value;
        }
        return array;
    }

    @Override // io.reactivex.processors.FlowableProcessor
    public boolean hasComplete() {
        Object o = this.value.get();
        return NotificationLite.isComplete(o);
    }

    @Override // io.reactivex.processors.FlowableProcessor
    public boolean hasThrowable() {
        Object o = this.value.get();
        return NotificationLite.isError(o);
    }

    public boolean hasValue() {
        Object o = this.value.get();
        return o != null && !NotificationLite.isComplete(o) && !NotificationLite.isError(o);
    }

    boolean add(BehaviorSubscription<T> rs) {
        BehaviorSubscription<T>[] a;
        BehaviorSubscription<T>[] b;
        do {
            a = this.subscribers.get();
            if (a == TERMINATED) {
                return false;
            }
            int len = a.length;
            b = new BehaviorSubscription[len + 1];
            System.arraycopy(a, 0, b, 0, len);
            b[len] = rs;
        } while (!this.subscribers.compareAndSet(a, b));
        return true;
    }

    void remove(BehaviorSubscription<T> rs) {
        BehaviorSubscription<T>[] a;
        BehaviorSubscription<T>[] b;
        do {
            a = this.subscribers.get();
            if (a != TERMINATED && a != EMPTY) {
                int len = a.length;
                int j = -1;
                int i = 0;
                while (true) {
                    if (i >= len) {
                        break;
                    } else if (a[i] != rs) {
                        i++;
                    } else {
                        j = i;
                        break;
                    }
                }
                if (j >= 0) {
                    if (len == 1) {
                        b = EMPTY;
                    } else {
                        b = new BehaviorSubscription[len - 1];
                        System.arraycopy(a, 0, b, 0, j);
                        System.arraycopy(a, j + 1, b, j, (len - j) - 1);
                    }
                } else {
                    return;
                }
            } else {
                return;
            }
        } while (!this.subscribers.compareAndSet(a, b));
    }

    BehaviorSubscription<T>[] terminate(Object terminalValue) {
        BehaviorSubscription<T>[] a = this.subscribers.get();
        if (a != TERMINATED && (a = this.subscribers.getAndSet(TERMINATED)) != TERMINATED) {
            setCurrent(terminalValue);
        }
        return a;
    }

    void setCurrent(Object o) {
        Lock wl = this.writeLock;
        wl.lock();
        this.index++;
        this.value.lazySet(o);
        wl.unlock();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class BehaviorSubscription<T> extends AtomicLong implements Subscription, AppendOnlyLinkedArrayList.NonThrowingPredicate<Object> {
        private static final long serialVersionUID = 3293175281126227086L;
        final Subscriber<? super T> actual;
        volatile boolean cancelled;
        boolean emitting;
        boolean fastPath;
        long index;
        boolean next;
        AppendOnlyLinkedArrayList<Object> queue;
        final BehaviorProcessor<T> state;

        BehaviorSubscription(Subscriber<? super T> actual, BehaviorProcessor<T> state) {
            this.actual = actual;
            this.state = state;
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            if (SubscriptionHelper.validate(n)) {
                BackpressureHelper.add(this, n);
            }
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.state.remove(this);
            }
        }

        void emitFirst() {
            boolean z = true;
            if (!this.cancelled) {
                synchronized (this) {
                    if (!this.cancelled) {
                        if (!this.next) {
                            BehaviorProcessor<T> s = this.state;
                            Lock readLock = s.readLock;
                            readLock.lock();
                            this.index = s.index;
                            Object o = s.value.get();
                            readLock.unlock();
                            if (o == null) {
                                z = false;
                            }
                            this.emitting = z;
                            this.next = true;
                            if (o != null && !test(o)) {
                                emitLoop();
                            }
                        }
                    }
                }
            }
        }

        void emitNext(Object value, long stateIndex) {
            if (!this.cancelled) {
                if (!this.fastPath) {
                    synchronized (this) {
                        if (!this.cancelled) {
                            if (this.index != stateIndex) {
                                if (this.emitting) {
                                    AppendOnlyLinkedArrayList<Object> q = this.queue;
                                    if (q == null) {
                                        q = new AppendOnlyLinkedArrayList<>(4);
                                        this.queue = q;
                                    }
                                    q.add(value);
                                    return;
                                }
                                this.next = true;
                                this.fastPath = true;
                            } else {
                                return;
                            }
                        } else {
                            return;
                        }
                    }
                }
                test(value);
            }
        }

        @Override // io.reactivex.internal.util.AppendOnlyLinkedArrayList.NonThrowingPredicate, io.reactivex.functions.Predicate
        public boolean test(Object o) {
            if (this.cancelled) {
                return true;
            }
            if (NotificationLite.isComplete(o)) {
                this.actual.onComplete();
                return true;
            } else if (NotificationLite.isError(o)) {
                this.actual.onError(NotificationLite.getError(o));
                return true;
            } else {
                long r = get();
                if (r != 0) {
                    this.actual.onNext((Object) NotificationLite.getValue(o));
                    if (r != Long.MAX_VALUE) {
                        decrementAndGet();
                    }
                    return false;
                }
                cancel();
                this.actual.onError(new MissingBackpressureException("Could not deliver value due to lack of requests"));
                return true;
            }
        }

        void emitLoop() {
            AppendOnlyLinkedArrayList<Object> q;
            while (!this.cancelled) {
                synchronized (this) {
                    q = this.queue;
                    if (q == null) {
                        this.emitting = false;
                        return;
                    }
                    this.queue = null;
                }
                q.forEachWhile(this);
            }
        }

        public boolean isFull() {
            return get() == 0;
        }
    }
}
