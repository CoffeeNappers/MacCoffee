package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.SimplePlainQueue;
import io.reactivex.internal.observers.QueueDrainObserver;
import io.reactivex.internal.queue.MpscLinkedQueue;
import io.reactivex.internal.util.QueueDrainHelper;
import io.reactivex.observers.DisposableObserver;
import io.reactivex.observers.SerializedObserver;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes3.dex */
public final class ObservableBufferBoundary<T, U extends Collection<? super T>, Open, Close> extends AbstractObservableWithUpstream<T, U> {
    final Function<? super Open, ? extends ObservableSource<? extends Close>> bufferClose;
    final ObservableSource<? extends Open> bufferOpen;
    final Callable<U> bufferSupplier;

    public ObservableBufferBoundary(ObservableSource<T> source, ObservableSource<? extends Open> bufferOpen, Function<? super Open, ? extends ObservableSource<? extends Close>> bufferClose, Callable<U> bufferSupplier) {
        super(source);
        this.bufferOpen = bufferOpen;
        this.bufferClose = bufferClose;
        this.bufferSupplier = bufferSupplier;
    }

    @Override // io.reactivex.Observable
    protected void subscribeActual(Observer<? super U> t) {
        this.source.subscribe(new BufferBoundaryObserver(new SerializedObserver(t), this.bufferOpen, this.bufferClose, this.bufferSupplier));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class BufferBoundaryObserver<T, U extends Collection<? super T>, Open, Close> extends QueueDrainObserver<T, U, U> implements Disposable {
        final Function<? super Open, ? extends ObservableSource<? extends Close>> bufferClose;
        final ObservableSource<? extends Open> bufferOpen;
        final Callable<U> bufferSupplier;
        final List<U> buffers;
        final CompositeDisposable resources;
        Disposable s;
        final AtomicInteger windows;

        /* JADX WARN: Multi-variable type inference failed */
        @Override // io.reactivex.internal.observers.QueueDrainObserver, io.reactivex.internal.util.ObservableQueueDrain
        public /* bridge */ /* synthetic */ void accept(Observer x0, Object x1) {
            accept((Observer<? super Observer>) x0, (Observer) ((Collection) x1));
        }

        BufferBoundaryObserver(Observer<? super U> actual, ObservableSource<? extends Open> bufferOpen, Function<? super Open, ? extends ObservableSource<? extends Close>> bufferClose, Callable<U> bufferSupplier) {
            super(actual, new MpscLinkedQueue());
            this.windows = new AtomicInteger();
            this.bufferOpen = bufferOpen;
            this.bufferClose = bufferClose;
            this.bufferSupplier = bufferSupplier;
            this.buffers = new LinkedList();
            this.resources = new CompositeDisposable();
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                BufferOpenObserver<T, U, Open, Close> bos = new BufferOpenObserver<>(this);
                this.resources.add(bos);
                this.actual.onSubscribe(this);
                this.windows.lazySet(1);
                this.bufferOpen.subscribe(bos);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            synchronized (this) {
                for (U b : this.buffers) {
                    b.add(t);
                }
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            dispose();
            this.cancelled = true;
            synchronized (this) {
                this.buffers.clear();
            }
            this.actual.onError(t);
        }

        @Override // io.reactivex.Observer
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
                QueueDrainHelper.drainLoop(simplePlainQueue, this.actual, false, this, this);
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.resources.dispose();
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.cancelled;
        }

        public void accept(Observer<? super U> a, U v) {
            a.onNext(v);
        }

        /* JADX WARN: Multi-variable type inference failed */
        void open(Open window) {
            if (!this.cancelled) {
                try {
                    Collection collection = (Collection) ObjectHelper.requireNonNull(this.bufferSupplier.call(), "The buffer supplied is null");
                    try {
                        ObservableSource<? extends Close> p = (ObservableSource) ObjectHelper.requireNonNull(this.bufferClose.mo1190apply(window), "The buffer closing Observable is null");
                        if (!this.cancelled) {
                            synchronized (this) {
                                if (!this.cancelled) {
                                    this.buffers.add(collection);
                                    BufferCloseObserver<T, U, Open, Close> bcs = new BufferCloseObserver<>(collection, this);
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
                fastPathOrderedEmit(b, false, this);
            }
            if (this.resources.remove(d) && this.windows.decrementAndGet() == 0) {
                complete();
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class BufferOpenObserver<T, U extends Collection<? super T>, Open, Close> extends DisposableObserver<Open> {
        boolean done;
        final BufferBoundaryObserver<T, U, Open, Close> parent;

        BufferOpenObserver(BufferBoundaryObserver<T, U, Open, Close> parent) {
            this.parent = parent;
        }

        @Override // io.reactivex.Observer
        public void onNext(Open t) {
            if (!this.done) {
                this.parent.open(t);
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
                this.parent.openFinished(this);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class BufferCloseObserver<T, U extends Collection<? super T>, Open, Close> extends DisposableObserver<Close> {
        boolean done;
        final BufferBoundaryObserver<T, U, Open, Close> parent;
        final U value;

        BufferCloseObserver(U value, BufferBoundaryObserver<T, U, Open, Close> parent) {
            this.parent = parent;
            this.value = value;
        }

        @Override // io.reactivex.Observer
        public void onNext(Close t) {
            onComplete();
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
            } else {
                this.parent.onError(t);
            }
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                this.parent.close(this.value, this);
            }
        }
    }
}
