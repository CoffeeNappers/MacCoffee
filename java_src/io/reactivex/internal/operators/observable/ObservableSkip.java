package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
/* loaded from: classes3.dex */
public final class ObservableSkip<T> extends AbstractObservableWithUpstream<T, T> {
    final long n;

    public ObservableSkip(ObservableSource<T> source, long n) {
        super(source);
        this.n = n;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> s) {
        this.source.subscribe(new SkipObserver(s, this.n));
    }

    /* loaded from: classes3.dex */
    static final class SkipObserver<T> implements Observer<T>, Disposable {
        final Observer<? super T> actual;
        Disposable d;
        long remaining;

        SkipObserver(Observer<? super T> actual, long n) {
            this.actual = actual;
            this.remaining = n;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            this.d = s;
            this.actual.onSubscribe(this);
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            if (this.remaining != 0) {
                this.remaining--;
            } else {
                this.actual.onNext(t);
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.actual.onError(t);
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
