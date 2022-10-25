package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
/* loaded from: classes3.dex */
public final class ObservableCount<T> extends AbstractObservableWithUpstream<T, Long> {
    public ObservableCount(ObservableSource<T> source) {
        super(source);
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super Long> t) {
        this.source.subscribe(new CountObserver(t));
    }

    /* loaded from: classes3.dex */
    static final class CountObserver implements Observer<Object>, Disposable {
        final Observer<? super Long> actual;
        long count;
        Disposable s;

        CountObserver(Observer<? super Long> actual) {
            this.actual = actual;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.s.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.s.isDisposed();
        }

        @Override // io.reactivex.Observer
        public void onNext(Object t) {
            this.count++;
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.actual.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            this.actual.onNext(Long.valueOf(this.count));
            this.actual.onComplete();
        }
    }
}
