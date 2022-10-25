package io.reactivex.internal.operators.observable;

import io.reactivex.Notification;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.plugins.RxJavaPlugins;
/* loaded from: classes3.dex */
public final class ObservableDematerialize<T> extends AbstractObservableWithUpstream<Notification<T>, T> {
    public ObservableDematerialize(ObservableSource<Notification<T>> source) {
        super(source);
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> t) {
        this.source.subscribe(new DematerializeObserver(t));
    }

    /* loaded from: classes3.dex */
    static final class DematerializeObserver<T> implements Observer<Notification<T>>, Disposable {
        final Observer<? super T> actual;
        boolean done;
        Disposable s;

        @Override // io.reactivex.Observer
        public /* bridge */ /* synthetic */ void onNext(Object x0) {
            onNext((Notification) ((Notification) x0));
        }

        DematerializeObserver(Observer<? super T> actual) {
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

        public void onNext(Notification<T> t) {
            if (this.done) {
                if (t.isOnError()) {
                    RxJavaPlugins.onError(t.getError());
                }
            } else if (t.isOnError()) {
                this.s.dispose();
                onError(t.getError());
            } else if (t.isOnComplete()) {
                this.s.dispose();
                onComplete();
            } else {
                this.actual.onNext(t.getValue());
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
                return;
            }
            this.done = true;
            this.actual.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                this.actual.onComplete();
            }
        }
    }
}
