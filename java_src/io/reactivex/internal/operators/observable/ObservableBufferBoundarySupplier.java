package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.observers.QueueDrainObserver;
import io.reactivex.internal.queue.MpscLinkedQueue;
import io.reactivex.internal.util.QueueDrainHelper;
import io.reactivex.observers.DisposableObserver;
import io.reactivex.observers.SerializedObserver;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Collection;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class ObservableBufferBoundarySupplier<T, U extends Collection<? super T>, B> extends AbstractObservableWithUpstream<T, U> {
    final Callable<? extends ObservableSource<B>> boundarySupplier;
    final Callable<U> bufferSupplier;

    public ObservableBufferBoundarySupplier(ObservableSource<T> source, Callable<? extends ObservableSource<B>> boundarySupplier, Callable<U> bufferSupplier) {
        super(source);
        this.boundarySupplier = boundarySupplier;
        this.bufferSupplier = bufferSupplier;
    }

    @Override // io.reactivex.Observable
    protected void subscribeActual(Observer<? super U> t) {
        this.source.subscribe(new BufferBoundarySupplierObserver(new SerializedObserver(t), this.bufferSupplier, this.boundarySupplier));
    }

    /* loaded from: classes3.dex */
    static final class BufferBoundarySupplierObserver<T, U extends Collection<? super T>, B> extends QueueDrainObserver<T, U, U> implements Observer<T>, Disposable {
        final Callable<? extends ObservableSource<B>> boundarySupplier;
        U buffer;
        final Callable<U> bufferSupplier;
        final AtomicReference<Disposable> other;
        Disposable s;

        /* JADX WARN: Multi-variable type inference failed */
        @Override // io.reactivex.internal.observers.QueueDrainObserver, io.reactivex.internal.util.ObservableQueueDrain
        public /* bridge */ /* synthetic */ void accept(Observer x0, Object x1) {
            accept((Observer<? super Observer>) x0, (Observer) ((Collection) x1));
        }

        BufferBoundarySupplierObserver(Observer<? super U> actual, Callable<U> bufferSupplier, Callable<? extends ObservableSource<B>> boundarySupplier) {
            super(actual, new MpscLinkedQueue());
            this.other = new AtomicReference<>();
            this.bufferSupplier = bufferSupplier;
            this.boundarySupplier = boundarySupplier;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                Observer<? super V> observer = this.actual;
                try {
                    U b = (U) ObjectHelper.requireNonNull(this.bufferSupplier.call(), "The buffer supplied is null");
                    this.buffer = b;
                    try {
                        ObservableSource<B> boundary = (ObservableSource) ObjectHelper.requireNonNull(this.boundarySupplier.call(), "The boundary publisher supplied is null");
                        BufferBoundaryObserver<T, U, B> bs = new BufferBoundaryObserver<>(this);
                        this.other.set(bs);
                        observer.onSubscribe(this);
                        if (!this.cancelled) {
                            boundary.subscribe(bs);
                        }
                    } catch (Throwable ex) {
                        Exceptions.throwIfFatal(ex);
                        this.cancelled = true;
                        s.dispose();
                        EmptyDisposable.error(ex, observer);
                    }
                } catch (Throwable e) {
                    Exceptions.throwIfFatal(e);
                    this.cancelled = true;
                    s.dispose();
                    EmptyDisposable.error(e, observer);
                }
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            synchronized (this) {
                U b = this.buffer;
                if (b != null) {
                    b.add(t);
                }
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            dispose();
            this.actual.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            synchronized (this) {
                U b = this.buffer;
                if (b != null) {
                    this.buffer = null;
                    this.queue.offer(b);
                    this.done = true;
                    if (enter()) {
                        QueueDrainHelper.drainLoop(this.queue, this.actual, false, this, this);
                    }
                }
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.s.dispose();
                disposeOther();
                if (enter()) {
                    this.queue.clear();
                }
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.cancelled;
        }

        void disposeOther() {
            DisposableHelper.dispose(this.other);
        }

        void next() {
            try {
                U next = (U) ObjectHelper.requireNonNull(this.bufferSupplier.call(), "The buffer supplied is null");
                try {
                    ObservableSource<B> boundary = (ObservableSource) ObjectHelper.requireNonNull(this.boundarySupplier.call(), "The boundary publisher supplied is null");
                    BufferBoundaryObserver<T, U, B> bs = new BufferBoundaryObserver<>(this);
                    Disposable o = this.other.get();
                    if (this.other.compareAndSet(o, bs)) {
                        synchronized (this) {
                            U b = this.buffer;
                            if (b != null) {
                                this.buffer = next;
                                boundary.subscribe(bs);
                                fastPathEmit(b, false, this);
                            }
                        }
                    }
                } catch (Throwable ex) {
                    Exceptions.throwIfFatal(ex);
                    this.cancelled = true;
                    this.s.dispose();
                    this.actual.onError(ex);
                }
            } catch (Throwable e) {
                Exceptions.throwIfFatal(e);
                dispose();
                this.actual.onError(e);
            }
        }

        public void accept(Observer<? super U> a, U v) {
            this.actual.onNext(v);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class BufferBoundaryObserver<T, U extends Collection<? super T>, B> extends DisposableObserver<B> {
        boolean once;
        final BufferBoundarySupplierObserver<T, U, B> parent;

        BufferBoundaryObserver(BufferBoundarySupplierObserver<T, U, B> parent) {
            this.parent = parent;
        }

        @Override // io.reactivex.Observer
        public void onNext(B t) {
            if (!this.once) {
                this.once = true;
                dispose();
                this.parent.next();
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            if (this.once) {
                RxJavaPlugins.onError(t);
                return;
            }
            this.once = true;
            this.parent.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            if (!this.once) {
                this.once = true;
                this.parent.next();
            }
        }
    }
}
