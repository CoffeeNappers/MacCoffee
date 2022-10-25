package io.reactivex.processors;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import org.reactivestreams.Processor;
/* loaded from: classes3.dex */
public abstract class FlowableProcessor<T> extends Flowable<T> implements Processor<T, T>, FlowableSubscriber<T> {
    public abstract Throwable getThrowable();

    public abstract boolean hasComplete();

    public abstract boolean hasSubscribers();

    public abstract boolean hasThrowable();

    public final FlowableProcessor<T> toSerialized() {
        return this instanceof SerializedProcessor ? this : new SerializedProcessor<>(this);
    }
}
