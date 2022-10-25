package io.reactivex.internal.operators.maybe;

import io.reactivex.FlowableSubscriber;
import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.CompositeException;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class MaybeDelayOtherPublisher<T, U> extends AbstractMaybeWithUpstream<T, T> {
    final Publisher<U> other;

    public MaybeDelayOtherPublisher(MaybeSource<T> source, Publisher<U> other) {
        super(source);
        this.other = other;
    }

    @Override // io.reactivex.Maybe
    protected void subscribeActual(MaybeObserver<? super T> observer) {
        this.source.subscribe(new DelayMaybeObserver(observer, this.other));
    }

    /* loaded from: classes3.dex */
    static final class DelayMaybeObserver<T, U> implements MaybeObserver<T>, Disposable {
        Disposable d;
        final OtherSubscriber<T> other;
        final Publisher<U> otherSource;

        DelayMaybeObserver(MaybeObserver<? super T> actual, Publisher<U> otherSource) {
            this.other = new OtherSubscriber<>(actual);
            this.otherSource = otherSource;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.d.dispose();
            this.d = DisposableHelper.DISPOSED;
            SubscriptionHelper.cancel(this.other);
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return SubscriptionHelper.isCancelled(this.other.get());
        }

        @Override // io.reactivex.MaybeObserver
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.validate(this.d, d)) {
                this.d = d;
                this.other.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.MaybeObserver
        public void onSuccess(T value) {
            this.d = DisposableHelper.DISPOSED;
            this.other.value = value;
            subscribeNext();
        }

        @Override // io.reactivex.MaybeObserver
        public void onError(Throwable e) {
            this.d = DisposableHelper.DISPOSED;
            this.other.error = e;
            subscribeNext();
        }

        @Override // io.reactivex.MaybeObserver
        public void onComplete() {
            this.d = DisposableHelper.DISPOSED;
            subscribeNext();
        }

        void subscribeNext() {
            this.otherSource.subscribe(this.other);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class OtherSubscriber<T> extends AtomicReference<Subscription> implements FlowableSubscriber<Object> {
        private static final long serialVersionUID = -1215060610805418006L;
        final MaybeObserver<? super T> actual;
        Throwable error;
        T value;

        OtherSubscriber(MaybeObserver<? super T> actual) {
            this.actual = actual;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.setOnce(this, s)) {
                s.request(Long.MAX_VALUE);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(Object t) {
            Subscription s = get();
            if (s != SubscriptionHelper.CANCELLED) {
                lazySet(SubscriptionHelper.CANCELLED);
                s.cancel();
                onComplete();
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            Throwable e = this.error;
            if (e == null) {
                this.actual.onError(t);
            } else {
                this.actual.onError(new CompositeException(e, t));
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            Throwable e = this.error;
            if (e != null) {
                this.actual.onError(e);
                return;
            }
            T v = this.value;
            if (v != null) {
                this.actual.onSuccess(v);
            } else {
                this.actual.onComplete();
            }
        }
    }
}
