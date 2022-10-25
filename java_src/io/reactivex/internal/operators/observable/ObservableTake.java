package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.plugins.RxJavaPlugins;
/* loaded from: classes3.dex */
public final class ObservableTake<T> extends AbstractObservableWithUpstream<T, T> {
    final long limit;

    public ObservableTake(ObservableSource<T> source, long limit) {
        super(source);
        this.limit = limit;
    }

    @Override // io.reactivex.Observable
    protected void subscribeActual(Observer<? super T> observer) {
        this.source.subscribe(new TakeObserver(observer, this.limit));
    }

    /* loaded from: classes3.dex */
    static final class TakeObserver<T> implements Observer<T>, Disposable {
        final Observer<? super T> actual;
        boolean done;
        long remaining;
        Disposable subscription;

        TakeObserver(Observer<? super T> actual, long limit) {
            this.actual = actual;
            this.remaining = limit;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.subscription, s)) {
                this.subscription = s;
                if (this.remaining == 0) {
                    this.done = true;
                    s.dispose();
                    EmptyDisposable.complete(this.actual);
                    return;
                }
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            if (!this.done) {
                long j = this.remaining;
                this.remaining = j - 1;
                if (j > 0) {
                    boolean stop = this.remaining == 0;
                    this.actual.onNext(t);
                    if (stop) {
                        onComplete();
                    }
                }
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
                return;
            }
            this.done = true;
            this.subscription.dispose();
            this.actual.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                this.subscription.dispose();
                this.actual.onComplete();
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.subscription.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.subscription.isDisposed();
        }
    }
}
