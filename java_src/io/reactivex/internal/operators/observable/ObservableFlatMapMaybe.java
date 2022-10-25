package io.reactivex.internal.operators.observable;

import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class ObservableFlatMapMaybe<T, R> extends AbstractObservableWithUpstream<T, R> {
    final boolean delayErrors;
    final Function<? super T, ? extends MaybeSource<? extends R>> mapper;

    public ObservableFlatMapMaybe(ObservableSource<T> source, Function<? super T, ? extends MaybeSource<? extends R>> mapper, boolean delayError) {
        super(source);
        this.mapper = mapper;
        this.delayErrors = delayError;
    }

    @Override // io.reactivex.Observable
    protected void subscribeActual(Observer<? super R> s) {
        this.source.subscribe(new FlatMapMaybeObserver(s, this.mapper, this.delayErrors));
    }

    /* loaded from: classes3.dex */
    static final class FlatMapMaybeObserver<T, R> extends AtomicInteger implements Observer<T>, Disposable {
        private static final long serialVersionUID = 8600231336733376951L;
        final Observer<? super R> actual;
        volatile boolean cancelled;
        Disposable d;
        final boolean delayErrors;
        final Function<? super T, ? extends MaybeSource<? extends R>> mapper;
        final CompositeDisposable set = new CompositeDisposable();
        final AtomicThrowable errors = new AtomicThrowable();
        final AtomicInteger active = new AtomicInteger(1);
        final AtomicReference<SpscLinkedArrayQueue<R>> queue = new AtomicReference<>();

        FlatMapMaybeObserver(Observer<? super R> actual, Function<? super T, ? extends MaybeSource<? extends R>> mapper, boolean delayErrors) {
            this.actual = actual;
            this.mapper = mapper;
            this.delayErrors = delayErrors;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.validate(this.d, d)) {
                this.d = d;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            try {
                MaybeSource<? extends R> ms = (MaybeSource) ObjectHelper.requireNonNull(this.mapper.mo1190apply(t), "The mapper returned a null MaybeSource");
                this.active.getAndIncrement();
                FlatMapMaybeObserver<T, R>.InnerObserver inner = new InnerObserver();
                if (this.set.add(inner)) {
                    ms.subscribe(inner);
                }
            } catch (Throwable ex) {
                Exceptions.throwIfFatal(ex);
                this.d.dispose();
                onError(ex);
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.active.decrementAndGet();
            if (this.errors.addThrowable(t)) {
                if (!this.delayErrors) {
                    this.set.dispose();
                }
                drain();
                return;
            }
            RxJavaPlugins.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            this.active.decrementAndGet();
            drain();
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.cancelled = true;
            this.d.dispose();
            this.set.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.cancelled;
        }

        void innerSuccess(FlatMapMaybeObserver<T, R>.InnerObserver inner, R value) {
            boolean d = true;
            this.set.delete(inner);
            if (get() == 0 && compareAndSet(0, 1)) {
                this.actual.onNext(value);
                if (this.active.decrementAndGet() != 0) {
                    d = false;
                }
                SpscLinkedArrayQueue<R> q = this.queue.get();
                if (d && (q == null || q.isEmpty())) {
                    Throwable ex = this.errors.terminate();
                    if (ex != null) {
                        this.actual.onError(ex);
                        return;
                    } else {
                        this.actual.onComplete();
                        return;
                    }
                } else if (decrementAndGet() == 0) {
                    return;
                }
            } else {
                SpscLinkedArrayQueue<R> q2 = getOrCreateQueue();
                synchronized (q2) {
                    q2.offer(value);
                }
                this.active.decrementAndGet();
                if (getAndIncrement() != 0) {
                    return;
                }
            }
            drainLoop();
        }

        /* JADX WARN: Generic types in debug info not equals: java.lang.Object != io.reactivex.internal.queue.SpscLinkedArrayQueue<R> */
        SpscLinkedArrayQueue<R> getOrCreateQueue() {
            SpscLinkedArrayQueue<R> current;
            do {
                SpscLinkedArrayQueue<R> current2 = this.queue.get();
                if (current2 != null) {
                    return current2;
                }
                current = new SpscLinkedArrayQueue<>(Observable.bufferSize());
            } while (!this.queue.compareAndSet(null, current));
            return current;
        }

        void innerError(FlatMapMaybeObserver<T, R>.InnerObserver inner, Throwable e) {
            this.set.delete(inner);
            if (this.errors.addThrowable(e)) {
                if (!this.delayErrors) {
                    this.d.dispose();
                    this.set.dispose();
                }
                this.active.decrementAndGet();
                drain();
                return;
            }
            RxJavaPlugins.onError(e);
        }

        void innerComplete(FlatMapMaybeObserver<T, R>.InnerObserver inner) {
            boolean d = true;
            this.set.delete(inner);
            if (get() == 0 && compareAndSet(0, 1)) {
                if (this.active.decrementAndGet() != 0) {
                    d = false;
                }
                SpscLinkedArrayQueue<R> q = this.queue.get();
                if (d && (q == null || q.isEmpty())) {
                    Throwable ex = this.errors.terminate();
                    if (ex != null) {
                        this.actual.onError(ex);
                        return;
                    } else {
                        this.actual.onComplete();
                        return;
                    }
                } else if (decrementAndGet() != 0) {
                    drainLoop();
                    return;
                } else {
                    return;
                }
            }
            this.active.decrementAndGet();
            drain();
        }

        void drain() {
            if (getAndIncrement() == 0) {
                drainLoop();
            }
        }

        void clear() {
            SpscLinkedArrayQueue<R> q = this.queue.get();
            if (q != null) {
                q.clear();
            }
        }

        void drainLoop() {
            int missed = 1;
            Observer<? super R> a = this.actual;
            AtomicInteger n = this.active;
            AtomicReference<SpscLinkedArrayQueue<R>> qr = this.queue;
            while (!this.cancelled) {
                if (!this.delayErrors && this.errors.get() != null) {
                    Throwable ex = this.errors.terminate();
                    clear();
                    a.onError(ex);
                    return;
                }
                boolean d = n.get() == 0;
                SpscLinkedArrayQueue<R> q = qr.get();
                R mo1188poll = q != null ? q.mo1188poll() : (Object) null;
                boolean empty = mo1188poll == null;
                if (d && empty) {
                    Throwable ex2 = this.errors.terminate();
                    if (ex2 != null) {
                        a.onError(ex2);
                        return;
                    } else {
                        a.onComplete();
                        return;
                    }
                } else if (!empty) {
                    a.onNext(mo1188poll);
                } else {
                    missed = addAndGet(-missed);
                    if (missed == 0) {
                        return;
                    }
                }
            }
            clear();
        }

        /* loaded from: classes3.dex */
        final class InnerObserver extends AtomicReference<Disposable> implements MaybeObserver<R>, Disposable {
            private static final long serialVersionUID = -502562646270949838L;

            InnerObserver() {
            }

            @Override // io.reactivex.MaybeObserver
            public void onSubscribe(Disposable d) {
                DisposableHelper.setOnce(this, d);
            }

            @Override // io.reactivex.MaybeObserver
            public void onSuccess(R value) {
                FlatMapMaybeObserver.this.innerSuccess(this, value);
            }

            @Override // io.reactivex.MaybeObserver
            public void onError(Throwable e) {
                FlatMapMaybeObserver.this.innerError(this, e);
            }

            @Override // io.reactivex.MaybeObserver
            public void onComplete() {
                FlatMapMaybeObserver.this.innerComplete(this);
            }

            @Override // io.reactivex.disposables.Disposable
            public boolean isDisposed() {
                return DisposableHelper.isDisposed(get());
            }

            @Override // io.reactivex.disposables.Disposable
            public void dispose() {
                DisposableHelper.dispose(this);
            }
        }
    }
}