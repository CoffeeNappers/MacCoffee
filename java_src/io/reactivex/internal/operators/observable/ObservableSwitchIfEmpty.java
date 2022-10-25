package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.SequentialDisposable;
/* loaded from: classes3.dex */
public final class ObservableSwitchIfEmpty<T> extends AbstractObservableWithUpstream<T, T> {
    final ObservableSource<? extends T> other;

    public ObservableSwitchIfEmpty(ObservableSource<T> source, ObservableSource<? extends T> other) {
        super(source);
        this.other = other;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> t) {
        SwitchIfEmptyObserver<T> parent = new SwitchIfEmptyObserver<>(t, this.other);
        t.onSubscribe(parent.arbiter);
        this.source.subscribe(parent);
    }

    /* loaded from: classes3.dex */
    static final class SwitchIfEmptyObserver<T> implements Observer<T> {
        final Observer<? super T> actual;
        final ObservableSource<? extends T> other;
        boolean empty = true;
        final SequentialDisposable arbiter = new SequentialDisposable();

        SwitchIfEmptyObserver(Observer<? super T> actual, ObservableSource<? extends T> other) {
            this.actual = actual;
            this.other = other;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            this.arbiter.update(s);
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            if (this.empty) {
                this.empty = false;
            }
            this.actual.onNext(t);
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.actual.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            if (this.empty) {
                this.empty = false;
                this.other.subscribe(this);
                return;
            }
            this.actual.onComplete();
        }
    }
}
