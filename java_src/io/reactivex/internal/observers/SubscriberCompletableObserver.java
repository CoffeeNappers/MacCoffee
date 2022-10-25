package io.reactivex.internal.observers;

import io.reactivex.CompletableObserver;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class SubscriberCompletableObserver<T> implements CompletableObserver, Subscription {
    Disposable d;
    final Subscriber<? super T> subscriber;

    public SubscriberCompletableObserver(Subscriber<? super T> observer) {
        this.subscriber = observer;
    }

    @Override // io.reactivex.CompletableObserver, io.reactivex.MaybeObserver
    public void onComplete() {
        this.subscriber.onComplete();
    }

    @Override // io.reactivex.CompletableObserver
    public void onError(Throwable e) {
        this.subscriber.onError(e);
    }

    @Override // io.reactivex.CompletableObserver
    public void onSubscribe(Disposable d) {
        if (DisposableHelper.validate(this.d, d)) {
            this.d = d;
            this.subscriber.onSubscribe(this);
        }
    }

    @Override // org.reactivestreams.Subscription
    public void request(long n) {
    }

    @Override // org.reactivestreams.Subscription
    public void cancel() {
        this.d.dispose();
    }
}
