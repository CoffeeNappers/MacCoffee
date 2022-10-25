package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.Observable;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableFromObservable<T> extends Flowable<T> {
    private final Observable<T> upstream;

    public FlowableFromObservable(Observable<T> upstream) {
        this.upstream = upstream;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super T> s) {
        this.upstream.subscribe(new SubscriberObserver(s));
    }

    /* loaded from: classes3.dex */
    static class SubscriberObserver<T> implements Observer<T>, Subscription {
        private Disposable d;
        private final Subscriber<? super T> s;

        SubscriberObserver(Subscriber<? super T> s) {
            this.s = s;
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            this.s.onComplete();
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable e) {
            this.s.onError(e);
        }

        @Override // io.reactivex.Observer
        public void onNext(T value) {
            this.s.onNext(value);
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable d) {
            this.d = d;
            this.s.onSubscribe(this);
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            this.d.dispose();
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
        }
    }
}
