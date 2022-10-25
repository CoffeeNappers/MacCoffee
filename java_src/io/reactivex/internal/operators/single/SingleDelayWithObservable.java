package io.reactivex.internal.operators.single;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.observers.ResumeSingleObserver;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class SingleDelayWithObservable<T, U> extends Single<T> {
    final ObservableSource<U> other;
    final SingleSource<T> source;

    public SingleDelayWithObservable(SingleSource<T> source, ObservableSource<U> other) {
        this.source = source;
        this.other = other;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super T> subscriber) {
        this.other.subscribe(new OtherSubscriber(subscriber, this.source));
    }

    /* loaded from: classes3.dex */
    static final class OtherSubscriber<T, U> extends AtomicReference<Disposable> implements Observer<U>, Disposable {
        private static final long serialVersionUID = -8565274649390031272L;
        final SingleObserver<? super T> actual;
        boolean done;
        final SingleSource<T> source;

        OtherSubscriber(SingleObserver<? super T> actual, SingleSource<T> source) {
            this.actual = actual;
            this.source = source;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.set(this, d)) {
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(U value) {
            get().dispose();
            onComplete();
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable e) {
            if (this.done) {
                RxJavaPlugins.onError(e);
                return;
            }
            this.done = true;
            this.actual.onError(e);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                this.source.subscribe(new ResumeSingleObserver(this, this.actual));
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            DisposableHelper.dispose(this);
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return DisposableHelper.isDisposed(get());
        }
    }
}
