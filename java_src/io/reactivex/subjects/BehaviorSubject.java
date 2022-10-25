package io.reactivex.subjects;

import io.reactivex.Observer;
import io.reactivex.annotations.CheckReturnValue;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.util.AppendOnlyLinkedArrayList;
import io.reactivex.internal.util.NotificationLite;
import io.reactivex.plugins.RxJavaPlugins;
import java.lang.reflect.Array;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;
/* loaded from: classes.dex */
public final class BehaviorSubject<T> extends Subject<T> {
    boolean done;
    long index;
    final ReadWriteLock lock;
    final Lock readLock;
    final AtomicReference<BehaviorDisposable<T>[]> subscribers;
    final AtomicReference<Object> value;
    final Lock writeLock;
    private static final Object[] EMPTY_ARRAY = new Object[0];
    static final BehaviorDisposable[] EMPTY = new BehaviorDisposable[0];
    static final BehaviorDisposable[] TERMINATED = new BehaviorDisposable[0];

    @CheckReturnValue
    public static <T> BehaviorSubject<T> create() {
        return new BehaviorSubject<>();
    }

    @CheckReturnValue
    public static <T> BehaviorSubject<T> createDefault(T defaultValue) {
        return new BehaviorSubject<>(defaultValue);
    }

    BehaviorSubject() {
        this.lock = new ReentrantReadWriteLock();
        this.readLock = this.lock.readLock();
        this.writeLock = this.lock.writeLock();
        this.subscribers = new AtomicReference<>(EMPTY);
        this.value = new AtomicReference<>();
    }

    BehaviorSubject(T defaultValue) {
        this();
        this.value.lazySet(ObjectHelper.requireNonNull(defaultValue, "defaultValue is null"));
    }

    @Override // io.reactivex.Observable
    protected void subscribeActual(Observer<? super T> observer) {
        BehaviorDisposable<T> bs = new BehaviorDisposable<>(observer, this);
        observer.onSubscribe(bs);
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
            observer.onComplete();
        } else {
            observer.onError(NotificationLite.getError(o));
        }
    }

    @Override // io.reactivex.Observer
    public void onSubscribe(Disposable s) {
        if (this.done) {
            s.dispose();
        }
    }

    @Override // io.reactivex.Observer
    public void onNext(T t) {
        if (t == null) {
            onError(new NullPointerException("onNext called with null. Null values are generally not allowed in 2.x operators and sources."));
        } else if (!this.done) {
            Object o = NotificationLite.next(t);
            setCurrent(o);
            BehaviorDisposable<T>[] arr$ = this.subscribers.get();
            for (BehaviorDisposable<T> bs : arr$) {
                bs.emitNext(o, this.index);
            }
        }
    }

    @Override // io.reactivex.Observer
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
        BehaviorDisposable<T>[] arr$ = terminate(o);
        for (BehaviorDisposable<T> bs : arr$) {
            bs.emitNext(o, this.index);
        }
    }

    @Override // io.reactivex.Observer
    public void onComplete() {
        if (!this.done) {
            this.done = true;
            Object o = NotificationLite.complete();
            BehaviorDisposable<T>[] arr$ = terminate(o);
            for (BehaviorDisposable<T> bs : arr$) {
                bs.emitNext(o, this.index);
            }
        }
    }

    @Override // io.reactivex.subjects.Subject
    public boolean hasObservers() {
        return this.subscribers.get().length != 0;
    }

    int subscriberCount() {
        return this.subscribers.get().length;
    }

    @Override // io.reactivex.subjects.Subject
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

    @Override // io.reactivex.subjects.Subject
    public boolean hasComplete() {
        Object o = this.value.get();
        return NotificationLite.isComplete(o);
    }

    @Override // io.reactivex.subjects.Subject
    public boolean hasThrowable() {
        Object o = this.value.get();
        return NotificationLite.isError(o);
    }

    public boolean hasValue() {
        Object o = this.value.get();
        return o != null && !NotificationLite.isComplete(o) && !NotificationLite.isError(o);
    }

    boolean add(BehaviorDisposable<T> rs) {
        BehaviorDisposable<T>[] a;
        BehaviorDisposable<T>[] b;
        do {
            a = this.subscribers.get();
            if (a == TERMINATED) {
                return false;
            }
            int len = a.length;
            b = new BehaviorDisposable[len + 1];
            System.arraycopy(a, 0, b, 0, len);
            b[len] = rs;
        } while (!this.subscribers.compareAndSet(a, b));
        return true;
    }

    void remove(BehaviorDisposable<T> rs) {
        BehaviorDisposable<T>[] a;
        BehaviorDisposable<T>[] b;
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
                        b = new BehaviorDisposable[len - 1];
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

    BehaviorDisposable<T>[] terminate(Object terminalValue) {
        BehaviorDisposable<T>[] a = this.subscribers.get();
        if (a != TERMINATED && (a = this.subscribers.getAndSet(TERMINATED)) != TERMINATED) {
            setCurrent(terminalValue);
        }
        return a;
    }

    void setCurrent(Object o) {
        this.writeLock.lock();
        try {
            this.index++;
            this.value.lazySet(o);
        } finally {
            this.writeLock.unlock();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class BehaviorDisposable<T> implements Disposable, AppendOnlyLinkedArrayList.NonThrowingPredicate<Object> {
        final Observer<? super T> actual;
        volatile boolean cancelled;
        boolean emitting;
        boolean fastPath;
        long index;
        boolean next;
        AppendOnlyLinkedArrayList<Object> queue;
        final BehaviorSubject<T> state;

        BehaviorDisposable(Observer<? super T> actual, BehaviorSubject<T> state) {
            this.actual = actual;
            this.state = state;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.state.remove(this);
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.cancelled;
        }

        void emitFirst() {
            boolean z = true;
            if (!this.cancelled) {
                synchronized (this) {
                    if (!this.cancelled) {
                        if (!this.next) {
                            BehaviorSubject<T> s = this.state;
                            Lock lock = s.readLock;
                            lock.lock();
                            this.index = s.index;
                            Object o = s.value.get();
                            lock.unlock();
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
            return this.cancelled || NotificationLite.accept(o, this.actual);
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
    }
}
