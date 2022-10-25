package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
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
public final class ObservableSwitchMap<T, R> extends AbstractObservableWithUpstream<T, R> {
    final int bufferSize;
    final boolean delayErrors;
    final Function<? super T, ? extends ObservableSource<? extends R>> mapper;

    public ObservableSwitchMap(ObservableSource<T> source, Function<? super T, ? extends ObservableSource<? extends R>> mapper, int bufferSize, boolean delayErrors) {
        super(source);
        this.mapper = mapper;
        this.bufferSize = bufferSize;
        this.delayErrors = delayErrors;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super R> t) {
        if (!ObservableScalarXMap.tryScalarXMapSubscribe(this.source, t, this.mapper)) {
            this.source.subscribe(new SwitchMapObserver(t, this.mapper, this.bufferSize, this.delayErrors));
        }
    }

    /* loaded from: classes3.dex */
    static final class SwitchMapObserver<T, R> extends AtomicInteger implements Observer<T>, Disposable {
        static final SwitchMapInnerObserver<Object, Object> CANCELLED = new SwitchMapInnerObserver<>(null, -1, 1);
        private static final long serialVersionUID = -3491074160481096299L;
        final Observer<? super R> actual;
        final int bufferSize;
        volatile boolean cancelled;
        final boolean delayErrors;
        volatile boolean done;
        final Function<? super T, ? extends ObservableSource<? extends R>> mapper;
        Disposable s;
        volatile long unique;
        final AtomicReference<SwitchMapInnerObserver<T, R>> active = new AtomicReference<>();
        final AtomicThrowable errors = new AtomicThrowable();

        static {
            CANCELLED.cancel();
        }

        SwitchMapObserver(Observer<? super R> actual, Function<? super T, ? extends ObservableSource<? extends R>> mapper, int bufferSize, boolean delayErrors) {
            this.actual = actual;
            this.mapper = mapper;
            this.bufferSize = bufferSize;
            this.delayErrors = delayErrors;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            SwitchMapInnerObserver<T, R> inner;
            long c = this.unique + 1;
            this.unique = c;
            SwitchMapInnerObserver<T, R> inner2 = this.active.get();
            if (inner2 != null) {
                inner2.cancel();
            }
            try {
                ObservableSource<? extends R> p = (ObservableSource) ObjectHelper.requireNonNull(this.mapper.mo1190apply(t), "The ObservableSource returned is null");
                SwitchMapInnerObserver<T, R> nextInner = new SwitchMapInnerObserver<>(this, c, this.bufferSize);
                do {
                    inner = this.active.get();
                    if (inner == CANCELLED) {
                        return;
                    }
                } while (!this.active.compareAndSet(inner, nextInner));
                p.subscribe(nextInner);
            } catch (Throwable e) {
                Exceptions.throwIfFatal(e);
                this.s.dispose();
                onError(e);
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            if (this.done || !this.errors.addThrowable(t)) {
                if (!this.delayErrors) {
                    disposeInner();
                }
                RxJavaPlugins.onError(t);
                return;
            }
            this.done = true;
            drain();
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                drain();
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.s.dispose();
                disposeInner();
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.cancelled;
        }

        /* JADX WARN: Multi-variable type inference failed */
        void disposeInner() {
            SwitchMapInnerObserver<T, R> a = this.active.get();
            if (a != CANCELLED) {
                SwitchMapInnerObserver<T, R> a2 = this.active.getAndSet(CANCELLED);
                SwitchMapInnerObserver<T, R> a3 = a2;
                if (a3 != CANCELLED && a3 != null) {
                    a3.cancel();
                }
            }
        }

        void drain() {
            if (getAndIncrement() == 0) {
                Observer<? super R> a = this.actual;
                int missing = 1;
                while (!this.cancelled) {
                    if (this.done) {
                        boolean empty = this.active.get() == null;
                        if (this.delayErrors) {
                            if (empty) {
                                Throwable ex = this.errors.get();
                                if (ex != null) {
                                    a.onError(ex);
                                    return;
                                } else {
                                    a.onComplete();
                                    return;
                                }
                            }
                        } else {
                            Throwable ex2 = this.errors.get();
                            if (ex2 != null) {
                                a.onError(this.errors.terminate());
                                return;
                            } else if (empty) {
                                a.onComplete();
                                return;
                            }
                        }
                    }
                    SwitchMapInnerObserver<T, R> inner = this.active.get();
                    if (inner != null) {
                        SpscLinkedArrayQueue<R> q = inner.queue;
                        if (inner.done) {
                            boolean empty2 = q.isEmpty();
                            if (this.delayErrors) {
                                if (empty2) {
                                    this.active.compareAndSet(inner, null);
                                }
                            } else {
                                Throwable ex3 = this.errors.get();
                                if (ex3 != null) {
                                    a.onError(this.errors.terminate());
                                    return;
                                } else if (empty2) {
                                    this.active.compareAndSet(inner, null);
                                }
                            }
                        }
                        boolean retry = false;
                        while (!this.cancelled) {
                            if (inner != this.active.get()) {
                                retry = true;
                            } else {
                                if (!this.delayErrors) {
                                    Throwable ex4 = this.errors.get();
                                    if (ex4 != null) {
                                        a.onError(this.errors.terminate());
                                        return;
                                    }
                                }
                                boolean d = inner.done;
                                Object obj = (R) q.mo1188poll();
                                boolean empty3 = obj == null;
                                if (d && empty3) {
                                    this.active.compareAndSet(inner, null);
                                    retry = true;
                                } else if (!empty3) {
                                    a.onNext(obj);
                                }
                            }
                            if (retry) {
                                continue;
                            }
                        }
                        return;
                    }
                    missing = addAndGet(-missing);
                    if (missing == 0) {
                        return;
                    }
                }
            }
        }

        void innerError(SwitchMapInnerObserver<T, R> inner, Throwable ex) {
            if (inner.index == this.unique && this.errors.addThrowable(ex)) {
                if (!this.delayErrors) {
                    this.s.dispose();
                }
                inner.done = true;
                drain();
                return;
            }
            RxJavaPlugins.onError(ex);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class SwitchMapInnerObserver<T, R> extends AtomicReference<Disposable> implements Observer<R> {
        private static final long serialVersionUID = 3837284832786408377L;
        volatile boolean done;
        final long index;
        final SwitchMapObserver<T, R> parent;
        final SpscLinkedArrayQueue<R> queue;

        SwitchMapInnerObserver(SwitchMapObserver<T, R> parent, long index, int bufferSize) {
            this.parent = parent;
            this.index = index;
            this.queue = new SpscLinkedArrayQueue<>(bufferSize);
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            DisposableHelper.setOnce(this, s);
        }

        @Override // io.reactivex.Observer
        public void onNext(R t) {
            if (this.index == this.parent.unique) {
                this.queue.offer(t);
                this.parent.drain();
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.parent.innerError(this, t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            if (this.index == this.parent.unique) {
                this.done = true;
                this.parent.drain();
            }
        }

        public void cancel() {
            DisposableHelper.dispose(this);
        }
    }
}
