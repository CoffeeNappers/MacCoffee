package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.ObserverFullArbiter;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.observers.FullArbiterObserver;
import io.reactivex.observers.DisposableObserver;
import io.reactivex.observers.SerializedObserver;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class ObservableTimeout<T, U, V> extends AbstractObservableWithUpstream<T, T> {
    final ObservableSource<U> firstTimeoutIndicator;
    final Function<? super T, ? extends ObservableSource<V>> itemTimeoutIndicator;
    final ObservableSource<? extends T> other;

    /* loaded from: classes3.dex */
    interface OnTimeout {
        void innerError(Throwable th);

        void timeout(long j);
    }

    public ObservableTimeout(ObservableSource<T> source, ObservableSource<U> firstTimeoutIndicator, Function<? super T, ? extends ObservableSource<V>> itemTimeoutIndicator, ObservableSource<? extends T> other) {
        super(source);
        this.firstTimeoutIndicator = firstTimeoutIndicator;
        this.itemTimeoutIndicator = itemTimeoutIndicator;
        this.other = other;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> t) {
        if (this.other == null) {
            this.source.subscribe(new TimeoutObserver(new SerializedObserver(t), this.firstTimeoutIndicator, this.itemTimeoutIndicator));
        } else {
            this.source.subscribe(new TimeoutOtherObserver(t, this.firstTimeoutIndicator, this.itemTimeoutIndicator, this.other));
        }
    }

    /* loaded from: classes3.dex */
    static final class TimeoutObserver<T, U, V> extends AtomicReference<Disposable> implements Observer<T>, Disposable, OnTimeout {
        private static final long serialVersionUID = 2672739326310051084L;
        final Observer<? super T> actual;
        final ObservableSource<U> firstTimeoutIndicator;
        volatile long index;
        final Function<? super T, ? extends ObservableSource<V>> itemTimeoutIndicator;
        Disposable s;

        TimeoutObserver(Observer<? super T> actual, ObservableSource<U> firstTimeoutIndicator, Function<? super T, ? extends ObservableSource<V>> itemTimeoutIndicator) {
            this.actual = actual;
            this.firstTimeoutIndicator = firstTimeoutIndicator;
            this.itemTimeoutIndicator = itemTimeoutIndicator;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                Observer<? super T> a = this.actual;
                ObservableSource<U> p = this.firstTimeoutIndicator;
                if (p != null) {
                    TimeoutInnerObserver timeoutInnerObserver = new TimeoutInnerObserver(this, 0L);
                    if (compareAndSet(null, timeoutInnerObserver)) {
                        a.onSubscribe(this);
                        p.subscribe(timeoutInnerObserver);
                        return;
                    }
                    return;
                }
                a.onSubscribe(this);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            long idx = this.index + 1;
            this.index = idx;
            this.actual.onNext(t);
            Disposable d = (Disposable) get();
            if (d != null) {
                d.dispose();
            }
            try {
                ObservableSource<V> p = (ObservableSource) ObjectHelper.requireNonNull(this.itemTimeoutIndicator.mo1190apply(t), "The ObservableSource returned is null");
                TimeoutInnerObserver timeoutInnerObserver = new TimeoutInnerObserver(this, idx);
                if (compareAndSet(d, timeoutInnerObserver)) {
                    p.subscribe(timeoutInnerObserver);
                }
            } catch (Throwable e) {
                Exceptions.throwIfFatal(e);
                dispose();
                this.actual.onError(e);
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            DisposableHelper.dispose(this);
            this.actual.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            DisposableHelper.dispose(this);
            this.actual.onComplete();
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            if (DisposableHelper.dispose(this)) {
                this.s.dispose();
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.s.isDisposed();
        }

        @Override // io.reactivex.internal.operators.observable.ObservableTimeout.OnTimeout
        public void timeout(long idx) {
            if (idx == this.index) {
                dispose();
                this.actual.onError(new TimeoutException());
            }
        }

        @Override // io.reactivex.internal.operators.observable.ObservableTimeout.OnTimeout
        public void innerError(Throwable e) {
            this.s.dispose();
            this.actual.onError(e);
        }
    }

    /* loaded from: classes3.dex */
    static final class TimeoutInnerObserver<T, U, V> extends DisposableObserver<Object> {
        boolean done;
        final long index;
        final OnTimeout parent;

        TimeoutInnerObserver(OnTimeout parent, long index) {
            this.parent = parent;
            this.index = index;
        }

        @Override // io.reactivex.Observer
        public void onNext(Object t) {
            if (!this.done) {
                this.done = true;
                dispose();
                this.parent.timeout(this.index);
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
                return;
            }
            this.done = true;
            this.parent.innerError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                this.parent.timeout(this.index);
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class TimeoutOtherObserver<T, U, V> extends AtomicReference<Disposable> implements Observer<T>, Disposable, OnTimeout {
        private static final long serialVersionUID = -1957813281749686898L;
        final Observer<? super T> actual;
        final ObserverFullArbiter<T> arbiter;
        boolean done;
        final ObservableSource<U> firstTimeoutIndicator;
        volatile long index;
        final Function<? super T, ? extends ObservableSource<V>> itemTimeoutIndicator;
        final ObservableSource<? extends T> other;
        Disposable s;

        TimeoutOtherObserver(Observer<? super T> actual, ObservableSource<U> firstTimeoutIndicator, Function<? super T, ? extends ObservableSource<V>> itemTimeoutIndicator, ObservableSource<? extends T> other) {
            this.actual = actual;
            this.firstTimeoutIndicator = firstTimeoutIndicator;
            this.itemTimeoutIndicator = itemTimeoutIndicator;
            this.other = other;
            this.arbiter = new ObserverFullArbiter<>(actual, this, 8);
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                this.arbiter.setDisposable(s);
                Observer<? super T> a = this.actual;
                ObservableSource<U> p = this.firstTimeoutIndicator;
                if (p != null) {
                    TimeoutInnerObserver timeoutInnerObserver = new TimeoutInnerObserver(this, 0L);
                    if (compareAndSet(null, timeoutInnerObserver)) {
                        a.onSubscribe(this.arbiter);
                        p.subscribe(timeoutInnerObserver);
                        return;
                    }
                    return;
                }
                a.onSubscribe(this.arbiter);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            if (!this.done) {
                long idx = this.index + 1;
                this.index = idx;
                if (this.arbiter.onNext(t, this.s)) {
                    Disposable d = (Disposable) get();
                    if (d != null) {
                        d.dispose();
                    }
                    try {
                        ObservableSource<V> p = (ObservableSource) ObjectHelper.requireNonNull(this.itemTimeoutIndicator.mo1190apply(t), "The ObservableSource returned is null");
                        TimeoutInnerObserver timeoutInnerObserver = new TimeoutInnerObserver(this, idx);
                        if (compareAndSet(d, timeoutInnerObserver)) {
                            p.subscribe(timeoutInnerObserver);
                        }
                    } catch (Throwable e) {
                        Exceptions.throwIfFatal(e);
                        this.actual.onError(e);
                    }
                }
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
            this.arbiter.onError(t, this.s);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                dispose();
                this.arbiter.onComplete(this.s);
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            if (DisposableHelper.dispose(this)) {
                this.s.dispose();
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.s.isDisposed();
        }

        @Override // io.reactivex.internal.operators.observable.ObservableTimeout.OnTimeout
        public void timeout(long idx) {
            if (idx == this.index) {
                dispose();
                this.other.subscribe(new FullArbiterObserver(this.arbiter));
            }
        }

        @Override // io.reactivex.internal.operators.observable.ObservableTimeout.OnTimeout
        public void innerError(Throwable e) {
            this.s.dispose();
            this.actual.onError(e);
        }
    }
}
