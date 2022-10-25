package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.SequentialDisposable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.QueueDisposable;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.internal.util.ErrorMode;
import io.reactivex.observers.SerializedObserver;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes3.dex */
public final class ObservableConcatMap<T, U> extends AbstractObservableWithUpstream<T, U> {
    final int bufferSize;
    final ErrorMode delayErrors;
    final Function<? super T, ? extends ObservableSource<? extends U>> mapper;

    public ObservableConcatMap(ObservableSource<T> source, Function<? super T, ? extends ObservableSource<? extends U>> mapper, int bufferSize, ErrorMode delayErrors) {
        super(source);
        this.mapper = mapper;
        this.delayErrors = delayErrors;
        this.bufferSize = Math.max(8, bufferSize);
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super U> s) {
        if (!ObservableScalarXMap.tryScalarXMapSubscribe(this.source, s, this.mapper)) {
            if (this.delayErrors == ErrorMode.IMMEDIATE) {
                SerializedObserver<U> serial = new SerializedObserver<>(s);
                this.source.subscribe(new SourceObserver(serial, this.mapper, this.bufferSize));
                return;
            }
            this.source.subscribe(new ConcatMapDelayErrorObserver(s, this.mapper, this.bufferSize, this.delayErrors == ErrorMode.END));
        }
    }

    /* loaded from: classes3.dex */
    static final class SourceObserver<T, U> extends AtomicInteger implements Observer<T>, Disposable {
        private static final long serialVersionUID = 8828587559905699186L;
        volatile boolean active;
        final Observer<? super U> actual;
        final int bufferSize;
        volatile boolean disposed;
        volatile boolean done;
        int fusionMode;
        final Observer<U> inner;
        final Function<? super T, ? extends ObservableSource<? extends U>> mapper;
        SimpleQueue<T> queue;
        Disposable s;
        final SequentialDisposable sa = new SequentialDisposable();

        SourceObserver(Observer<? super U> actual, Function<? super T, ? extends ObservableSource<? extends U>> mapper, int bufferSize) {
            this.actual = actual;
            this.mapper = mapper;
            this.bufferSize = bufferSize;
            this.inner = new InnerObserver(actual, this);
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                if (s instanceof QueueDisposable) {
                    QueueDisposable<T> qd = (QueueDisposable) s;
                    int m = qd.requestFusion(3);
                    if (m == 1) {
                        this.fusionMode = m;
                        this.queue = qd;
                        this.done = true;
                        this.actual.onSubscribe(this);
                        drain();
                        return;
                    } else if (m == 2) {
                        this.fusionMode = m;
                        this.queue = qd;
                        this.actual.onSubscribe(this);
                        return;
                    }
                }
                this.queue = new SpscLinkedArrayQueue(this.bufferSize);
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            if (!this.done) {
                if (this.fusionMode == 0) {
                    this.queue.offer(t);
                }
                drain();
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
                return;
            }
            this.done = true;
            dispose();
            this.actual.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                drain();
            }
        }

        void innerComplete() {
            this.active = false;
            drain();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.disposed;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.disposed = true;
            this.sa.dispose();
            this.s.dispose();
            if (getAndIncrement() == 0) {
                this.queue.clear();
            }
        }

        void innerSubscribe(Disposable s) {
            this.sa.update(s);
        }

        void drain() {
            if (getAndIncrement() == 0) {
                while (!this.disposed) {
                    if (!this.active) {
                        boolean d = this.done;
                        try {
                            T t = this.queue.mo1188poll();
                            boolean empty = t == null;
                            if (d && empty) {
                                this.actual.onComplete();
                                return;
                            } else if (!empty) {
                                try {
                                    ObservableSource<? extends U> o = (ObservableSource) ObjectHelper.requireNonNull(this.mapper.mo1190apply(t), "The mapper returned a null ObservableSource");
                                    this.active = true;
                                    o.subscribe(this.inner);
                                } catch (Throwable ex) {
                                    Exceptions.throwIfFatal(ex);
                                    dispose();
                                    this.queue.clear();
                                    this.actual.onError(ex);
                                    return;
                                }
                            }
                        } catch (Throwable ex2) {
                            Exceptions.throwIfFatal(ex2);
                            dispose();
                            this.queue.clear();
                            this.actual.onError(ex2);
                            return;
                        }
                    }
                    if (decrementAndGet() == 0) {
                        return;
                    }
                }
                this.queue.clear();
            }
        }

        /* loaded from: classes3.dex */
        static final class InnerObserver<U> implements Observer<U> {
            final Observer<? super U> actual;
            final SourceObserver<?, ?> parent;

            InnerObserver(Observer<? super U> actual, SourceObserver<?, ?> parent) {
                this.actual = actual;
                this.parent = parent;
            }

            @Override // io.reactivex.Observer
            public void onSubscribe(Disposable s) {
                this.parent.innerSubscribe(s);
            }

            @Override // io.reactivex.Observer
            public void onNext(U t) {
                this.actual.onNext(t);
            }

            @Override // io.reactivex.Observer
            public void onError(Throwable t) {
                this.parent.dispose();
                this.actual.onError(t);
            }

            @Override // io.reactivex.Observer
            public void onComplete() {
                this.parent.innerComplete();
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class ConcatMapDelayErrorObserver<T, R> extends AtomicInteger implements Observer<T>, Disposable {
        private static final long serialVersionUID = -6951100001833242599L;
        volatile boolean active;
        final Observer<? super R> actual;
        final int bufferSize;
        volatile boolean cancelled;
        Disposable d;
        volatile boolean done;
        final Function<? super T, ? extends ObservableSource<? extends R>> mapper;
        final DelayErrorInnerObserver<R> observer;
        SimpleQueue<T> queue;
        int sourceMode;
        final boolean tillTheEnd;
        final AtomicThrowable error = new AtomicThrowable();
        final SequentialDisposable arbiter = new SequentialDisposable();

        ConcatMapDelayErrorObserver(Observer<? super R> actual, Function<? super T, ? extends ObservableSource<? extends R>> mapper, int bufferSize, boolean tillTheEnd) {
            this.actual = actual;
            this.mapper = mapper;
            this.bufferSize = bufferSize;
            this.tillTheEnd = tillTheEnd;
            this.observer = new DelayErrorInnerObserver<>(actual, this);
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.validate(this.d, d)) {
                this.d = d;
                if (d instanceof QueueDisposable) {
                    QueueDisposable<T> qd = (QueueDisposable) d;
                    int m = qd.requestFusion(3);
                    if (m == 1) {
                        this.sourceMode = m;
                        this.queue = qd;
                        this.done = true;
                        this.actual.onSubscribe(this);
                        drain();
                        return;
                    } else if (m == 2) {
                        this.sourceMode = m;
                        this.queue = qd;
                        this.actual.onSubscribe(this);
                        return;
                    }
                }
                this.queue = new SpscLinkedArrayQueue(this.bufferSize);
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T value) {
            if (this.sourceMode == 0) {
                this.queue.offer(value);
            }
            drain();
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable e) {
            if (this.error.addThrowable(e)) {
                this.done = true;
                drain();
                return;
            }
            RxJavaPlugins.onError(e);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            this.done = true;
            drain();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.d.isDisposed();
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.cancelled = true;
            this.d.dispose();
            this.arbiter.dispose();
        }

        void drain() {
            if (getAndIncrement() == 0) {
                Observer<? super R> actual = this.actual;
                SimpleQueue<T> queue = this.queue;
                AtomicThrowable error = this.error;
                while (true) {
                    if (!this.active) {
                        if (this.cancelled) {
                            queue.clear();
                            return;
                        } else if (!this.tillTheEnd && error.get() != null) {
                            queue.clear();
                            actual.onError(error.terminate());
                            return;
                        } else {
                            boolean d = this.done;
                            try {
                                T v = queue.mo1188poll();
                                boolean empty = v == null;
                                if (d && empty) {
                                    Throwable ex = error.terminate();
                                    if (ex != null) {
                                        actual.onError(ex);
                                        return;
                                    } else {
                                        actual.onComplete();
                                        return;
                                    }
                                } else if (!empty) {
                                    try {
                                        ObservableSource<? extends R> o = (ObservableSource) ObjectHelper.requireNonNull(this.mapper.mo1190apply(v), "The mapper returned a null ObservableSource");
                                        if (o instanceof Callable) {
                                            try {
                                                Object obj = (Object) ((Callable) o).call();
                                                if (obj != 0 && !this.cancelled) {
                                                    actual.onNext(obj);
                                                }
                                            } catch (Throwable ex2) {
                                                Exceptions.throwIfFatal(ex2);
                                                error.addThrowable(ex2);
                                            }
                                        } else {
                                            this.active = true;
                                            o.subscribe(this.observer);
                                        }
                                    } catch (Throwable ex3) {
                                        Exceptions.throwIfFatal(ex3);
                                        this.d.dispose();
                                        queue.clear();
                                        error.addThrowable(ex3);
                                        actual.onError(error.terminate());
                                        return;
                                    }
                                }
                            } catch (Throwable ex4) {
                                Exceptions.throwIfFatal(ex4);
                                this.d.dispose();
                                error.addThrowable(ex4);
                                actual.onError(error.terminate());
                                return;
                            }
                        }
                    }
                    if (decrementAndGet() == 0) {
                        return;
                    }
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes3.dex */
        public static final class DelayErrorInnerObserver<R> implements Observer<R> {
            final Observer<? super R> actual;
            final ConcatMapDelayErrorObserver<?, R> parent;

            DelayErrorInnerObserver(Observer<? super R> actual, ConcatMapDelayErrorObserver<?, R> parent) {
                this.actual = actual;
                this.parent = parent;
            }

            @Override // io.reactivex.Observer
            public void onSubscribe(Disposable d) {
                this.parent.arbiter.replace(d);
            }

            @Override // io.reactivex.Observer
            public void onNext(R value) {
                this.actual.onNext(value);
            }

            @Override // io.reactivex.Observer
            public void onError(Throwable e) {
                ConcatMapDelayErrorObserver<?, R> p = this.parent;
                if (p.error.addThrowable(e)) {
                    if (!p.tillTheEnd) {
                        p.d.dispose();
                    }
                    p.active = false;
                    p.drain();
                    return;
                }
                RxJavaPlugins.onError(e);
            }

            @Override // io.reactivex.Observer
            public void onComplete() {
                ConcatMapDelayErrorObserver<?, R> p = this.parent;
                p.active = false;
                p.drain();
            }
        }
    }
}
