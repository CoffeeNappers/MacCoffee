package io.reactivex.internal.operators.observable;

import io.reactivex.Completable;
import io.reactivex.CompletableObserver;
import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.fuseable.FuseToObservable;
import io.reactivex.plugins.RxJavaPlugins;
/* loaded from: classes3.dex */
public final class ObservableIgnoreElementsCompletable<T> extends Completable implements FuseToObservable<T> {
    final ObservableSource<T> source;

    public ObservableIgnoreElementsCompletable(ObservableSource<T> source) {
        this.source = source;
    }

    @Override // io.reactivex.Completable
    public void subscribeActual(CompletableObserver t) {
        this.source.subscribe(new IgnoreObservable(t));
    }

    @Override // io.reactivex.internal.fuseable.FuseToObservable
    public Observable<T> fuseToObservable() {
        return RxJavaPlugins.onAssembly(new ObservableIgnoreElements(this.source));
    }

    /* loaded from: classes3.dex */
    static final class IgnoreObservable<T> implements Observer<T>, Disposable {
        final CompletableObserver actual;
        Disposable d;

        IgnoreObservable(CompletableObserver t) {
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
