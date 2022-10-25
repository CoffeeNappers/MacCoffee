package io.reactivex.internal.operators.single;

import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Action;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class SingleDoOnDispose<T> extends Single<T> {
    final Action onDispose;
    final SingleSource<T> source;

    public SingleDoOnDispose(SingleSource<T> source, Action onDispose) {
        this.source = source;
        this.onDispose = onDispose;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super T> s) {
        this.source.subscribe(new DoOnDisposeObserver(s, this.onDispose));
    }

    /* loaded from: classes3.dex */
    static final class DoOnDisposeObserver<T> extends AtomicReference<Action> implements SingleObserver<T>, Disposable {
        private static final long serialVersionUID = -8583764624474935784L;
        final SingleObserver<? super T> actual;
        Disposable d;

        DoOnDisposeObserver(SingleObserver<? super T> actual, Action onDispose) {
            this.actual = actual;
            lazySet(onDispose);
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            Action a = getAndSet(null);
            if (a != null) {
                try {
                    a.run();
                } catch (Throwable ex) {
                    Exceptions.throwIfFatal(ex);
                    RxJavaPlugins.onError(ex);
                }
                this.d.dispose();
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.d.isDisposed();
        }

        @Override // io.reactivex.SingleObserver
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.validate(this.d, d)) {
                this.d = d;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.SingleObserver
        public void onSuccess(T value) {
            this.actual.onSuccess(value);
        }

        @Override // io.reactivex.SingleObserver
        public void onError(Throwable e) {
            this.actual.onError(e);
        }
    }
}
