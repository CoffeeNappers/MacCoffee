package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import io.reactivex.internal.subscribers.InnerQueuedSubscriber;
import io.reactivex.internal.subscribers.InnerQueuedSubscriberSupport;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.internal.util.ErrorMode;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableConcatMapEager<T, R> extends AbstractFlowableWithUpstream<T, R> {
    final ErrorMode errorMode;
    final Function<? super T, ? extends Publisher<? extends R>> mapper;
    final int maxConcurrency;
    final int prefetch;

    public FlowableConcatMapEager(Flowable<T> source, Function<? super T, ? extends Publisher<? extends R>> mapper, int maxConcurrency, int prefetch, ErrorMode errorMode) {
        super(source);
        this.mapper = mapper;
        this.maxConcurrency = maxConcurrency;
        this.prefetch = prefetch;
        this.errorMode = errorMode;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super R> s) {
        this.source.subscribe((FlowableSubscriber) new ConcatMapEagerDelayErrorSubscriber(s, this.mapper, this.maxConcurrency, this.prefetch, this.errorMode));
    }

    /* loaded from: classes3.dex */
    static final class ConcatMapEagerDelayErrorSubscriber<T, R> extends AtomicInteger implements FlowableSubscriber<T>, Subscription, InnerQueuedSubscriberSupport<R> {
        private static final long serialVersionUID = -4255299542215038287L;
        final Subscriber<? super R> actual;
        volatile boolean cancelled;
        volatile InnerQueuedSubscriber<R> current;
        volatile boolean done;
        final ErrorMode errorMode;
        final Function<? super T, ? extends Publisher<? extends R>> mapper;
        final int maxConcurrency;
        final int prefetch;
        Subscription s;
        final SpscLinkedArrayQueue<InnerQueuedSubscriber<R>> subscribers;
        final AtomicThrowable errors = new AtomicThrowable();
        final AtomicLong requested = new AtomicLong();

        /* JADX INFO: Access modifiers changed from: package-private */
        public ConcatMapEagerDelayErrorSubscriber(Subscriber<? super R> actual, Function<? super T, ? extends Publisher<? extends R>> mapper, int maxConcurrency, int prefetch, ErrorMode errorMode) {
            this.actual = actual;
            this.mapper = mapper;
            this.maxConcurrency = maxConcurrency;
            this.prefetch = prefetch;
            this.errorMode = errorMode;
            this.subscribers = new SpscLinkedArrayQueue<>(Math.min(prefetch, maxConcurrency));
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
                s.request(this.maxConcurrency == Integer.MAX_VALUE ? Long.MAX_VALUE : this.maxConcurrency);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            try {
                Publisher<? extends R> p = (Publisher) ObjectHelper.requireNonNull(this.mapper.mo1190apply(t), "The mapper returned a null Publisher");
                InnerQueuedSubscriber<R> inner = new InnerQueuedSubscriber<>(this, this.prefetch);
                if (!this.cancelled) {
                    this.subscribers.offer(inner);
                    if (!this.cancelled) {
                        p.subscribe(inner);
                        if (this.cancelled) {
                            inner.cancel();
                            drainAndCancel();
                        }
                    }
                }
            } catch (Throwable ex) {
                Exceptions.throwIfFatal(ex);
                this.s.cancel();
                onError(ex);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            if (this.errors.addThrowable(t)) {
                this.done = true;
                drain();
                return;
            }
            RxJavaPlugins.onError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            this.done = true;
            drain();
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.s.cancel();
                drainAndCancel();
            }
        }

        void drainAndCancel() {
            if (getAndIncrement() == 0) {
                do {
                    cancelAll();
                } while (decrementAndGet() != 0);
            }
        }

        void cancelAll() {
            while (true) {
                InnerQueuedSubscriber<R> inner = this.subscribers.mo1188poll();
                if (inner != null) {
                    inner.cancel();
                } else {
                    return;
                }
            }
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            if (SubscriptionHelper.validate(n)) {
                BackpressureHelper.add(this.requested, n);
                drain();
            }
        }

        @Override // io.reactivex.internal.subscribers.InnerQueuedSubscriberSupport
        public void innerNext(InnerQueuedSubscriber<R> inner, R value) {
            if (inner.queue().offer(value)) {
                drain();
                return;
            }
            inner.cancel();
            innerError(inner, new MissingBackpressureException());
        }

        @Override // io.reactivex.internal.subscribers.InnerQueuedSubscriberSupport
        public void innerError(InnerQueuedSubscriber<R> inner, Throwable e) {
            if (this.errors.addThrowable(e)) {
                inner.setDone();
                if (this.errorMode != ErrorMode.END) {
                    this.s.cancel();
                }
                drain();
                return;
            }
            RxJavaPlugins.onError(e);
        }

        @Override // io.reactivex.internal.subscribers.InnerQueuedSubscriberSupport
        public void innerComplete(InnerQueuedSubscriber<R> inner) {
            inner.setDone();
            drain();
        }

        @Override // io.reactivex.internal.subscribers.InnerQueuedSubscriberSupport
        public void drain() {
            SimpleQueue<R> q;
            if (getAndIncrement() == 0) {
                int missed = 1;
                InnerQueuedSubscriber<R> inner = this.current;
                Subscriber<? super R> a = this.actual;
                ErrorMode em = this.errorMode;
                while (true) {
                    long r = this.requested.get();
                    long e = 0;
                    if (inner == null) {
                        if (em != ErrorMode.END) {
                            if (this.errors.get() != null) {
                                cancelAll();
                                a.onError(this.errors.terminate());
                                return;
                            }
                        }
                        boolean outerDone = this.done;
                        InnerQueuedSubscriber<R> inner2 = this.subscribers.mo1188poll();
                        inner = inner2;
                        if (outerDone && inner == null) {
                            Throwable ex = this.errors.terminate();
                            if (ex != null) {
                                a.onError(ex);
                                return;
                            } else {
                                a.onComplete();
                                return;
                            }
                        } else if (inner != null) {
                            this.current = inner;
                        }
                    }
                    boolean continueNextSource = false;
                    if (inner != null && (q = inner.queue()) != null) {
                        while (true) {
                            if (e == r) {
                                break;
                            } else if (this.cancelled) {
                                cancelAll();
                                return;
                            } else {
                                if (em == ErrorMode.IMMEDIATE) {
                                    if (this.errors.get() != null) {
                                        this.current = null;
                                        inner.cancel();
                                        cancelAll();
                                        a.onError(this.errors.terminate());
                                        return;
                                    }
                                }
                                boolean d = inner.isDone();
                                try {
                                    R v = q.mo1188poll();
                                    boolean empty = v == null;
                                    if (d && empty) {
                                        inner = null;
                                        this.current = null;
                                        this.s.request(1L);
                                        continueNextSource = true;
                                        break;
                                    } else if (empty) {
                                        break;
                                    } else {
                                        a.onNext(v);
                                        e++;
                                        inner.requestOne();
                                    }
                                } catch (Throwable ex2) {
                                    Exceptions.throwIfFatal(ex2);
                                    this.current = null;
                                    inner.cancel();
                                    cancelAll();
                                    a.onError(ex2);
                                    return;
                                }
                            }
                        }
                        if (e == r) {
                            if (this.cancelled) {
                                cancelAll();
                                return;
                            } else if (em == ErrorMode.IMMEDIATE && this.errors.get() != null) {
                                this.current = null;
                                inner.cancel();
                                cancelAll();
                                a.onError(this.errors.terminate());
                                return;
                            } else {
                                boolean d2 = inner.isDone();
                                boolean empty2 = q.isEmpty();
                                if (d2 && empty2) {
                                    inner = null;
                                    this.current = null;
                                    this.s.request(1L);
                                    continueNextSource = true;
                                }
                            }
                        }
                    }
                    if (e != 0 && r != Long.MAX_VALUE) {
                        this.requested.addAndGet(-e);
                    }
                    if (!continueNextSource && (missed = addAndGet(-missed)) == 0) {
                        return;
                    }
                }
            }
        }
    }
}
