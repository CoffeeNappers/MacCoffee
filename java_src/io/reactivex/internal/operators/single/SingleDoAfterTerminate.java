package io.reactivex.internal.operators.single;

import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Action;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.plugins.RxJavaPlugins;
/* loaded from: classes3.dex */
public final class SingleDoAfterTerminate<T> extends Single<T> {
    final Action onAfterTerminate;
    final SingleSource<T> source;

    public SingleDoAfterTerminate(SingleSource<T> source, Action onAfterTerminate) {
        this.source = source;
        this.onAfterTerminate = onAfterTerminate;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super T> s) {
        this.source.subscribe(new DoAfterTerminateObserver(s, this.onAfterTerminate));
    }

    /* loaded from: classes3.dex */
    static final class DoAfterTerminateObserver<T> implements SingleObserver<T>, Disposable {
        final SingleObserver<? super T> actual;
        Disposable d;
        final Action onAfterTerminate;

        DoAfterTerminateObserver(SingleObserver<? super T> actual, Action onAfterTerminate) {
            this.actual = actual;
            this.onAfterTerminate = onAfterTerminate;
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
            onAfterTerminate();
        }

        @Override // io.reactivex.SingleObserver
        public void onError(Throwable e) {
            this.actual.onError(e);
            onAfterTerminate();
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.d.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.d.isDisposed();
        }

        private void onAfterTerminate() {
            try {
                this.onAfterTerminate.run();
            } catch (Throwable ex) {
                Exceptions.throwIfFatal(ex);
                RxJavaPlugins.onError(ex);
            }
        }
    }
}
