package io.reactivex.internal.observers;

import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.util.BlockingHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.NoSuchElementException;
import java.util.concurrent.CancellationException;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class FutureObserver<T> extends CountDownLatch implements Observer<T>, Future<T>, Disposable {
    Throwable error;
    final AtomicReference<Disposable> s;
    T value;

    public FutureObserver() {
        super(1);
        this.s = new AtomicReference<>();
    }

    @Override // java.util.concurrent.Future
    public boolean cancel(boolean mayInterruptIfRunning) {
        Disposable a;
        do {
            a = this.s.get();
            if (a == this || a == DisposableHelper.DISPOSED) {
                return false;
            }
        } while (!this.s.compareAndSet(a, DisposableHelper.DISPOSED));
        if (a != null) {
            a.dispose();
        }
        countDown();
        return true;
    }

    @Override // java.util.concurrent.Future
    public boolean isCancelled() {
        return DisposableHelper.isDisposed(this.s.get());
    }

    @Override // java.util.concurrent.Future
    public boolean isDone() {
        return getCount() == 0;
    }

    @Override // java.util.concurrent.Future
    public T get() throws InterruptedException, ExecutionException {
        if (getCount() != 0) {
            BlockingHelper.verifyNonBlocking();
            await();
        }
        if (isCancelled()) {
            throw new CancellationException();
        }
        Throwable ex = this.error;
        if (ex != null) {
            throw new ExecutionException(ex);
        }
        return this.value;
    }

    @Override // java.util.concurrent.Future
    public T get(long timeout, TimeUnit unit) throws InterruptedException, ExecutionException, TimeoutException {
        if (getCount() != 0) {
            BlockingHelper.verifyNonBlocking();
            if (!await(timeout, unit)) {
                throw new TimeoutException();
            }
        }
        if (isCancelled()) {
            throw new CancellationException();
        }
        Throwable ex = this.error;
        if (ex != null) {
            throw new ExecutionException(ex);
        }
        return this.value;
    }

    @Override // io.reactivex.Observer
    public void onSubscribe(Disposable s) {
        DisposableHelper.setOnce(this.s, s);
    }

    @Override // io.reactivex.Observer
    public void onNext(T t) {
        if (this.value != null) {
            this.s.get().dispose();
            onError(new IndexOutOfBoundsException("More than one element received"));
            return;
        }
        this.value = t;
    }

    @Override // io.reactivex.Observer
    public void onError(Throwable t) {
        Disposable a;
        if (this.error == null) {
            this.error = t;
            do {
                a = this.s.get();
                if (a == this || a == DisposableHelper.DISPOSED) {
                    RxJavaPlugins.onError(t);
                    return;
                }
            } while (!this.s.compareAndSet(a, this));
            countDown();
            return;
        }
        RxJavaPlugins.onError(t);
    }

    @Override // io.reactivex.Observer
    public void onComplete() {
        Disposable a;
        if (this.value == null) {
            onError(new NoSuchElementException("The source is empty"));
            return;
        }
        do {
            a = this.s.get();
            if (a == this || a == DisposableHelper.DISPOSED) {
                return;
            }
        } while (!this.s.compareAndSet(a, this));
        countDown();
    }

    @Override // io.reactivex.disposables.Disposable
    public void dispose() {
    }

    @Override // io.reactivex.disposables.Disposable
    public boolean isDisposed() {
        return isDone();
    }
}
