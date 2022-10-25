package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
/* loaded from: classes3.dex */
public final class ObservableIgnoreElements<T> extends AbstractObservableWithUpstream<T, T> {
    public ObservableIgnoreElements(ObservableSource<T> source) {
        super(source);
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> t) {
        this.source.subscribe(new IgnoreObservable(t));
    }

    /* loaded from: classes3.dex */
    static final class IgnoreObservable<T> implements Observer<T>, Disposable {
        final Observer<? super T> actual;
        Disposable d;

        IgnoreObservable(Observer<? super T> t) {
            this.actual = t;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            this.d = s;
            this.actual.onSubscribe(this);
        }

        @Override // io.reactivex.Observer
        public void onNext(T v) {
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable e) {
            this.actual.onError(e);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            this.actual.onComplete();
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
