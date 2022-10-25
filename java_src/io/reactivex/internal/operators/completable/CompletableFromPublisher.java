package io.reactivex.internal.operators.completable;

import io.reactivex.Completable;
import io.reactivex.CompletableObserver;
import io.reactivex.FlowableSubscriber;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class CompletableFromPublisher<T> extends Completable {
    final Publisher<T> flowable;

    public CompletableFromPublisher(Publisher<T> flowable) {
        this.flowable = flowable;
    }

    @Override // io.reactivex.Completable
    protected void subscribeActual(CompletableObserver cs) {
        this.flowable.subscribe(new FromPublisherSubscriber(cs));
    }

    /* loaded from: classes3.dex */
    static final class FromPublisherSubscriber<T> implements FlowableSubscriber<T>, Disposable {
        final CompletableObserver cs;
        Subscription s;

        FromPublisherSubscriber(CompletableObserver actual) {
            this.cs = actual;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                this.cs.onSubscribe(this);
                s.request(Long.MAX_VALUE);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            this.cs.onError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            this.cs.onComplete();
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.s.cancel();
            this.s = SubscriptionHelper.CANCELLED;
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.s == SubscriptionHelper.CANCELLED;
        }
    }
}
