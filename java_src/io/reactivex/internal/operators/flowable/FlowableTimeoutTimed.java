package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.Scheduler;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.subscribers.FullArbiterSubscriber;
import io.reactivex.internal.subscriptions.FullArbiter;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.plugins.RxJavaPlugins;
import io.reactivex.subscribers.SerializedSubscriber;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableTimeoutTimed<T> extends AbstractFlowableWithUpstream<T, T> {
    static final Disposable NEW_TIMER = new EmptyDispose();
    final Publisher<? extends T> other;
    final Scheduler scheduler;
    final long timeout;
    final TimeUnit unit;

    public FlowableTimeoutTimed(Flowable<T> source, long timeout, TimeUnit unit, Scheduler scheduler, Publisher<? extends T> other) {
        super(source);
        this.timeout = timeout;
        this.unit = unit;
        this.scheduler = scheduler;
        this.other = other;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super T> s) {
        if (this.other == null) {
            this.source.subscribe((FlowableSubscriber) new TimeoutTimedSubscriber(new SerializedSubscriber(s), this.timeout, this.unit, this.scheduler.createWorker()));
        } else {
            this.source.subscribe((FlowableSubscriber) new TimeoutTimedOtherSubscriber(s, this.timeout, this.unit, this.scheduler.createWorker(), this.other));
        }
    }

    /* loaded from: classes3.dex */
    static final class TimeoutTimedOtherSubscriber<T> implements FlowableSubscriber<T>, Disposable {
        final Subscriber<? super T> actual;
        final FullArbiter<T> arbiter;
        volatile boolean done;
        volatile long index;
        final Publisher<? extends T> other;
        Subscription s;
        final long timeout;
        final AtomicReference<Disposable> timer = new AtomicReference<>();
        final TimeUnit unit;
        final Scheduler.Worker worker;

        TimeoutTimedOtherSubscriber(Subscriber<? super T> actual, long timeout, TimeUnit unit, Scheduler.Worker worker, Publisher<? extends T> other) {
            this.actual = actual;
            this.timeout = timeout;
            this.unit = unit;
            this.worker = worker;
            this.other = other;
            this.arbiter = new FullArbiter<>(actual, this, 8);
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                if (this.arbiter.setSubscription(s)) {
                    this.actual.onSubscribe(this.arbiter);
                    scheduleTimeout(0L);
                }
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (!this.done) {
                long idx = this.index + 1;
                this.index = idx;
                if (this.arbiter.onNext(t, this.s)) {
                    scheduleTimeout(idx);
                }
            }
        }

        void scheduleTimeout(long idx) {
            Disposable d = this.timer.get();
            if (d != null) {
                d.dispose();
            }
            if (this.timer.compareAndSet(d, FlowableTimeoutTimed.NEW_TIMER)) {
                DisposableHelper.replace(this.timer, this.worker.schedule(new TimeoutTask(idx), this.timeout, this.unit));
            }
        }

        void subscribeNext() {
            this.other.subscribe(new FullArbiterSubscriber(this.arbiter));
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
                return;
            }
            this.done = true;
            this.arbiter.onError(t, this.s);
            this.worker.dispose();
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                this.arbiter.onComplete(this.s);
                this.worker.dispose();
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.s.cancel();
            this.worker.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.worker.isDisposed();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes3.dex */
        public final class TimeoutTask implements Runnable {
            private final long idx;

            TimeoutTask(long idx) {
                this.idx = idx;
            }

            @Override // java.lang.Runnable
            public void run() {
                if (this.idx == TimeoutTimedOtherSubscriber.this.index) {
                    TimeoutTimedOtherSubscriber.this.done = true;
                    TimeoutTimedOtherSubscriber.this.s.cancel();
                    DisposableHelper.dispose(TimeoutTimedOtherSubscriber.this.timer);
                    TimeoutTimedOtherSubscriber.this.subscribeNext();
                    TimeoutTimedOtherSubscriber.this.worker.dispose();
                }
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class TimeoutTimedSubscriber<T> implements FlowableSubscriber<T>, Disposable, Subscription {
        final Subscriber<? super T> actual;
        volatile boolean done;
        volatile long index;
        Subscription s;
        final long timeout;
        final AtomicReference<Disposable> timer = new AtomicReference<>();
        final TimeUnit unit;
        final Scheduler.Worker worker;

        TimeoutTimedSubscriber(Subscriber<? super T> actual, long timeout, TimeUnit unit, Scheduler.Worker worker) {
            this.actual = actual;
            this.timeout = timeout;
            this.unit = unit;
            this.worker = worker;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
                scheduleTimeout(0L);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (!this.done) {
                long idx = this.index + 1;
                this.index = idx;
                this.actual.onNext(t);
                scheduleTimeout(idx);
            }
        }

        void scheduleTimeout(long idx) {
            Disposable d = this.timer.get();
            if (d != null) {
                d.dispose();
            }
            if (this.timer.compareAndSet(d, FlowableTimeoutTimed.NEW_TIMER)) {
                DisposableHelper.replace(this.timer, this.worker.schedule(new TimeoutTask(idx), this.timeout, this.unit));
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
                return;
            }
            this.done = true;
            this.actual.onError(t);
            this.worker.dispose();
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                this.actual.onComplete();
                this.worker.dispose();
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.s.cancel();
            this.worker.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.worker.isDisposed();
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            this.s.request(n);
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            dispose();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes3.dex */
        public final class TimeoutTask implements Runnable {
            private final long idx;

            TimeoutTask(long idx) {
                this.idx = idx;
            }

            @Override // java.lang.Runnable
            public void run() {
                if (this.idx == TimeoutTimedSubscriber.this.index) {
                    TimeoutTimedSubscriber.this.done = true;
                    TimeoutTimedSubscriber.this.dispose();
                    TimeoutTimedSubscriber.this.actual.onError(new TimeoutException());
                }
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class EmptyDispose implements Disposable {
        EmptyDispose() {
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return true;
        }
    }
}
