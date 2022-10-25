package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.BiFunction;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.plugins.RxJavaPlugins;
/* loaded from: classes3.dex */
public final class ObservableReduceSeedSingle<T, R> extends Single<R> {
    final BiFunction<R, ? super T, R> reducer;
    final R seed;
    final ObservableSource<T> source;

    public ObservableReduceSeedSingle(ObservableSource<T> source, R seed, BiFunction<R, ? super T, R> reducer) {
        this.source = source;
        this.seed = seed;
        this.reducer = reducer;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super R> observer) {
        this.source.subscribe(new ReduceSeedObserver(observer, this.reducer, this.seed));
    }

    /* loaded from: classes3.dex */
    static final class ReduceSeedObserver<T, R> implements Observer<T>, Disposable {
        final SingleObserver<? super R> actual;
        Disposable d;
        final BiFunction<R, ? super T, R> reducer;
        R value;

        /* JADX INFO: Access modifiers changed from: package-private */
        public ReduceSeedObserver(SingleObserver<? super R> actual, BiFunction<R, ? super T, R> reducer, R value) {
            this.actual = actual;
            this.value = value;
            this.reducer = reducer;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.validate(this.d, d)) {
                this.d = d;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T value) {
            R v = this.value;
            if (v != null) {
                try {
                    this.value = (R) ObjectHelper.requireNonNull(this.reducer.apply(v, value), "The reducer returned a null value");
                } catch (Throwable ex) {
                    Exceptions.throwIfFatal(ex);
                    this.d.dispose();
                    onError(ex);
                }
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable e) {
            R v = this.value;
            this.value = null;
            if (v != null) {
                this.actual.onError(e);
            } else {
                RxJavaPlugins.onError(e);
            }
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            R v = this.value;
            this.value = null;
            if (v != null) {
                this.actual.onSuccess(v);
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.d.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.d.isDisposed();
        }
    }
}
