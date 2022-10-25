package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.SimplePlainQueue;
import io.reactivex.internal.queue.MpscLinkedQueue;
import io.reactivex.internal.subscribers.QueueDrainSubscriber;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.QueueDrainHelper;
import io.reactivex.plugins.RxJavaPlugins;
import io.reactivex.subscribers.DisposableSubscriber;
import io.reactivex.subscribers.SerializedSubscriber;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicInteger;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableBufferBoundary<T, U extends Collection<? super T>, Open, Close> extends AbstractFlowableWithUpstream<T, U> {
    final Function<? super Open, ? extends Publisher<? extends Close>> bufferClose;
    final Publisher<? extends Open> bufferOpen;
    final Callable<U> bufferSupplier;

    public FlowableBufferBoundary(Flowable<T> source, Publisher<? extends Open> bufferOpen, Function<? super Open, ? extends Publisher<? extends Close>> bufferClose, Callable<U> bufferSupplier) {
        super(source);
        this.bufferOpen = bufferOpen;
        this.bufferClose = bufferClose;
        this.bufferSupplier = bufferSupplier;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super U> s) {
        this.source.subscribe((FlowableSubscriber) new BufferBoundarySubscriber(new SerializedSubscriber(s), this.bufferOpen, this.bufferClose, this.bufferSupplier));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class BufferBoundarySubscriber<T, U extends Collection<? super T>, Open, Close> extends QueueDrainSubscriber<T, U, U> implements Subscription, Disposable {
        final Function<? super Open, ? extends Publisher<? extends Close>> bufferClose;
        final Publisher<? extends Open> bufferOpen;
        final Callable<U> bufferSupplier;
        final List<U> buffers;
        final CompositeDisposable resources;
        Subscription s;
        final AtomicInteger windows;

        /* JADX WARN: Multi-variable type inference failed */
        @Override // io.reactivex.internal.subscribers.QueueDrainSubscriber, io.reactivex.internal.util.QueueDrain
        public /* bridge */ /* synthetic */ boolean accept(Subscriber x0, Object x1) {
            return accept((Subscriber<? super Subscriber>) x0, (Subscriber) ((Collection) x1));
        }

        BufferBoundarySubscriber(Subscriber<? super U> actual, Publisher<? extends Open> bufferOpen, Function<? super Open, ? extends Publisher<? extends Close>> bufferClose, Callable<U> bufferSupplier) {
            super(actual, new MpscLinkedQueue());
            this.windows = new AtomicInteger();
            this.bufferOpen = bufferOpen;
            this.bufferClose = bufferClose;
            this.bufferSupplier = bufferSupplier;
            this.buffers = new LinkedList();
            this.resources = new CompositeDisposable();
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                BufferOpenSubscriber<T, U, Open, Close> bos = new BufferOpenSubscriber<>(this);
                this.resources.add(bos);
                this.actual.onSubscribe(this);
                this.windows.lazySet(1);
                this.bufferOpen.subscribe(bos);
                s.request(Long.MAX_VALUE);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            synchronized (this) {
                for (U b : this.buffers) {
                    b.add(t);
                }
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            cancel();
            this.cancelled = true;
            synchronized (this) {
                this.buffers.clear();
            }
            this.actual.onError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            if (this.windows.decrementAndGet() == 0) {
                complete();
            }
        }

        void complete() {
            List<U> list;
            synchronized (this) {
                list = new ArrayList<>(this.buffers);
                this.buffers.clear();
            }
            SimplePlainQueue<U> simplePlainQueue = this.queue;
            for (U u : list) {
                simplePlainQueue.offer(u);
            }
            this.done = true;
            if (enter()) {
                QueueDrainHelper.drainMaxLoop(simplePlainQueue, this.actual, false, this, this);
            }
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            requested(n);
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.resources.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.resources.isDisposed();
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                dispose();
            }
        }

        public boolean accept(Subscriber<? super U> a, U v) {
            a.onNext(v);
            return true;
        }

        /* JADX WARN: Multi-variable type inference failed */
        void open(Open window) {
            if (!this.cancelled) {
                try {
                    Collection collection = (Collection) ObjectHelper.requireNonNull(this.bufferSupplier.call(), "The buffer supplied is null");
                    try {
                        Publisher<? extends Close> p = (Publisher) ObjectHelper.requireNonNull(this.bufferClose.mo1190apply(window), "The buffer closing publisher is null");
                        if (!this.cancelled) {
                            synchronized (this) {
                                if (!this.cancelled) {
                                    this.buffers.add(collection);
                                    BufferCloseSubscriber<T, U, Open, Close> bcs = new BufferCloseSubscriber<>(collection, this);
                                    this.resources.add(bcs);
                                    this.windows.getAndIncrement();
                                    p.subscribe(bcs);
                                }
                            }
                        }
                    } catch (Throwable e) {
                        Exceptions.throwIfFatal(e);
                        onError(e);
                    }
                } catch (Throwable e2) {
                    Exceptions.throwIfFatal(e2);
                    onError(e2);
                }
            }
        }

        void openFinished(Disposable d) {
            if (this.resources.remove(d) && this.windows.decrementAndGet() == 0) {
                complete();
            }
        }

        void close(U b, Disposable d) {
            boolean e;
            synchronized (this) {
                e = this.buffers.remove(b);
            }
            if (e) {
                fastPathOrderedEmitMax(b, false, this);
            }
            if (this.resources.remove(d) && this.windows.decrementAndGet() == 0) {
                complete();
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class BufferOpenSubscriber<T, U extends Collection<? super T>, Open, Close> extends DisposableSubscriber<Open> {
        boolean done;
        final BufferBoundarySubscriber<T, U, Open, Close> parent;

        BufferOpenSubscriber(BufferBoundarySubscriber<T, U, Open, Close> parent) {
            this.parent = parent;
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(Open t) {
            if (!this.done) {
                this.parent.open(t);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
                return;
            }
            this.done = true;
            this.parent.onError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                this.parent.openFinished(this);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class BufferCloseSubscriber<T, U extends Collection<? super T>, Open, Close> extends DisposableSubscriber<Close> {
        boolean done;
        final BufferBoundarySubscriber<T, U, Open, Close> parent;
        final U value;

        BufferCloseSubscriber(U value, BufferBoundarySubscriber<T, U, Open, Close> parent) {
            this.parent = parent;
            this.value = value;
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(Close t) {
            onComplete();
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
            } else {
                this.parent.onError(t);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                this.parent.close(this.value, this);
            }
        }
    }
}
