package io.reactivex.subjects;

import io.reactivex.Maybe;
import io.reactivex.MaybeObserver;
import io.reactivex.annotations.CheckReturnValue;
import io.reactivex.annotations.Experimental;
import io.reactivex.disposables.Disposable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
@Experimental
/* loaded from: classes.dex */
public final class MaybeSubject<T> extends Maybe<T> implements MaybeObserver<T> {
    static final MaybeDisposable[] EMPTY = new MaybeDisposable[0];
    static final MaybeDisposable[] TERMINATED = new MaybeDisposable[0];
    Throwable error;
    T value;
    final AtomicBoolean once = new AtomicBoolean();
    final AtomicReference<MaybeDisposable<T>[]> observers = new AtomicReference<>(EMPTY);

    @CheckReturnValue
    public static <T> MaybeSubject<T> create() {
        return new MaybeSubject<>();
    }

    MaybeSubject() {
    }

    @Override // io.reactivex.MaybeObserver
    public void onSubscribe(Disposable d) {
        if (this.observers.get() == TERMINATED) {
            d.dispose();
        }
    }

    @Override // io.reactivex.MaybeObserver
    public void onSuccess(T value) {
        if (value == null) {
            onError(new NullPointerException("Null values are not allowed in 2.x"));
        } else if (this.once.compareAndSet(false, true)) {
            this.value = value;
            MaybeDisposable<T>[] arr$ = this.observers.getAndSet(TERMINATED);
            for (MaybeDisposable<T> md : arr$) {
                md.actual.onSuccess(value);
            }
        }
    }

    @Override // io.reactivex.MaybeObserver
    public void onError(Throwable e) {
        if (e == null) {
            e = new NullPointerException("Null errors are not allowed in 2.x");
        }
        if (this.once.compareAndSet(false, true)) {
            this.error = e;
            MaybeDisposable<T>[] arr$ = this.observers.getAndSet(TERMINATED);
            for (MaybeDisposable<T> md : arr$) {
                md.actual.onError(e);
            }
            return;
        }
        RxJavaPlugins.onError(e);
    }

    @Override // io.reactivex.MaybeObserver
    public void onComplete() {
        if (this.once.compareAndSet(false, true)) {
            MaybeDisposable<T>[] arr$ = this.observers.getAndSet(TERMINATED);
            for (MaybeDisposable<T> md : arr$) {
                md.actual.onComplete();
            }
        }
    }

    @Override // io.reactivex.Maybe
    protected void subscribeActual(MaybeObserver<? super T> observer) {
        MaybeDisposable<T> md = new MaybeDisposable<>(observer, this);
        observer.onSubscribe(md);
        if (add(md)) {
            if (md.isDisposed()) {
                remove(md);
                return;
            }
            return;
        }
        Throwable ex = this.error;
        if (ex != null) {
            observer.onError(ex);
            return;
        }
        Object obj = (T) this.value;
        if (obj == null) {
            observer.onComplete();
        } else {
            observer.onSuccess(obj);
        }
    }

    boolean add(MaybeDisposable<T> inner) {
        MaybeDisposable<T>[] a;
        MaybeDisposable<T>[] b;
        do {
            a = this.observers.get();
            if (a == TERMINATED) {
                return false;
            }
            int n = a.length;
            b = new MaybeDisposable[n + 1];
            System.arraycopy(a, 0, b, 0, n);
            b[n] = inner;
        } while (!this.observers.compareAndSet(a, b));
        return true;
    }

    void remove(MaybeDisposable<T> inner) {
        MaybeDisposable<T>[] a;
        MaybeDisposable<T>[] b;
        do {
            a = this.observers.get();
            int n = a.length;
            if (n != 0) {
                int j = -1;
                int i = 0;
                while (true) {
                    if (i >= n) {
                        break;
                    } else if (a[i] != inner) {
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
                        b = new MaybeDisposable[n - 1];
                        System.arraycopy(a, 0, b, 0, j);
                        System.arraycopy(a, j + 1, b, j, (n - j) - 1);
                    }
                } else {
                    return;
                }
            } else {
                return;
            }
        } while (!this.observers.compareAndSet(a, b));
    }

    public T getValue() {
        if (this.observers.get() == TERMINATED) {
            return this.value;
        }
        return null;
    }

    public boolean hasValue() {
        return this.observers.get() == TERMINATED && this.value != null;
    }

    public Throwable getThrowable() {
        if (this.observers.get() == TERMINATED) {
            return this.error;
        }
        return null;
    }

    public boolean hasThrowable() {
        return this.observers.get() == TERMINATED && this.error != null;
    }

    public boolean hasComplete() {
        return this.observers.get() == TERMINATED && this.value == null && this.error == null;
    }

    public boolean hasObservers() {
        return this.observers.get().length != 0;
    }

    int observerCount() {
        return this.observers.get().length;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class MaybeDisposable<T> extends AtomicReference<MaybeSubject<T>> implements Disposable {
        private static final long serialVersionUID = -7650903191002190468L;
        final MaybeObserver<? super T> actual;

        MaybeDisposable(MaybeObserver<? super T> actual, MaybeSubject<T> parent) {
            this.actual = actual;
            lazySet(parent);
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            MaybeSubject<T> parent = getAndSet(null);
            if (parent != null) {
                parent.remove(this);
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return get() == null;
        }
    }
}
