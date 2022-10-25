package io.reactivex.internal.operators.completable;

import io.reactivex.Completable;
import io.reactivex.CompletableObserver;
import io.reactivex.CompletableSource;
import io.reactivex.Scheduler;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.plugins.RxJavaPlugins;
/* loaded from: classes3.dex */
public final class CompletableDisposeOn extends Completable {
    final Scheduler scheduler;
    final CompletableSource source;

    public CompletableDisposeOn(CompletableSource source, Scheduler scheduler) {
        this.source = source;
        this.scheduler = scheduler;
    }

    @Override // io.reactivex.Completable
    protected void subscribeActual(CompletableObserver s) {
        this.source.subscribe(new CompletableObserverImplementation(s, this.scheduler));
    }

    /* loaded from: classes3.dex */
    static final class CompletableObserverImplementation implements CompletableObserver, Disposable, Runnable {
        Disposable d;
        volatile boolean disposed;
        final CompletableObserver s;
        final Scheduler scheduler;

        CompletableObserverImplementation(CompletableObserver s, Scheduler scheduler) {
            this.s = s;
            this.scheduler = scheduler;
        }

        @Override // io.reactivex.CompletableObserver, io.reactivex.MaybeObserver
        public void onComplete() {
            if (!this.disposed) {
                this.s.onComplete();
            }
        }

        @Override // io.reactivex.CompletableObserver
        public void onError(Throwable e) {
            if (this.disposed) {
                RxJavaPlugins.onError(e);
            } else {
                this.s.onError(e);
            }
        }

        @Override // io.reactivex.CompletableObserver
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.validate(this.d, d)) {
                this.d = d;
                this.s.onSubscribe(this);
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.disposed = true;
            this.scheduler.scheduleDirect(this);
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.disposed;
        }

        @Override // java.lang.Runnable
        public void run() {
            this.d.dispose();
            this.d = DisposableHelper.DISPOSED;
        }
    }
}
