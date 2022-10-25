package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.QueueSubscription;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.queue.SpscArrayQueue;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableSwitchMap<T, R> extends AbstractFlowableWithUpstream<T, R> {
    final int bufferSize;
    final boolean delayErrors;
    final Function<? super T, ? extends Publisher<? extends R>> mapper;

    public FlowableSwitchMap(Flowable<T> source, Function<? super T, ? extends Publisher<? extends R>> mapper, int bufferSize, boolean delayErrors) {
        super(source);
        this.mapper = mapper;
        this.bufferSize = bufferSize;
        this.delayErrors = delayErrors;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super R> s) {
        if (!FlowableScalarXMap.tryScalarXMapSubscribe(this.source, s, this.mapper)) {
            this.source.subscribe((FlowableSubscriber) new SwitchMapSubscriber(s, this.mapper, this.bufferSize, this.delayErrors));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class SwitchMapSubscriber<T, R> extends AtomicInteger implements FlowableSubscriber<T>, Subscription {
        static final SwitchMapInnerSubscriber<Object, Object> CANCELLED = new SwitchMapInnerSubscriber<>(null, -1, 1);
        private static final long serialVersionUID = -3491074160481096299L;
        final Subscriber<? super R> actual;
        final int bufferSize;
        volatile boolean cancelled;
        final boolean delayErrors;
        volatile boolean done;
        final Function<? super T, ? extends Publisher<? extends R>> mapper;
        Subscription s;
        volatile long unique;
        final AtomicReference<SwitchMapInnerSubscriber<T, R>> active = new AtomicReference<>();
        final AtomicLong requested = new AtomicLong();
        final AtomicThrowable error = new AtomicThrowable();

        static {
            CANCELLED.cancel();
        }

        SwitchMapSubscriber(Subscriber<? super R> actual, Function<? super T, ? extends Publisher<? extends R>> mapper, int bufferSize, boolean delayErrors) {
            this.actual = actual;
            this.mapper = mapper;
            this.bufferSize = bufferSize;
            this.delayErrors = delayErrors;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            SwitchMapInnerSubscriber<T, R> inner;
            if (!this.done) {
                long c = this.unique + 1;
                this.unique = c;
                SwitchMapInnerSubscriber<T, R> inner2 = this.active.get();
                if (inner2 != null) {
                    inner2.cancel();
                }
                try {
                    Publisher<? extends R> p = (Publisher) ObjectHelper.requireNonNull(this.mapper.mo1190apply(t), "The publisher returned is null");
                    SwitchMapInnerSubscriber<T, R> nextInner = new SwitchMapInnerSubscriber<>(this, c, this.bufferSize);
                    do {
                        inner = this.active.get();
                        if (inner == CANCELLED) {
                            return;
                        }
                    } while (!this.active.compareAndSet(inner, nextInner));
                    p.subscribe(nextInner);
                } catch (Throwable e) {
                    Exceptions.throwIfFatal(e);
                    this.s.cancel();
                    onError(e);
                }
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            if (!this.done && this.error.addThrowable(t)) {
                if (!this.delayErrors) {
                    disposeInner();
                }
                this.done = true;
                drain();
                return;
            }
            RxJavaPlugins.onError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                drain();
            }
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            if (SubscriptionHelper.validate(n)) {
                BackpressureHelper.add(this.requested, n);
                if (this.unique == 0) {
                    this.s.request(Long.MAX_VALUE);
                } else {
                    drain();
                }
            }
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.s.cancel();
                disposeInner();
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        void disposeInner() {
            SwitchMapInnerSubscriber<T, R> a = this.active.get();
            if (a != CANCELLED) {
                SwitchMapInnerSubscriber<T, R> a2 = this.active.getAndSet(CANCELLED);
                SwitchMapInnerSubscriber<T, R> a3 = a2;
                if (a3 != CANCELLED && a3 != null) {
                    a3.cancel();
                }
            }
        }

        /* JADX WARN: Code restructure failed: missing block: B:103:0x000c, code lost:
            continue;
         */
        /* JADX WARN: Code restructure failed: missing block: B:56:0x0139, code lost:
            if (r6 == 0) goto L75;
         */
        /* JADX WARN: Code restructure failed: missing block: B:58:0x0141, code lost:
            if (r22.cancelled != false) goto L75;
         */
        /* JADX WARN: Code restructure failed: missing block: B:60:0x014a, code lost:
            if (r14 == Long.MAX_VALUE) goto L74;
         */
        /* JADX WARN: Code restructure failed: missing block: B:61:0x014c, code lost:
            r22.requested.addAndGet(-r6);
         */
        /* JADX WARN: Code restructure failed: missing block: B:62:0x015c, code lost:
            r11.get().request(r6);
         */
        /* JADX WARN: Code restructure failed: missing block: B:63:0x0167, code lost:
            if (r16 != false) goto L82;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        void drain() {
            /*
                Method dump skipped, instructions count: 496
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.flowable.FlowableSwitchMap.SwitchMapSubscriber.drain():void");
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class SwitchMapInnerSubscriber<T, R> extends AtomicReference<Subscription> implements FlowableSubscriber<R> {
        private static final long serialVersionUID = 3837284832786408377L;
        final int bufferSize;
        volatile boolean done;
        int fusionMode;
        final long index;
        final SwitchMapSubscriber<T, R> parent;
        volatile SimpleQueue<R> queue;

        SwitchMapInnerSubscriber(SwitchMapSubscriber<T, R> parent, long index, int bufferSize) {
            this.parent = parent;
            this.index = index;
            this.bufferSize = bufferSize;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.setOnce(this, s)) {
                if (s instanceof QueueSubscription) {
                    QueueSubscription<R> qs = (QueueSubscription) s;
                    int m = qs.requestFusion(3);
                    if (m == 1) {
                        this.fusionMode = m;
                        this.queue = qs;
                        this.done = true;
                        this.parent.drain();
                        return;
                    } else if (m == 2) {
                        this.fusionMode = m;
                        this.queue = qs;
                        s.request(this.bufferSize);
                        return;
                    }
                }
                this.queue = new SpscArrayQueue(this.bufferSize);
                s.request(this.bufferSize);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(R t) {
            SwitchMapSubscriber<T, R> p = this.parent;
            if (this.index == p.unique) {
                if (this.fusionMode == 0 && !this.queue.offer(t)) {
                    onError(new MissingBackpressureException("Queue full?!"));
                } else {
                    p.drain();
                }
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            SwitchMapSubscriber<T, R> p = this.parent;
            if (this.index == p.unique && p.error.addThrowable(t)) {
                if (!p.delayErrors) {
                    p.s.cancel();
                }
                this.done = true;
                p.drain();
                return;
            }
            RxJavaPlugins.onError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            SwitchMapSubscriber<T, R> p = this.parent;
            if (this.index == p.unique) {
                this.done = true;
                p.drain();
            }
        }

        public void cancel() {
            SubscriptionHelper.cancel(this);
        }
    }
}
