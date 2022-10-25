package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.util.EmptyComponent;
/* loaded from: classes3.dex */
public final class ObservableDetach<T> extends AbstractObservableWithUpstream<T, T> {
    public ObservableDetach(ObservableSource<T> source) {
        super(source);
    }

    @Override // io.reactivex.Observable
    protected void subscribeActual(Observer<? super T> s) {
        this.source.subscribe(new DetachObserver(s));
    }

    /* loaded from: classes3.dex */
    static final class DetachObserver<T> implements Observer<T>, Disposable {
        Observer<? super T> actual;
        Disposable s;

        DetachObserver(Observer<? super T> actual) {
            this.actual = actual;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            Disposable s = this.s;
            this.s = EmptyComponent.INSTANCE;
            this.actual = EmptyComponent.asObserver();
            s.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.s.isDisposed();
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            this.actual.onNext(t);
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            Observer<? super T> a = this.actual;
            this.s = EmptyComponent.INSTANCE;
            this.actual = EmptyComponent.asObserver();
            a.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            Observer<? super T> a = this.actual;
            this.s = EmptyComponent.INSTANCE;
            this.actual = EmptyComponent.asObserver();
            a.onComplete();
        }
    }
}
