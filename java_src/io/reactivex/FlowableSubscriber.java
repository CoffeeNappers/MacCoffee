package io.reactivex;

import io.reactivex.annotations.Experimental;
import io.reactivex.annotations.NonNull;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
@Experimental
/* loaded from: classes3.dex */
public interface FlowableSubscriber<T> extends Subscriber<T> {
    @Override // org.reactivestreams.Subscriber
    void onSubscribe(@NonNull Subscription subscription);
}
