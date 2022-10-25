package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.flowables.ConnectableFlowable;
import io.reactivex.functions.Consumer;
import io.reactivex.internal.fuseable.HasUpstreamPublisher;
import io.reactivex.internal.fuseable.QueueSubscription;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.queue.SpscArrayQueue;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.internal.util.ExceptionHelper;
import io.reactivex.internal.util.NotificationLite;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowablePublish<T> extends ConnectableFlowable<T> implements HasUpstreamPublisher<T> {
    static final long CANCELLED = Long.MIN_VALUE;
    final int bufferSize;
    final AtomicReference<PublishSubscriber<T>> current;
    final Publisher<T> onSubscribe;
    final Flowable<T> source;

    public static <T> ConnectableFlowable<T> create(Flowable<T> source, int bufferSize) {
        AtomicReference<PublishSubscriber<T>> curr = new AtomicReference<>();
        Publisher<T> onSubscribe = new FlowablePublisher<>(curr, bufferSize);
        return RxJavaPlugins.onAssembly((ConnectableFlowable) new FlowablePublish(onSubscribe, source, curr, bufferSize));
    }

    private FlowablePublish(Publisher<T> onSubscribe, Flowable<T> source, AtomicReference<PublishSubscriber<T>> current, int bufferSize) {
        this.onSubscribe = onSubscribe;
        this.source = source;
        this.current = current;
        this.bufferSize = bufferSize;
    }

    @Override // io.reactivex.internal.fuseable.HasUpstreamPublisher
    public Publisher<T> source() {
        return this.source;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super T> s) {
        this.onSubscribe.subscribe(s);
    }

    @Override // io.reactivex.flowables.ConnectableFlowable
    public void connect(Consumer<? super Disposable> connection) {
        PublishSubscriber<T> ps;
        boolean doConnect = true;
        while (true) {
            ps = this.current.get();
            if (ps != null && !ps.isDisposed()) {
                break;
            }
            PublishSubscriber<T> u = new PublishSubscriber<>(this.current, this.bufferSize);
            if (this.current.compareAndSet(ps, u)) {
                ps = u;
                break;
            }
        }
        if (ps.shouldConnect.get() || !ps.shouldConnect.compareAndSet(false, true)) {
            doConnect = false;
        }
        try {
            connection.accept(ps);
            if (doConnect) {
                this.source.subscribe((FlowableSubscriber) ps);
            }
        } catch (Throwable ex) {
            Exceptions.throwIfFatal(ex);
            throw ExceptionHelper.wrapOrThrow(ex);
        }
    }

    /* loaded from: classes3.dex */
    static final class PublishSubscriber<T> extends AtomicInteger implements FlowableSubscriber<T>, Disposable {
        static final InnerSubscriber[] EMPTY = new InnerSubscriber[0];
        static final InnerSubscriber[] TERMINATED = new InnerSubscriber[0];
        private static final long serialVersionUID = -202316842419149694L;
        final int bufferSize;
        final AtomicReference<PublishSubscriber<T>> current;
        volatile SimpleQueue<T> queue;
        int sourceMode;
        volatile Object terminalEvent;
        final AtomicReference<Subscription> s = new AtomicReference<>();
        final AtomicReference<InnerSubscriber[]> subscribers = new AtomicReference<>(EMPTY);
        final AtomicBoolean shouldConnect = new AtomicBoolean();

        PublishSubscriber(AtomicReference<PublishSubscriber<T>> current, int bufferSize) {
            this.current = current;
            this.bufferSize = bufferSize;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            if (this.subscribers.get() != TERMINATED) {
                InnerSubscriber[] ps = this.subscribers.getAndSet(TERMINATED);
                if (ps != TERMINATED) {
                    this.current.compareAndSet(this, null);
                    SubscriptionHelper.cancel(this.s);
                }
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.subscribers.get() == TERMINATED;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.setOnce(this.s, s)) {
                if (s instanceof QueueSubscription) {
                    QueueSubscription<T> qs = (QueueSubscription) s;
                    int m = qs.requestFusion(3);
                    if (m == 1) {
                        this.sourceMode = m;
                        this.queue = qs;
                        this.terminalEvent = NotificationLite.complete();
                        dispatch();
                        return;
                    } else if (m == 2) {
                        this.sourceMode = m;
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
        public void onNext(T t) {
            if (this.sourceMode == 0 && !this.queue.offer(t)) {
                onError(new MissingBackpressureException("Prefetch queue is full?!"));
            } else {
                dispatch();
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable e) {
            if (this.terminalEvent == null) {
                this.terminalEvent = NotificationLite.error(e);
                dispatch();
                return;
            }
            RxJavaPlugins.onError(e);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            if (this.terminalEvent == null) {
                this.terminalEvent = NotificationLite.complete();
                dispatch();
            }
        }

        boolean add(InnerSubscriber<T> producer) {
            InnerSubscriber[] c;
            InnerSubscriber[] u;
            do {
                c = this.subscribers.get();
                if (c == TERMINATED) {
                    return false;
                }
                int len = c.length;
                u = new InnerSubscriber[len + 1];
                System.arraycopy(c, 0, u, 0, len);
                u[len] = producer;
            } while (!this.subscribers.compareAndSet(c, u));
            return true;
        }

        void remove(InnerSubscriber<T> producer) {
            InnerSubscriber[] c;
            InnerSubscriber[] u;
            do {
                c = this.subscribers.get();
                int len = c.length;
                if (len != 0) {
                    int j = -1;
                    int i = 0;
                    while (true) {
                        if (i >= len) {
                            break;
                        } else if (!c[i].equals(producer)) {
                            i++;
                        } else {
                            j = i;
                            break;
                        }
                    }
                    if (j >= 0) {
                        if (len == 1) {
                            u = EMPTY;
                        } else {
                            u = new InnerSubscriber[len - 1];
                            System.arraycopy(c, 0, u, 0, j);
                            System.arraycopy(c, j + 1, u, j, (len - j) - 1);
                        }
                    } else {
                        return;
                    }
                } else {
                    return;
                }
            } while (!this.subscribers.compareAndSet(c, u));
        }

        boolean checkTerminated(Object term, boolean empty) {
            if (term != null) {
                if (NotificationLite.isComplete(term)) {
                    if (empty) {
                        this.current.compareAndSet(this, null);
                        InnerSubscriber<?>[] arr$ = this.subscribers.getAndSet(TERMINATED);
                        for (InnerSubscriber<?> ip : arr$) {
                            ip.child.onComplete();
                        }
                        return true;
                    }
                } else {
                    Throwable t = NotificationLite.getError(term);
                    this.current.compareAndSet(this, null);
                    InnerSubscriber<?>[] a = this.subscribers.getAndSet(TERMINATED);
                    if (a.length != 0) {
                        for (InnerSubscriber<?> ip2 : a) {
                            ip2.child.onError(t);
                        }
                        return true;
                    }
                    RxJavaPlugins.onError(t);
                    return true;
                }
            }
            return false;
        }

        void dispatch() {
            T t;
            T t2;
            if (getAndIncrement() == 0) {
                int missed = 1;
                while (true) {
                    Object term = this.terminalEvent;
                    SimpleQueue<T> q = this.queue;
                    boolean empty = q == null || q.isEmpty();
                    if (!checkTerminated(term, empty)) {
                        if (!empty) {
                            InnerSubscriber<T>[] ps = this.subscribers.get();
                            int len = ps.length;
                            long maxRequested = Long.MAX_VALUE;
                            int cancelled = 0;
                            for (InnerSubscriber<T> ip : ps) {
                                long r = ip.get();
                                if (r >= 0) {
                                    maxRequested = Math.min(maxRequested, r);
                                } else if (r == Long.MIN_VALUE) {
                                    cancelled++;
                                }
                            }
                            if (len == cancelled) {
                                Object term2 = this.terminalEvent;
                                try {
                                    t = q.mo1188poll();
                                } catch (Throwable ex) {
                                    Exceptions.throwIfFatal(ex);
                                    this.s.get().cancel();
                                    term2 = NotificationLite.error(ex);
                                    this.terminalEvent = term2;
                                    t = null;
                                }
                                if (!checkTerminated(term2, t == null)) {
                                    if (this.sourceMode != 1) {
                                        this.s.get().request(1L);
                                    }
                                } else {
                                    return;
                                }
                            } else {
                                int d = 0;
                                while (d < maxRequested) {
                                    Object term3 = this.terminalEvent;
                                    try {
                                        t2 = q.mo1188poll();
                                    } catch (Throwable ex2) {
                                        Exceptions.throwIfFatal(ex2);
                                        this.s.get().cancel();
                                        term3 = NotificationLite.error(ex2);
                                        this.terminalEvent = term3;
                                        t2 = null;
                                    }
                                    empty = t2 == null;
                                    if (!checkTerminated(term3, empty)) {
                                        if (empty) {
                                            break;
                                        }
                                        Object value = NotificationLite.getValue(t2);
                                        for (InnerSubscriber<T> ip2 : ps) {
                                            if (ip2.get() > 0) {
                                                ip2.child.onNext(value);
                                                ip2.produced(1L);
                                            }
                                        }
                                        d++;
                                    } else {
                                        return;
                                    }
                                }
                                if (d > 0 && this.sourceMode != 1) {
                                    this.s.get().request(d);
                                }
                                if (maxRequested != 0 && !empty) {
                                }
                            }
                        }
                        missed = addAndGet(-missed);
                        if (missed == 0) {
                            return;
                        }
                    } else {
                        return;
                    }
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class InnerSubscriber<T> extends AtomicLong implements Subscription {
        private static final long serialVersionUID = -4453897557930727610L;
        final Subscriber<? super T> child;
        volatile PublishSubscriber<T> parent;

        InnerSubscriber(Subscriber<? super T> child) {
            this.child = child;
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            if (SubscriptionHelper.validate(n)) {
                BackpressureHelper.addCancel(this, n);
                PublishSubscriber<T> p = this.parent;
                if (p != null) {
                    p.dispatch();
                }
            }
        }

        public long produced(long n) {
            return BackpressureHelper.producedCancel(this, n);
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            PublishSubscriber<T> p;
            long r = get();
            if (r != Long.MIN_VALUE) {
                long r2 = getAndSet(Long.MIN_VALUE);
                if (r2 != Long.MIN_VALUE && (p = this.parent) != null) {
                    p.remove(this);
                    p.dispatch();
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class FlowablePublisher<T> implements Publisher<T> {
        private final int bufferSize;
        private final AtomicReference<PublishSubscriber<T>> curr;

        FlowablePublisher(AtomicReference<PublishSubscriber<T>> curr, int bufferSize) {
            this.curr = curr;
            this.bufferSize = bufferSize;
        }

        @Override // org.reactivestreams.Publisher
        public void subscribe(Subscriber<? super T> child) {
            PublishSubscriber<T> r;
            InnerSubscriber<T> inner = new InnerSubscriber<>(child);
            child.onSubscribe(inner);
            while (true) {
                r = this.curr.get();
                if (r == null || r.isDisposed()) {
                    PublishSubscriber<T> u = new PublishSubscriber<>(this.curr, this.bufferSize);
                    if (this.curr.compareAndSet(r, u)) {
                        r = u;
                    } else {
                        continue;
                    }
                }
                if (r.add(inner)) {
                    break;
                }
            }
            if (inner.get() == Long.MIN_VALUE) {
                r.remove(inner);
            } else {
                inner.parent = r;
            }
            r.dispatch();
        }
    }
}
