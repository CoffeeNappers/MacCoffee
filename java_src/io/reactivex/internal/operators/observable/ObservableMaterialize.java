package io.reactivex.internal.operators.observable;

import io.reactivex.Notification;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
/* loaded from: classes3.dex */
public final class ObservableMaterialize<T> extends AbstractObservableWithUpstream<T, Notification<T>> {
    public ObservableMaterialize(ObservableSource<T> source) {
        super(source);
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super Notification<T>> t) {
        this.source.subscribe(new MaterializeObserver(t));
    }

    /* loaded from: classes3.dex */
    static final class MaterializeObserver<T> implements Observer<T>, Disposable {
        final Observer<? super Notification<T>> actual;
        Disposable s;

        MaterializeObserver(Observer<? super Notification<T>> actual) {
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
        public void onNext(T t) {
            this.actual.onNext(Notification.createOnNext(t));
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            Notification<T> v = Notification.createOnError(t);
            this.actual.onNext(v);
            this.actual.onComplete();
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            Notification<T> v = Notification.createOnComplete();
            this.actual.onNext(v);
            this.actual.onComplete();
        }
    }
}
