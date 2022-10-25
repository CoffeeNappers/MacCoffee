package io.reactivex.internal.observers;

import io.reactivex.SingleObserver;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.util.BlockingHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.CancellationException;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class FutureSingleObserver<T> extends CountDownLatch implements SingleObserver<T>, Future<T>, Disposable {
    Throwable error;
    final AtomicReference<Disposable> s;
    T value;

    public FutureSingleObserver() {
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

    @Override // io.reactivex.SingleObserver
    public void onSubscribe(Disposable s) {
        DisposableHelper.setOnce(this.s, s);
    }

    @Override // io.reactivex.SingleObserver
    public void onSuccess(T t) {
        Disposable a = this.s.get();
        if (a != DisposableHelper.DISPOSED) {
            this.value = t;
            this.s.compareAndSet(a, this);
            countDown();
        }
    }

    @Override // io.reactivex.SingleObserver
    public void onError(Throwable t) {
        Disposable a;
        do {
            a = this.s.get();
            if (a == DisposableHelper.DISPOSED) {
                RxJavaPlugins.onError(t);
                return;
            }
            this.error = t;
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
