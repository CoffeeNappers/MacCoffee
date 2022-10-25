package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.annotations.Nullable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.functions.Function;
import io.reactivex.internal.fuseable.QueueSubscription;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.queue.SpscArrayQueue;
import io.reactivex.internal.subscriptions.BasicIntQueueSubscription;
import io.reactivex.internal.subscriptions.EmptySubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.internal.util.ExceptionHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Iterator;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableFlattenIterable<T, R> extends AbstractFlowableWithUpstream<T, R> {
    final Function<? super T, ? extends Iterable<? extends R>> mapper;
    final int prefetch;

    public FlowableFlattenIterable(Flowable<T> source, Function<? super T, ? extends Iterable<? extends R>> mapper, int prefetch) {
        super(source);
        this.mapper = mapper;
        this.prefetch = prefetch;
    }

    @Override // io.reactivex.Flowable
    public void subscribeActual(Subscriber<? super R> s) {
        if (this.source instanceof Callable) {
            try {
                Object call = ((Callable) this.source).call();
                if (call == null) {
                    EmptySubscription.complete(s);
                    return;
                }
                try {
                    Iterable<? extends R> iterable = this.mapper.mo1190apply(call);
                    Iterator<? extends R> it = iterable.iterator();
                    FlowableFromIterable.subscribe(s, it);
                    return;
                } catch (Throwable ex) {
                    Exceptions.throwIfFatal(ex);
                    EmptySubscription.error(ex, s);
                    return;
                }
            } catch (Throwable ex2) {
                Exceptions.throwIfFatal(ex2);
                EmptySubscription.error(ex2, s);
                return;
            }
        }
        this.source.subscribe((FlowableSubscriber) new FlattenIterableSubscriber(s, this.mapper, this.prefetch));
    }

    /* loaded from: classes3.dex */
    static final class FlattenIterableSubscriber<T, R> extends BasicIntQueueSubscription<R> implements FlowableSubscriber<T> {
        private static final long serialVersionUID = -3096000382929934955L;
        final Subscriber<? super R> actual;
        volatile boolean cancelled;
        int consumed;
        Iterator<? extends R> current;
        volatile boolean done;
        int fusionMode;
        final int limit;
        final Function<? super T, ? extends Iterable<? extends R>> mapper;
        final int prefetch;
        SimpleQueue<T> queue;
        Subscription s;
        final AtomicReference<Throwable> error = new AtomicReference<>();
        final AtomicLong requested = new AtomicLong();

        FlattenIterableSubscriber(Subscriber<? super R> actual, Function<? super T, ? extends Iterable<? extends R>> mapper, int prefetch) {
            this.actual = actual;
            this.mapper = mapper;
            this.prefetch = prefetch;
            this.limit = prefetch - (prefetch >> 2);
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                if (s instanceof QueueSubscription) {
                    QueueSubscription<T> qs = (QueueSubscription) s;
                    int m = qs.requestFusion(3);
                    if (m == 1) {
                        this.fusionMode = m;
                        this.queue = qs;
                        this.done = true;
                        this.actual.onSubscribe(this);
                        return;
                    } else if (m == 2) {
                        this.fusionMode = m;
                        this.queue = qs;
                        this.actual.onSubscribe(this);
                        s.request(this.prefetch);
                        return;
                    }
                }
                this.queue = new SpscArrayQueue(this.prefetch);
                this.actual.onSubscribe(this);
                s.request(this.prefetch);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (!this.done) {
                if (this.fusionMode == 0 && !this.queue.offer(t)) {
                    onError(new MissingBackpressureException("Queue is full?!"));
                } else {
                    drain();
                }
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            if (!this.done && ExceptionHelper.addThrowable(this.error, t)) {
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
                drain();
            }
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.s.cancel();
                if (getAndIncrement() == 0) {
                    this.queue.clear();
                }
            }
        }

        /* JADX WARN: Code restructure failed: missing block: B:41:0x0119, code lost:
            if (r8 != r16) goto L50;
         */
        /* JADX WARN: Code restructure failed: missing block: B:42:0x011b, code lost:
            r6 = r24.done;
         */
        /* JADX WARN: Code restructure failed: missing block: B:43:0x0123, code lost:
            if (r14.isEmpty() == false) goto L49;
         */
        /* JADX WARN: Code restructure failed: missing block: B:44:0x0125, code lost:
            if (r11 != null) goto L49;
         */
        /* JADX WARN: Code restructure failed: missing block: B:45:0x0127, code lost:
            r7 = true;
         */
        /* JADX WARN: Code restructure failed: missing block: B:47:0x012e, code lost:
            if (checkTerminated(r6, r7, r4, r14) != false) goto L47;
         */
        /* JADX WARN: Code restructure failed: missing block: B:49:0x0134, code lost:
            if (r8 == 0) goto L55;
         */
        /* JADX WARN: Code restructure failed: missing block: B:51:0x013d, code lost:
            if (r16 == Long.MAX_VALUE) goto L55;
         */
        /* JADX WARN: Code restructure failed: missing block: B:52:0x013f, code lost:
            r24.requested.addAndGet(-r8);
         */
        /* JADX WARN: Code restructure failed: missing block: B:53:0x014f, code lost:
            if (r11 == null) goto L63;
         */
        /* JADX WARN: Code restructure failed: missing block: B:61:0x01be, code lost:
            r7 = false;
         */
        /* JADX WARN: Code restructure failed: missing block: B:82:0x0023, code lost:
            continue;
         */
        /* JADX WARN: Code restructure failed: missing block: B:93:?, code lost:
            return;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        void drain() {
            /*
                Method dump skipped, instructions count: 449
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.flowable.FlowableFlattenIterable.FlattenIterableSubscriber.drain():void");
        }

        void consumedOne(boolean enabled) {
            if (enabled) {
                int c = this.consumed + 1;
                if (c == this.limit) {
                    this.consumed = 0;
                    this.s.request(c);
                    return;
                }
                this.consumed = c;
            }
        }

        boolean checkTerminated(boolean d, boolean empty, Subscriber<?> a, SimpleQueue<?> q) {
            if (this.cancelled) {
                this.current = null;
                q.clear();
                return true;
            }
            if (d) {
                Throwable ex = this.error.get();
                if (ex != null) {
                    Throwable ex2 = ExceptionHelper.terminate(this.error);
                    this.current = null;
                    q.clear();
                    a.onError(ex2);
                    return true;
                } else if (empty) {
                    a.onComplete();
                    return true;
                }
            }
            return false;
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public void clear() {
            this.current = null;
            this.queue.clear();
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public boolean isEmpty() {
            Iterator<? extends R> it = this.current;
            return (it != null && !it.hasNext()) || this.queue.isEmpty();
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        @Nullable
        /* renamed from: poll */
        public R mo1188poll() throws Exception {
            Iterator<? extends R> it = this.current;
            while (true) {
                if (it == null) {
                    T v = this.queue.mo1188poll();
                    if (v != null) {
                        it = this.mapper.mo1190apply(v).iterator();
                        if (!it.hasNext()) {
                            it = null;
                        } else {
                            this.current = it;
                            break;
                        }
                    } else {
                        return null;
                    }
                } else {
                    break;
                }
            }
            R next = it.next();
            if (!it.hasNext()) {
                this.current = null;
                return next;
            }
            return next;
        }

        @Override // io.reactivex.internal.fuseable.QueueFuseable
        public int requestFusion(int requestedMode) {
            return ((requestedMode & 1) == 0 || this.fusionMode != 1) ? 0 : 1;
        }
    }
}
