package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.annotations.Nullable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.flowables.GroupedFlowable;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import io.reactivex.internal.subscriptions.BasicIntQueueSubscription;
import io.reactivex.internal.subscriptions.EmptySubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableGroupBy<T, K, V> extends AbstractFlowableWithUpstream<T, GroupedFlowable<K, V>> {
    final int bufferSize;
    final boolean delayError;
    final Function<? super T, ? extends K> keySelector;
    final Function<? super T, ? extends V> valueSelector;

    public FlowableGroupBy(Flowable<T> source, Function<? super T, ? extends K> keySelector, Function<? super T, ? extends V> valueSelector, int bufferSize, boolean delayError) {
        super(source);
        this.keySelector = keySelector;
        this.valueSelector = valueSelector;
        this.bufferSize = bufferSize;
        this.delayError = delayError;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super GroupedFlowable<K, V>> s) {
        this.source.subscribe((FlowableSubscriber) new GroupBySubscriber(s, this.keySelector, this.valueSelector, this.bufferSize, this.delayError));
    }

    /* loaded from: classes3.dex */
    public static final class GroupBySubscriber<T, K, V> extends BasicIntQueueSubscription<GroupedFlowable<K, V>> implements FlowableSubscriber<T> {
        static final Object NULL_KEY = new Object();
        private static final long serialVersionUID = -3688291656102519502L;
        final Subscriber<? super GroupedFlowable<K, V>> actual;
        final int bufferSize;
        final boolean delayError;
        volatile boolean done;
        Throwable error;
        final Function<? super T, ? extends K> keySelector;
        boolean outputFused;
        final SpscLinkedArrayQueue<GroupedFlowable<K, V>> queue;
        Subscription s;
        final Function<? super T, ? extends V> valueSelector;
        final AtomicBoolean cancelled = new AtomicBoolean();
        final AtomicLong requested = new AtomicLong();
        final AtomicInteger groupCount = new AtomicInteger(1);
        final Map<Object, GroupedUnicast<K, V>> groups = new ConcurrentHashMap();

        public GroupBySubscriber(Subscriber<? super GroupedFlowable<K, V>> actual, Function<? super T, ? extends K> keySelector, Function<? super T, ? extends V> valueSelector, int bufferSize, boolean delayError) {
            this.actual = actual;
            this.keySelector = keySelector;
            this.valueSelector = valueSelector;
            this.bufferSize = bufferSize;
            this.delayError = delayError;
            this.queue = new SpscLinkedArrayQueue<>(bufferSize);
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
                s.request(this.bufferSize);
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (!this.done) {
                SpscLinkedArrayQueue<GroupedFlowable<K, V>> q = this.queue;
                try {
                    K key = this.keySelector.mo1190apply(t);
                    boolean newGroup = false;
                    Object mapKey = key != null ? key : NULL_KEY;
                    GroupedUnicast<K, V> group = this.groups.get(mapKey);
                    if (group == null) {
                        if (!this.cancelled.get()) {
                            group = GroupedUnicast.createWith(key, this.bufferSize, this, this.delayError);
                            this.groups.put(mapKey, group);
                            this.groupCount.getAndIncrement();
                            newGroup = true;
                        } else {
                            return;
                        }
                    }
                    try {
                        group.onNext(ObjectHelper.requireNonNull(this.valueSelector.mo1190apply(t), "The valueSelector returned null"));
                        if (newGroup) {
                            q.offer(group);
                            drain();
                        }
                    } catch (Throwable ex) {
                        Exceptions.throwIfFatal(ex);
                        this.s.cancel();
                        onError(ex);
                    }
                } catch (Throwable ex2) {
                    Exceptions.throwIfFatal(ex2);
                    this.s.cancel();
                    onError(ex2);
                }
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
                return;
            }
            for (GroupedUnicast<K, V> g : this.groups.values()) {
                g.onError(t);
            }
            this.groups.clear();
            this.error = t;
            this.done = true;
            drain();
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            if (!this.done) {
                for (GroupedUnicast<K, V> g : this.groups.values()) {
                    g.onComplete();
                }
                this.groups.clear();
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
            if (this.cancelled.compareAndSet(false, true) && this.groupCount.decrementAndGet() == 0) {
                this.s.cancel();
            }
        }

        public void cancel(K key) {
            Object mapKey = key != null ? key : NULL_KEY;
            this.groups.remove(mapKey);
            if (this.groupCount.decrementAndGet() == 0) {
                this.s.cancel();
                if (getAndIncrement() == 0) {
                    this.queue.clear();
                }
            }
        }

        void drain() {
            if (getAndIncrement() == 0) {
                if (this.outputFused) {
                    drainFused();
                } else {
                    drainNormal();
                }
            }
        }

        void drainFused() {
            Throwable ex;
            int missed = 1;
            SpscLinkedArrayQueue<GroupedFlowable<K, V>> q = this.queue;
            Subscriber<? super GroupedFlowable<K, V>> a = this.actual;
            while (!this.cancelled.get()) {
                boolean d = this.done;
                if (d && !this.delayError && (ex = this.error) != null) {
                    q.clear();
                    a.onError(ex);
                    return;
                }
                a.onNext(null);
                if (d) {
                    Throwable ex2 = this.error;
                    if (ex2 != null) {
                        a.onError(ex2);
                        return;
                    } else {
                        a.onComplete();
                        return;
                    }
                }
                missed = addAndGet(-missed);
                if (missed == 0) {
                    return;
                }
            }
            q.clear();
        }

        void drainNormal() {
            int missed = 1;
            SpscLinkedArrayQueue<GroupedFlowable<K, V>> q = this.queue;
            Subscriber<? super GroupedFlowable<K, V>> a = this.actual;
            do {
                long r = this.requested.get();
                long e = 0;
                while (e != r) {
                    boolean d = this.done;
                    GroupedFlowable<K, V> t = q.mo1188poll();
                    boolean empty = t == null;
                    if (!checkTerminated(d, empty, a, q)) {
                        if (empty) {
                            break;
                        }
                        a.onNext(t);
                        e++;
                    } else {
                        return;
                    }
                }
                if (e != r || !checkTerminated(this.done, q.isEmpty(), a, q)) {
                    if (e != 0) {
                        if (r != Long.MAX_VALUE) {
                            this.requested.addAndGet(-e);
                        }
                        this.s.request(e);
                    }
                    missed = addAndGet(-missed);
                } else {
                    return;
                }
            } while (missed != 0);
        }

        boolean checkTerminated(boolean d, boolean empty, Subscriber<?> a, SpscLinkedArrayQueue<?> q) {
            if (this.cancelled.get()) {
                q.clear();
                return true;
            }
            if (this.delayError) {
                if (d && empty) {
                    Throwable ex = this.error;
                    if (ex != null) {
                        a.onError(ex);
                        return true;
                    }
                    a.onComplete();
                    return true;
                }
            } else if (d) {
                Throwable ex2 = this.error;
                if (ex2 != null) {
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

        @Override // io.reactivex.internal.fuseable.QueueFuseable
        public int requestFusion(int mode) {
            if ((mode & 2) != 0) {
                this.outputFused = true;
                return 2;
            }
            return 0;
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        @Nullable
        /* renamed from: poll */
        public GroupedFlowable<K, V> mo1188poll() {
            return this.queue.mo1188poll();
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public void clear() {
            this.queue.clear();
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public boolean isEmpty() {
            return this.queue.isEmpty();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class GroupedUnicast<K, T> extends GroupedFlowable<K, T> {
        final State<T, K> state;

        public static <T, K> GroupedUnicast<K, T> createWith(K key, int bufferSize, GroupBySubscriber<?, K, T> parent, boolean delayError) {
            State<T, K> state = new State<>(bufferSize, parent, key, delayError);
            return new GroupedUnicast<>(key, state);
        }

        protected GroupedUnicast(K key, State<T, K> state) {
            super(key);
            this.state = state;
        }

        @Override // io.reactivex.Flowable
        protected void subscribeActual(Subscriber<? super T> s) {
            this.state.subscribe(s);
        }

        public void onNext(T t) {
            this.state.onNext(t);
        }

        public void onError(Throwable e) {
            this.state.onError(e);
        }

        public void onComplete() {
            this.state.onComplete();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class State<T, K> extends BasicIntQueueSubscription<T> implements Publisher<T> {
        private static final long serialVersionUID = -3852313036005250360L;
        final boolean delayError;
        volatile boolean done;
        Throwable error;
        final K key;
        boolean outputFused;
        final GroupBySubscriber<?, K, T> parent;
        int produced;
        final SpscLinkedArrayQueue<T> queue;
        final AtomicLong requested = new AtomicLong();
        final AtomicBoolean cancelled = new AtomicBoolean();
        final AtomicReference<Subscriber<? super T>> actual = new AtomicReference<>();
        final AtomicBoolean once = new AtomicBoolean();

        State(int bufferSize, GroupBySubscriber<?, K, T> parent, K key, boolean delayError) {
            this.queue = new SpscLinkedArrayQueue<>(bufferSize);
            this.parent = parent;
            this.key = key;
            this.delayError = delayError;
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
            if (this.cancelled.compareAndSet(false, true)) {
                this.parent.cancel(this.key);
            }
        }

        @Override // org.reactivestreams.Publisher
        public void subscribe(Subscriber<? super T> s) {
            if (this.once.compareAndSet(false, true)) {
                s.onSubscribe(this);
                this.actual.lazySet(s);
                drain();
                return;
            }
            EmptySubscription.error(new IllegalStateException("Only one Subscriber allowed!"), s);
        }

        public void onNext(T t) {
            this.queue.offer(t);
            drain();
        }

        public void onError(Throwable e) {
            this.error = e;
            this.done = true;
            drain();
        }

        public void onComplete() {
            this.done = true;
            drain();
        }

        void drain() {
            if (getAndIncrement() == 0) {
                if (this.outputFused) {
                    drainFused();
                } else {
                    drainNormal();
                }
            }
        }

        void drainFused() {
            Throwable ex;
            int missed = 1;
            SpscLinkedArrayQueue<T> q = this.queue;
            Subscriber<? super T> a = this.actual.get();
            while (true) {
                if (a != null) {
                    if (this.cancelled.get()) {
                        q.clear();
                        return;
                    }
                    boolean d = this.done;
                    if (d && !this.delayError && (ex = this.error) != null) {
                        q.clear();
                        a.onError(ex);
                        return;
                    }
                    a.onNext(null);
                    if (d) {
                        Throwable ex2 = this.error;
                        if (ex2 != null) {
                            a.onError(ex2);
                            return;
                        } else {
                            a.onComplete();
                            return;
                        }
                    }
                }
                missed = addAndGet(-missed);
                if (missed == 0) {
                    return;
                }
                if (a == null) {
                    Subscriber<? super T> a2 = this.actual.get();
                    a = a2;
                }
            }
        }

        void drainNormal() {
            int missed = 1;
            SpscLinkedArrayQueue<T> q = this.queue;
            boolean delayError = this.delayError;
            Subscriber<? super T> a = this.actual.get();
            while (true) {
                if (a != null) {
                    long r = this.requested.get();
                    long e = 0;
                    while (e != r) {
                        boolean d = this.done;
                        Object obj = (T) q.mo1188poll();
                        boolean empty = obj == null;
                        if (!checkTerminated(d, empty, a, delayError)) {
                            if (empty) {
                                break;
                            }
                            a.onNext(obj);
                            e++;
                        } else {
                            return;
                        }
                    }
                    if (e != r || !checkTerminated(this.done, q.isEmpty(), a, delayError)) {
                        if (e != 0) {
                            if (r != Long.MAX_VALUE) {
                                this.requested.addAndGet(-e);
                            }
                            this.parent.s.request(e);
                        }
                    } else {
                        return;
                    }
                }
                missed = addAndGet(-missed);
                if (missed != 0) {
                    if (a == null) {
                        Subscriber<? super T> a2 = this.actual.get();
                        a = a2;
                    }
                } else {
                    return;
                }
            }
        }

        boolean checkTerminated(boolean d, boolean empty, Subscriber<? super T> a, boolean delayError) {
            if (this.cancelled.get()) {
                this.queue.clear();
                return true;
            }
            if (d) {
                if (delayError) {
                    if (empty) {
                        Throwable e = this.error;
                        if (e != null) {
                            a.onError(e);
                            return true;
                        }
                        a.onComplete();
                        return true;
                    }
                } else {
                    Throwable e2 = this.error;
                    if (e2 != null) {
                        this.queue.clear();
                        a.onError(e2);
                        return true;
                    } else if (empty) {
                        a.onComplete();
                        return true;
                    }
                }
            }
            return false;
        }

        @Override // io.reactivex.internal.fuseable.QueueFuseable
        public int requestFusion(int mode) {
            if ((mode & 2) != 0) {
                this.outputFused = true;
                return 2;
            }
            return 0;
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        @Nullable
        /* renamed from: poll */
        public T mo1188poll() {
            T v = this.queue.mo1188poll();
            if (v != null) {
                this.produced++;
                return v;
            }
            int p = this.produced;
            if (p != 0) {
                this.produced = 0;
                this.parent.s.request(p);
            }
            return null;
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public boolean isEmpty() {
            return this.queue.isEmpty();
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public void clear() {
            this.queue.clear();
        }
    }
}