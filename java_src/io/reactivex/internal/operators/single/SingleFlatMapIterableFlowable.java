package io.reactivex.internal.operators.single;

import io.reactivex.Flowable;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.annotations.Nullable;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.subscriptions.BasicIntQueueSubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicLong;
import org.reactivestreams.Subscriber;
/* loaded from: classes3.dex */
public final class SingleFlatMapIterableFlowable<T, R> extends Flowable<R> {
    final Function<? super T, ? extends Iterable<? extends R>> mapper;
    final SingleSource<T> source;

    public SingleFlatMapIterableFlowable(SingleSource<T> source, Function<? super T, ? extends Iterable<? extends R>> mapper) {
        this.source = source;
        this.mapper = mapper;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super R> s) {
        this.source.subscribe(new FlatMapIterableObserver(s, this.mapper));
    }

    /* loaded from: classes3.dex */
    static final class FlatMapIterableObserver<T, R> extends BasicIntQueueSubscription<R> implements SingleObserver<T> {
        private static final long serialVersionUID = -8938804753851907758L;
        final Subscriber<? super R> actual;
        volatile boolean cancelled;
        Disposable d;
        volatile Iterator<? extends R> it;
        final Function<? super T, ? extends Iterable<? extends R>> mapper;
        boolean outputFused;
        final AtomicLong requested = new AtomicLong();

        FlatMapIterableObserver(Subscriber<? super R> actual, Function<? super T, ? extends Iterable<? extends R>> mapper) {
            this.actual = actual;
            this.mapper = mapper;
        }

        @Override // io.reactivex.SingleObserver
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.validate(this.d, d)) {
                this.d = d;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.SingleObserver
        public void onSuccess(T value) {
            try {
                Iterator<? extends R> iterator = this.mapper.mo1190apply(value).iterator();
                boolean has = iterator.hasNext();
                if (!has) {
                    this.actual.onComplete();
                    return;
                }
                this.it = iterator;
                drain();
            } catch (Throwable ex) {
                Exceptions.throwIfFatal(ex);
                this.actual.onError(ex);
            }
        }

        @Override // io.reactivex.SingleObserver
        public void onError(Throwable e) {
            this.d = DisposableHelper.DISPOSED;
            this.actual.onError(e);
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
            this.cancelled = true;
            this.d.dispose();
            this.d = DisposableHelper.DISPOSED;
        }

        void drain() {
            if (getAndIncrement() == 0) {
                Subscriber<? super R> a = this.actual;
                Iterator<? extends R> iterator = this.it;
                if (this.outputFused && iterator != null) {
                    a.onNext(null);
                    a.onComplete();
                    return;
                }
                int missed = 1;
                while (true) {
                    if (iterator != null) {
                        long r = this.requested.get();
                        long e = 0;
                        if (r == Long.MAX_VALUE) {
                            slowPath(a, iterator);
                            return;
                        }
                        while (e != r) {
                            if (!this.cancelled) {
                                try {
                                    a.onNext((Object) ObjectHelper.requireNonNull(iterator.next(), "The iterator returned a null value"));
                                    if (!this.cancelled) {
                                        e++;
                                        try {
                                            boolean b = iterator.hasNext();
                                            if (!b) {
                                                a.onComplete();
                                                return;
                                            }
                                        } catch (Throwable ex) {
                                            Exceptions.throwIfFatal(ex);
                                            a.onError(ex);
                                            return;
                                        }
                                    } else {
                                        return;
                                    }
                                } catch (Throwable ex2) {
                                    Exceptions.throwIfFatal(ex2);
                                    a.onError(ex2);
                                    return;
                                }
                            } else {
                                return;
                            }
                        }
                        if (e != 0) {
                            BackpressureHelper.produced(this.requested, e);
                        }
                    }
                    missed = addAndGet(-missed);
                    if (missed != 0) {
                        if (iterator == null) {
                            iterator = this.it;
                        }
                    } else {
                        return;
                    }
                }
            }
        }

        void slowPath(Subscriber<? super R> a, Iterator<? extends R> iterator) {
            while (!this.cancelled) {
                try {
                    a.onNext((R) iterator.next());
                    if (!this.cancelled) {
                        try {
                            boolean b = iterator.hasNext();
                            if (!b) {
                                a.onComplete();
                                return;
                            }
                        } catch (Throwable ex) {
                            Exceptions.throwIfFatal(ex);
                            a.onError(ex);
                            return;
                        }
                    } else {
                        return;
                    }
                } catch (Throwable ex2) {
                    Exceptions.throwIfFatal(ex2);
                    a.onError(ex2);
                    return;
                }
            }
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
        public void clear() {
            this.it = null;
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public boolean isEmpty() {
            return this.it == null;
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        @Nullable
        /* renamed from: poll */
        public R mo1188poll() throws Exception {
            Iterator<? extends R> iterator = this.it;
            if (iterator != null) {
                R v = (R) ObjectHelper.requireNonNull(iterator.next(), "The iterator returned a null value");
                if (!iterator.hasNext()) {
                    this.it = null;
                    return v;
                }
                return v;
            }
            return null;
        }
    }
}
