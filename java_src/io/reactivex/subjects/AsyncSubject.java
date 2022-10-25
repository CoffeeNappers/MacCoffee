package io.reactivex.subjects;

import io.reactivex.Observer;
import io.reactivex.annotations.CheckReturnValue;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.observers.DeferredScalarDisposable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public final class AsyncSubject<T> extends Subject<T> {
    static final AsyncDisposable[] EMPTY = new AsyncDisposable[0];
    static final AsyncDisposable[] TERMINATED = new AsyncDisposable[0];
    Throwable error;
    final AtomicReference<AsyncDisposable<T>[]> subscribers = new AtomicReference<>(EMPTY);
    T value;

    @CheckReturnValue
    public static <T> AsyncSubject<T> create() {
        return new AsyncSubject<>();
    }

    AsyncSubject() {
    }

    @Override // io.reactivex.Observer
    public void onSubscribe(Disposable s) {
        if (this.subscribers.get() == TERMINATED) {
            s.dispose();
        }
    }

    @Override // io.reactivex.Observer
    public void onNext(T t) {
        if (this.subscribers.get() != TERMINATED) {
            if (t == null) {
                nullOnNext();
            } else {
                this.value = t;
            }
        }
    }

    void nullOnNext() {
        this.value = null;
        Throwable ex = new NullPointerException("onNext called with null. Null values are generally not allowed in 2.x operators and sources.");
        this.error = ex;
        AsyncDisposable<T>[] arr$ = this.subscribers.getAndSet(TERMINATED);
        for (AsyncDisposable<T> as : arr$) {
            as.onError(ex);
        }
    }

    @Override // io.reactivex.Observer
    public void onError(Throwable t) {
        if (t == null) {
            t = new NullPointerException("onError called with null. Null values are generally not allowed in 2.x operators and sources.");
        }
        if (this.subscribers.get() == TERMINATED) {
            RxJavaPlugins.onError(t);
            return;
        }
        this.value = null;
        this.error = t;
        AsyncDisposable<T>[] arr$ = this.subscribers.getAndSet(TERMINATED);
        for (AsyncDisposable<T> as : arr$) {
            as.onError(t);
        }
    }

    @Override // io.reactivex.Observer
    public void onComplete() {
        if (this.subscribers.get() != TERMINATED) {
            T v = this.value;
            AsyncDisposable<T>[] array = this.subscribers.getAndSet(TERMINATED);
            if (v == null) {
                for (AsyncDisposable<T> as : array) {
                    as.onComplete();
                }
                return;
            }
            for (AsyncDisposable<T> as2 : array) {
                as2.complete(v);
            }
        }
    }

    @Override // io.reactivex.subjects.Subject
    public boolean hasObservers() {
        return this.subscribers.get().length != 0;
    }

    @Override // io.reactivex.subjects.Subject
    public boolean hasThrowable() {
        return this.subscribers.get() == TERMINATED && this.error != null;
    }

    @Override // io.reactivex.subjects.Subject
    public boolean hasComplete() {
        return this.subscribers.get() == TERMINATED && this.error == null;
    }

    @Override // io.reactivex.subjects.Subject
    public Throwable getThrowable() {
        if (this.subscribers.get() == TERMINATED) {
            return this.error;
        }
        return null;
    }

    @Override // io.reactivex.Observable
    protected void subscribeActual(Observer<? super T> s) {
        AsyncDisposable<T> as = new AsyncDisposable<>(s, this);
        s.onSubscribe(as);
        if (add(as)) {
            if (as.isDisposed()) {
                remove(as);
                return;
            }
            return;
        }
        Throwable ex = this.error;
        if (ex != null) {
            s.onError(ex);
            return;
        }
        T v = this.value;
        if (v != null) {
            as.complete(v);
        } else {
            as.onComplete();
        }
    }

    boolean add(AsyncDisposable<T> ps) {
        AsyncDisposable<T>[] a;
        AsyncDisposable<T>[] b;
        do {
            a = this.subscribers.get();
            if (a == TERMINATED) {
                return false;
            }
            int n = a.length;
            b = new AsyncDisposable[n + 1];
            System.arraycopy(a, 0, b, 0, n);
            b[n] = ps;
        } while (!this.subscribers.compareAndSet(a, b));
        return true;
    }

    void remove(AsyncDisposable<T> ps) {
        AsyncDisposable<T>[] a;
        AsyncDisposable<T>[] b;
        do {
            a = this.subscribers.get();
            int n = a.length;
            if (n != 0) {
                int j = -1;
                int i = 0;
                while (true) {
                    if (i >= n) {
                        break;
                    } else if (a[i] != ps) {
                        i++;
                    } else {
                        j = i;
                        break;
                    }
                }
                if (j >= 0) {
                    if (n == 1) {
                        b = EMPTY;
                    } else {
                        b = new AsyncDisposable[n - 1];
                        System.arraycopy(a, 0, b, 0, j);
                        System.arraycopy(a, j + 1, b, j, (n - j) - 1);
                    }
                } else {
                    return;
                }
            } else {
                return;
            }
        } while (!this.subscribers.compareAndSet(a, b));
    }

    public boolean hasValue() {
        return this.subscribers.get() == TERMINATED && this.value != null;
    }

    public T getValue() {
        if (this.subscribers.get() == TERMINATED) {
            return this.value;
        }
        return null;
    }

    public Object[] getValues() {
        T v = getValue();
        return v != null ? new Object[]{v} : new Object[0];
    }

    public T[] getValues(T[] array) {
        T v = getValue();
        if (v == null) {
            if (array.length != 0) {
                array[0] = null;
            }
            return array;
        }
        if (array.length == 0) {
            array = (T[]) Arrays.copyOf(array, 1);
        }
        array[0] = v;
        if (array.length != 1) {
            array[1] = null;
        }
        return array;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class AsyncDisposable<T> extends DeferredScalarDisposable<T> {
        private static final long serialVersionUID = 5629876084736248016L;
        final AsyncSubject<T> parent;

        AsyncDisposable(Observer<? super T> actual, AsyncSubject<T> parent) {
            super(actual);
            this.parent = parent;
        }

        @Override // io.reactivex.internal.observers.DeferredScalarDisposable, io.reactivex.disposables.Disposable
        public void dispose() {
            if (super.tryDispose()) {
                this.parent.remove(this);
            }
        }

        void onComplete() {
            if (!isDisposed()) {
                this.actual.onComplete();
            }
        }

        void onError(Throwable t) {
            if (isDisposed()) {
                RxJavaPlugins.onError(t);
            } else {
                this.actual.onError(t);
            }
        }
    }
}
