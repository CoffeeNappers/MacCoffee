package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.Notification;
import io.reactivex.internal.subscribers.SinglePostCompleteSubscriber;
import io.reactivex.plugins.RxJavaPlugins;
import org.reactivestreams.Subscriber;
/* loaded from: classes3.dex */
public final class FlowableMaterialize<T> extends AbstractFlowableWithUpstream<T, Notification<T>> {
    public FlowableMaterialize(Flowable<T> source) {
        super(source);
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super Notification<T>> s) {
        this.source.subscribe((FlowableSubscriber) new MaterializeSubscriber(s));
    }

    /* loaded from: classes3.dex */
    static final class MaterializeSubscriber<T> extends SinglePostCompleteSubscriber<T, Notification<T>> {
        private static final long serialVersionUID = -3740826063558713822L;

        @Override // io.reactivex.internal.subscribers.SinglePostCompleteSubscriber
        protected /* bridge */ /* synthetic */ void onDrop(Object x0) {
            onDrop((Notification) ((Notification) x0));
        }

        MaterializeSubscriber(Subscriber<? super Notification<T>> actual) {
            super(actual);
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            this.produced++;
            this.actual.onNext(Notification.createOnNext(t));
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            complete(Notification.createOnError(t));
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            complete(Notification.createOnComplete());
        }

        protected void onDrop(Notification<T> n) {
            if (n.isOnError()) {
                RxJavaPlugins.onError(n.getError());
            }
        }
    }
}
