package io.reactivex.internal.operators.observable;

import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.observers.QueueDrainObserver;
import io.reactivex.internal.queue.MpscLinkedQueue;
import io.reactivex.internal.util.NotificationLite;
import io.reactivex.observers.DisposableObserver;
import io.reactivex.observers.SerializedObserver;
import io.reactivex.plugins.RxJavaPlugins;
import io.reactivex.subjects.UnicastSubject;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class ObservableWindowBoundarySupplier<T, B> extends AbstractObservableWithUpstream<T, Observable<T>> {
    final int bufferSize;
    final Callable<? extends ObservableSource<B>> other;

    public ObservableWindowBoundarySupplier(ObservableSource<T> source, Callable<? extends ObservableSource<B>> other, int bufferSize) {
        super(source);
        this.other = other;
        this.bufferSize = bufferSize;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super Observable<T>> t) {
        this.source.subscribe(new WindowBoundaryMainObserver(new SerializedObserver(t), this.other, this.bufferSize));
    }

    /* loaded from: classes3.dex */
    static final class WindowBoundaryMainObserver<T, B> extends QueueDrainObserver<T, Object, Observable<T>> implements Disposable {
        static final Object NEXT = new Object();
        final AtomicReference<Disposable> boundary;
        final int bufferSize;
        final Callable<? extends ObservableSource<B>> other;
        Disposable s;
        UnicastSubject<T> window;
        final AtomicLong windows;

        WindowBoundaryMainObserver(Observer<? super Observable<T>> actual, Callable<? extends ObservableSource<B>> other, int bufferSize) {
            super(actual, new MpscLinkedQueue());
            this.boundary = new AtomicReference<>();
            this.windows = new AtomicLong();
            this.other = other;
            this.bufferSize = bufferSize;
            this.windows.lazySet(1L);
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                Observer<? super V> observer = this.actual;
                observer.onSubscribe(this);
                if (!this.cancelled) {
                    try {
                        ObservableSource<B> p = (ObservableSource) ObjectHelper.requireNonNull(this.other.call(), "The first window ObservableSource supplied is null");
                        UnicastSubject<T> w = UnicastSubject.create(this.bufferSize);
                        this.window = w;
                        observer.onNext(w);
                        WindowBoundaryInnerObserver<T, B> inner = new WindowBoundaryInnerObserver<>(this);
                        if (this.boundary.compareAndSet(null, inner)) {
                            this.windows.getAndIncrement();
                            p.subscribe(inner);
                        }
                    } catch (Throwable e) {
                        Exceptions.throwIfFatal(e);
                        s.dispose();
                        observer.onError(e);
                    }
                }
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            if (fastEnter()) {
                UnicastSubject<T> w = this.window;
                w.onNext(t);
                if (leave(-1) == 0) {
                    return;
                }
            } else {
                this.queue.offer(NotificationLite.next(t));
                if (!enter()) {
                    return;
                }
            }
            drainLoop();
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
                return;
            }
            this.error = t;
            this.done = true;
            if (enter()) {
                drainLoop();
            }
            if (this.windows.decrementAndGet() == 0) {
                DisposableHelper.dispose(this.boundary);
            }
            this.actual.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                if (enter()) {
                    drainLoop();
                }
                if (this.windows.decrementAndGet() == 0) {
                    DisposableHelper.dispose(this.boundary);
                }
                this.actual.onComplete();
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.cancelled = true;
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.cancelled;
        }

        /* JADX WARN: Multi-variable type inference failed */
        void drainLoop() {
            MpscLinkedQueue<Object> q = (MpscLinkedQueue) this.queue;
            Observer<? super V> observer = this.actual;
            int missed = 1;
            UnicastSubject<T> unicastSubject = this.window;
            while (true) {
                boolean d = this.done;
                Object o = q.mo1188poll();
                boolean empty = o == null;
                if (d && empty) {
                    DisposableHelper.dispose(this.boundary);
                    Throwable e = this.error;
                    if (e != null) {
                        UnicastSubject<T> w = unicastSubject;
                        w.onError(e);
                        return;
                    }
                    UnicastSubject<T> w2 = unicastSubject;
                    w2.onComplete();
                    return;
                } else if (!empty) {
                    if (o == NEXT) {
                        UnicastSubject<T> w3 = unicastSubject;
                        w3.onComplete();
                        if (this.windows.decrementAndGet() == 0) {
                            DisposableHelper.dispose(this.boundary);
                            return;
                        } else if (!this.cancelled) {
                            try {
                                ObservableSource<B> p = (ObservableSource) ObjectHelper.requireNonNull(this.other.call(), "The ObservableSource supplied is null");
                                UnicastSubject<T> w4 = UnicastSubject.create(this.bufferSize);
                                unicastSubject = w4;
                                this.windows.getAndIncrement();
                                this.window = unicastSubject;
                                observer.onNext(unicastSubject);
                                WindowBoundaryInnerObserver<T, B> b = new WindowBoundaryInnerObserver<>(this);
                                if (this.boundary.compareAndSet(this.boundary.get(), b)) {
                                    p.subscribe(b);
                                }
                            } catch (Throwable e2) {
                                Exceptions.throwIfFatal(e2);
                                DisposableHelper.dispose(this.boundary);
                                observer.onError(e2);
                                return;
                            }
                        } else {
                            continue;
                        }
                    } else {
                        UnicastSubject<T> w5 = unicastSubject;
                        w5.onNext(NotificationLite.getValue(o));
                    }
                } else {
                    missed = leave(-missed);
                    if (missed == 0) {
                        return;
                    }
                }
            }
        }

        void next() {
            this.queue.offer(NEXT);
            if (enter()) {
                drainLoop();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class WindowBoundaryInnerObserver<T, B> extends DisposableObserver<B> {
        boolean done;
        final WindowBoundaryMainObserver<T, B> parent;

        WindowBoundaryInnerObserver(WindowBoundaryMainObserver<T, B> parent) {
            this.parent = parent;
        }

        @Override // io.reactivex.Observer
        public void onNext(B t) {
            if (!this.done) {
                this.done = true;
                dispose();
                this.parent.next();
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
                return;
            }
            this.done = true;
            this.parent.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                this.parent.onComplete();
            }
        }
    }
}
