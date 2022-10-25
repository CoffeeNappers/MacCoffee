package io.reactivex.internal.observers;

import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.fuseable.QueueDisposable;
import io.reactivex.plugins.RxJavaPlugins;
/* loaded from: classes3.dex */
public abstract class BasicFuseableObserver<T, R> implements Observer<T>, QueueDisposable<R> {
    protected final Observer<? super R> actual;
    protected boolean done;
    protected QueueDisposable<T> qs;
    protected Disposable s;
    protected int sourceMode;

    public BasicFuseableObserver(Observer<? super R> actual) {
        this.actual = actual;
    }

    @Override // io.reactivex.Observer
    public final void onSubscribe(Disposable s) {
        if (DisposableHelper.validate(this.s, s)) {
            this.s = s;
            if (s instanceof QueueDisposable) {
                this.qs = (QueueDisposable) s;
            }
            if (beforeDownstream()) {
                this.actual.onSubscribe(this);
                afterDownstream();
            }
        }
    }

    protected boolean beforeDownstream() {
        return true;
    }

    protected void afterDownstream() {
    }

    @Override // io.reactivex.Observer
    public void onError(Throwable t) {
        if (this.done) {
            RxJavaPlugins.onError(t);
            return;
        }
        this.done = true;
        this.actual.onError(t);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void fail(Throwable t) {
        Exceptions.throwIfFatal(t);
        this.s.dispose();
        onError(t);
    }

    @Override // io.reactivex.Observer
    public void onComplete() {
        if (!this.done) {
            this.done = true;
            this.actual.onComplete();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final int transitiveBoundaryFusion(int mode) {
        QueueDisposable<T> qs = this.qs;
        if (qs == null || (mode & 4) != 0) {
            return 0;
        }
        int m = qs.requestFusion(mode);
        if (m != 0) {
            this.sourceMode = m;
            return m;
        }
        return m;
    }

    @Override // io.reactivex.disposables.Disposable
    public void dispose() {
        this.s.dispose();
    }

    @Override // io.reactivex.disposables.Disposable
    public boolean isDisposed() {
        return this.s.isDisposed();
    }

    @Override // io.reactivex.internal.fuseable.SimpleQueue
    public boolean isEmpty() {
        return this.qs.isEmpty();
    }

    @Override // io.reactivex.internal.fuseable.SimpleQueue
    public void clear() {
        this.qs.clear();
    }

    @Override // io.reactivex.internal.fuseable.SimpleQueue
    public final boolean offer(R e) {
        throw new UnsupportedOperationException("Should not be called!");
    }

    @Override // io.reactivex.internal.fuseable.SimpleQueue
    public final boolean offer(R v1, R v2) {
        throw new UnsupportedOperationException("Should not be called!");
    }
}
