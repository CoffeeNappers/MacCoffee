package io.reactivex.internal.operators.completable;

import io.reactivex.Completable;
import io.reactivex.CompletableObserver;
import io.reactivex.CompletableSource;
import io.reactivex.annotations.Experimental;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Action;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicInteger;
@Experimental
/* loaded from: classes3.dex */
public final class CompletableDoFinally extends Completable {
    final Action onFinally;
    final CompletableSource source;

    public CompletableDoFinally(CompletableSource source, Action onFinally) {
        this.source = source;
        this.onFinally = onFinally;
    }

    @Override // io.reactivex.Completable
    protected void subscribeActual(CompletableObserver s) {
        this.source.subscribe(new DoFinallyObserver(s, this.onFinally));
    }

    /* loaded from: classes3.dex */
    static final class DoFinallyObserver extends AtomicInteger implements CompletableObserver, Disposable {
        private static final long serialVersionUID = 4109457741734051389L;
        final CompletableObserver actual;
        Disposable d;
        final Action onFinally;

        DoFinallyObserver(CompletableObserver actual, Action onFinally) {
            this.actual = actual;
            this.onFinally = onFinally;
        }

        @Override // io.reactivex.CompletableObserver
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.validate(this.d, d)) {
                this.d = d;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.CompletableObserver
        public void onError(Throwable t) {
            this.actual.onError(t);
            runFinally();
        }

        @Override // io.reactivex.CompletableObserver, io.reactivex.MaybeObserver
        public void onComplete() {
            this.actual.onComplete();
            runFinally();
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.d.dispose();
            runFinally();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.d.isDisposed();
        }

        void runFinally() {
            if (compareAndSet(0, 1)) {
                try {
                    this.onFinally.run();
                } catch (Throwable ex) {
                    Exceptions.throwIfFatal(ex);
                    RxJavaPlugins.onError(ex);
                }
            }
        }
    }
}
