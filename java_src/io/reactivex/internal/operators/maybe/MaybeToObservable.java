package io.reactivex.internal.operators.maybe;

import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.Observable;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.fuseable.HasUpstreamMaybeSource;
import io.reactivex.internal.observers.DeferredScalarDisposable;
/* loaded from: classes3.dex */
public final class MaybeToObservable<T> extends Observable<T> implements HasUpstreamMaybeSource<T> {
    final MaybeSource<T> source;

    public MaybeToObservable(MaybeSource<T> source) {
        this.source = source;
    }

    @Override // io.reactivex.internal.fuseable.HasUpstreamMaybeSource
    public MaybeSource<T> source() {
        return this.source;
    }

    @Override // io.reactivex.Observable
    protected void subscribeActual(Observer<? super T> s) {
        this.source.subscribe(new MaybeToFlowableSubscriber(s));
    }

    /* loaded from: classes3.dex */
    static final class MaybeToFlowableSubscriber<T> extends DeferredScalarDisposable<T> implements MaybeObserver<T> {
        private static final long serialVersionUID = 7603343402964826922L;
        Disposable d;

        MaybeToFlowableSubscriber(Observer<? super T> actual) {
            super(actual);
        }

        @Override // io.reactivex.MaybeObserver
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.validate(this.d, d)) {
                this.d = d;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.MaybeObserver
        public void onSuccess(T value) {
            complete(value);
        }

        @Override // io.reactivex.MaybeObserver
        public void onError(Throwable e) {
            error(e);
        }

        @Override // io.reactivex.MaybeObserver
        public void onComplete() {
            complete();
        }

        @Override // io.reactivex.internal.observers.DeferredScalarDisposable, io.reactivex.disposables.Disposable
        public void dispose() {
            super.dispose();
            this.d.dispose();
        }
    }
}
