package io.reactivex.subjects;

import io.reactivex.Completable;
import io.reactivex.CompletableObserver;
import io.reactivex.annotations.CheckReturnValue;
import io.reactivex.annotations.Experimental;
import io.reactivex.disposables.Disposable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
@Experimental
/* loaded from: classes.dex */
public final class CompletableSubject extends Completable implements CompletableObserver {
    static final CompletableDisposable[] EMPTY = new CompletableDisposable[0];
    static final CompletableDisposable[] TERMINATED = new CompletableDisposable[0];
    Throwable error;
    final AtomicBoolean once = new AtomicBoolean();
    final AtomicReference<CompletableDisposable[]> observers = new AtomicReference<>(EMPTY);

    @CheckReturnValue
    public static CompletableSubject create() {
        return new CompletableSubject();
    }

    CompletableSubject() {
    }

    @Override // io.reactivex.CompletableObserver
    public void onSubscribe(Disposable d) {
        if (this.observers.get() == TERMINATED) {
            d.dispose();
        }
    }

    @Override // io.reactivex.CompletableObserver
    public void onError(Throwable e) {
        if (e == null) {
            e = new NullPointerException("Null errors are not allowed in 2.x");
        }
        if (this.once.compareAndSet(false, true)) {
            this.error = e;
            CompletableDisposable[] arr$ = this.observers.getAndSet(TERMINATED);
            for (CompletableDisposable md : arr$) {
                md.actual.onError(e);
            }
            return;
        }
        RxJavaPlugins.onError(e);
    }

    @Override // io.reactivex.CompletableObserver, io.reactivex.MaybeObserver
    public void onComplete() {
        if (this.once.compareAndSet(false, true)) {
            CompletableDisposable[] arr$ = this.observers.getAndSet(TERMINATED);
            for (CompletableDisposable md : arr$) {
                md.actual.onComplete();
            }
        }
    }

    @Override // io.reactivex.Completable
    protected void subscribeActual(CompletableObserver observer) {
        CompletableDisposable md = new CompletableDisposable(observer, this);
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
        } else {
            observer.onComplete();
        }
    }

    boolean add(CompletableDisposable inner) {
        CompletableDisposable[] a;
        CompletableDisposable[] b;
        do {
            a = this.observers.get();
            if (a == TERMINATED) {
                return false;
            }
            int n = a.length;
            b = new CompletableDisposable[n + 1];
            System.arraycopy(a, 0, b, 0, n);
            b[n] = inner;
        } while (!this.observers.compareAndSet(a, b));
        return true;
    }

    void remove(CompletableDisposable inner) {
        CompletableDisposable[] a;
        CompletableDisposable[] b;
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
                        b = new CompletableDisposable[n - 1];
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
        return this.observers.get() == TERMINATED && this.error == null;
    }

    public boolean hasObservers() {
        return this.observers.get().length != 0;
    }

    int observerCount() {
        return this.observers.get().length;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class CompletableDisposable extends AtomicReference<CompletableSubject> implements Disposable {
        private static final long serialVersionUID = -7650903191002190468L;
        final CompletableObserver actual;

        CompletableDisposable(CompletableObserver actual, CompletableSubject parent) {
            this.actual = actual;
            lazySet(parent);
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            CompletableSubject parent = getAndSet(null);
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
