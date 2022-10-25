package io.reactivex.internal.operators.flowable;

import io.reactivex.FlowableSubscriber;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.disposables.Disposables;
import io.reactivex.flowables.ConnectableFlowable;
import io.reactivex.functions.Consumer;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.locks.ReentrantLock;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableRefCount<T> extends AbstractFlowableWithUpstream<T, T> {
    volatile CompositeDisposable baseDisposable;
    final ReentrantLock lock;
    final ConnectableFlowable<T> source;
    final AtomicInteger subscriptionCount;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public final class ConnectionSubscriber extends AtomicReference<Subscription> implements FlowableSubscriber<T>, Subscription {
        private static final long serialVersionUID = 152064694420235350L;
        final CompositeDisposable currentBase;
        final AtomicLong requested = new AtomicLong();
        final Disposable resource;
        final Subscriber<? super T> subscriber;

        ConnectionSubscriber(Subscriber<? super T> subscriber, CompositeDisposable currentBase, Disposable resource) {
            this.subscriber = subscriber;
            this.currentBase = currentBase;
            this.resource = resource;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            SubscriptionHelper.deferredSetOnce(this, this.requested, s);
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable e) {
            cleanup();
            this.subscriber.onError(e);
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            this.subscriber.onNext(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            cleanup();
            this.subscriber.onComplete();
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            SubscriptionHelper.deferredRequest(this, this.requested, n);
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            SubscriptionHelper.cancel(this);
            this.resource.dispose();
        }

        void cleanup() {
            FlowableRefCount.this.lock.lock();
            try {
                if (FlowableRefCount.this.baseDisposable == this.currentBase) {
                    if (FlowableRefCount.this.source instanceof Disposable) {
                        ((Disposable) FlowableRefCount.this.source).dispose();
                    }
                    FlowableRefCount.this.baseDisposable.dispose();
                    FlowableRefCount.this.baseDisposable = new CompositeDisposable();
                    FlowableRefCount.this.subscriptionCount.set(0);
                }
            } finally {
                FlowableRefCount.this.lock.unlock();
            }
        }
    }

    public FlowableRefCount(ConnectableFlowable<T> source) {
        super(source);
        this.baseDisposable = new CompositeDisposable();
        this.subscriptionCount = new AtomicInteger();
        this.lock = new ReentrantLock();
        this.source = source;
    }

    @Override // io.reactivex.Flowable
    public void subscribeActual(Subscriber<? super T> subscriber) {
        boolean z;
        this.lock.lock();
        if (this.subscriptionCount.incrementAndGet() == 1) {
            AtomicBoolean writeLocked = new AtomicBoolean(true);
            try {
                this.source.connect(onSubscribe(subscriber, writeLocked));
                if (z) {
                    return;
                }
                return;
            } finally {
                if (writeLocked.get()) {
                }
            }
        }
        try {
            doSubscribe(subscriber, this.baseDisposable);
        } finally {
            this.lock.unlock();
        }
    }

    private Consumer<Disposable> onSubscribe(Subscriber<? super T> subscriber, AtomicBoolean writeLocked) {
        return new DisposeConsumer(subscriber, writeLocked);
    }

    void doSubscribe(Subscriber<? super T> subscriber, CompositeDisposable currentBase) {
        Disposable d = disconnect(currentBase);
        FlowableRefCount<T>.ConnectionSubscriber connection = new ConnectionSubscriber(subscriber, currentBase, d);
        subscriber.onSubscribe(connection);
        this.source.subscribe((FlowableSubscriber) connection);
    }

    private Disposable disconnect(CompositeDisposable current) {
        return Disposables.fromRunnable(new DisposeTask(current));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public final class DisposeConsumer implements Consumer<Disposable> {
        private final Subscriber<? super T> subscriber;
        private final AtomicBoolean writeLocked;

        DisposeConsumer(Subscriber<? super T> subscriber, AtomicBoolean writeLocked) {
            this.subscriber = subscriber;
            this.writeLocked = writeLocked;
        }

        @Override // io.reactivex.functions.Consumer
        public void accept(Disposable subscription) {
            try {
                FlowableRefCount.this.baseDisposable.add(subscription);
                FlowableRefCount.this.doSubscribe(this.subscriber, FlowableRefCount.this.baseDisposable);
            } finally {
                FlowableRefCount.this.lock.unlock();
                this.writeLocked.set(false);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public final class DisposeTask implements Runnable {
        private final CompositeDisposable current;

        DisposeTask(CompositeDisposable current) {
            this.current = current;
        }

        @Override // java.lang.Runnable
        public void run() {
            FlowableRefCount.this.lock.lock();
            try {
                if (FlowableRefCount.this.baseDisposable == this.current && FlowableRefCount.this.subscriptionCount.decrementAndGet() == 0) {
                    if (FlowableRefCount.this.source instanceof Disposable) {
                        ((Disposable) FlowableRefCount.this.source).dispose();
                    }
                    FlowableRefCount.this.baseDisposable.dispose();
                    FlowableRefCount.this.baseDisposable = new CompositeDisposable();
                }
            } finally {
                FlowableRefCount.this.lock.unlock();
            }
        }
    }
}
