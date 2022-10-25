package io.reactivex.internal.operators.single;

import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.annotations.Experimental;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Action;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicInteger;
@Experimental
/* loaded from: classes3.dex */
public final class SingleDoFinally<T> extends Single<T> {
    final Action onFinally;
    final SingleSource<T> source;

    public SingleDoFinally(SingleSource<T> source, Action onFinally) {
        this.source = source;
        this.onFinally = onFinally;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super T> s) {
        this.source.subscribe(new DoFinallyObserver(s, this.onFinally));
    }

    /* loaded from: classes3.dex */
    static final class DoFinallyObserver<T> extends AtomicInteger implements SingleObserver<T>, Disposable {
        private static final long serialVersionUID = 4109457741734051389L;
        final SingleObserver<? super T> actual;
        Disposable d;
        final Action onFinally;

        DoFinallyObserver(SingleObserver<? super T> actual, Action onFinally) {
            this.actual = actual;
            this.onFinally = onFinally;
        }

        @Override // io.reactivex.SingleObserver
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.validate(this.d, d)) {
                this.d = d;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.SingleObserver
        public void onSuccess(T t) {
            this.actual.onSuccess(t);
            runFinally();
        }

        @Override // io.reactivex.SingleObserver
        public void onError(Throwable t) {
            this.actual.onError(t);
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
