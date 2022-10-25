package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.Scheduler;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.observers.QueueDrainObserver;
import io.reactivex.internal.queue.MpscLinkedQueue;
import io.reactivex.internal.util.QueueDrainHelper;
import io.reactivex.observers.SerializedObserver;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class ObservableBufferTimed<T, U extends Collection<? super T>> extends AbstractObservableWithUpstream<T, U> {
    final Callable<U> bufferSupplier;
    final int maxSize;
    final boolean restartTimerOnMaxSize;
    final Scheduler scheduler;
    final long timeskip;
    final long timespan;
    final TimeUnit unit;

    public ObservableBufferTimed(ObservableSource<T> source, long timespan, long timeskip, TimeUnit unit, Scheduler scheduler, Callable<U> bufferSupplier, int maxSize, boolean restartTimerOnMaxSize) {
        super(source);
        this.timespan = timespan;
        this.timeskip = timeskip;
        this.unit = unit;
        this.scheduler = scheduler;
        this.bufferSupplier = bufferSupplier;
        this.maxSize = maxSize;
        this.restartTimerOnMaxSize = restartTimerOnMaxSize;
    }

    @Override // io.reactivex.Observable
    protected void subscribeActual(Observer<? super U> t) {
        if (this.timespan == this.timeskip && this.maxSize == Integer.MAX_VALUE) {
            this.source.subscribe(new BufferExactUnboundedObserver(new SerializedObserver(t), this.bufferSupplier, this.timespan, this.unit, this.scheduler));
            return;
        }
        Scheduler.Worker w = this.scheduler.createWorker();
        if (this.timespan == this.timeskip) {
            this.source.subscribe(new BufferExactBoundedObserver(new SerializedObserver(t), this.bufferSupplier, this.timespan, this.unit, this.maxSize, this.restartTimerOnMaxSize, w));
        } else {
            this.source.subscribe(new BufferSkipBoundedObserver(new SerializedObserver(t), this.bufferSupplier, this.timespan, this.timeskip, this.unit, w));
        }
    }

    /* loaded from: classes3.dex */
    static final class BufferExactUnboundedObserver<T, U extends Collection<? super T>> extends QueueDrainObserver<T, U, U> implements Runnable, Disposable {
        U buffer;
        final Callable<U> bufferSupplier;
        Disposable s;
        final Scheduler scheduler;
        final AtomicReference<Disposable> timer;
        final long timespan;
        final TimeUnit unit;

        /* JADX WARN: Multi-variable type inference failed */
        @Override // io.reactivex.internal.observers.QueueDrainObserver, io.reactivex.internal.util.ObservableQueueDrain
        public /* bridge */ /* synthetic */ void accept(Observer x0, Object x1) {
            accept((Observer<? super Observer>) x0, (Observer) ((Collection) x1));
        }

        BufferExactUnboundedObserver(Observer<? super U> actual, Callable<U> bufferSupplier, long timespan, TimeUnit unit, Scheduler scheduler) {
            super(actual, new MpscLinkedQueue());
            this.timer = new AtomicReference<>();
            this.bufferSupplier = bufferSupplier;
            this.timespan = timespan;
            this.unit = unit;
            this.scheduler = scheduler;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                try {
                    U b = (U) ObjectHelper.requireNonNull(this.bufferSupplier.call(), "The buffer supplied is null");
                    this.buffer = b;
                    this.actual.onSubscribe(this);
                    if (!this.cancelled) {
                        Disposable d = this.scheduler.schedulePeriodicallyDirect(this, this.timespan, this.timespan, this.unit);
                        if (!this.timer.compareAndSet(null, d)) {
                            d.dispose();
                        }
                    }
                } catch (Throwable e) {
                    Exceptions.throwIfFatal(e);
                    dispose();
                    EmptyDisposable.error(e, this.actual);
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
            synchronized (this) {
                this.buffer = null;
            }
            this.actual.onError(t);
            DisposableHelper.dispose(this.timer);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            U b;
            synchronized (this) {
                b = this.buffer;
                this.buffer = null;
            }
            if (b != null) {
                this.queue.offer(b);
                this.done = true;
                if (enter()) {
                    QueueDrainHelper.drainLoop(this.queue, this.actual, false, this, this);
                }
            }
            DisposableHelper.dispose(this.timer);
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            DisposableHelper.dispose(this.timer);
            this.s.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.timer.get() == DisposableHelper.DISPOSED;
        }

        @Override // java.lang.Runnable
        public void run() {
            U current;
            try {
                U next = (U) ObjectHelper.requireNonNull(this.bufferSupplier.call(), "The bufferSupplier returned a null buffer");
                synchronized (this) {
                    current = this.buffer;
                    if (current != null) {
                        this.buffer = next;
                    }
                }
                if (current == null) {
                    DisposableHelper.dispose(this.timer);
                } else {
                    fastPathEmit(current, false, this);
                }
            } catch (Throwable e) {
                Exceptions.throwIfFatal(e);
                this.actual.onError(e);
                dispose();
            }
        }

        public void accept(Observer<? super U> a, U v) {
            this.actual.onNext(v);
        }
    }

    /* loaded from: classes3.dex */
    static final class BufferSkipBoundedObserver<T, U extends Collection<? super T>> extends QueueDrainObserver<T, U, U> implements Runnable, Disposable {
        final Callable<U> bufferSupplier;
        final List<U> buffers;
        Disposable s;
        final long timeskip;
        final long timespan;
        final TimeUnit unit;
        final Scheduler.Worker w;

        /* JADX WARN: Multi-variable type inference failed */
        @Override // io.reactivex.internal.observers.QueueDrainObserver, io.reactivex.internal.util.ObservableQueueDrain
        public /* bridge */ /* synthetic */ void accept(Observer x0, Object x1) {
            accept((Observer<? super Observer>) x0, (Observer) ((Collection) x1));
        }

        BufferSkipBoundedObserver(Observer<? super U> actual, Callable<U> bufferSupplier, long timespan, long timeskip, TimeUnit unit, Scheduler.Worker w) {
            super(actual, new MpscLinkedQueue());
            this.bufferSupplier = bufferSupplier;
            this.timespan = timespan;
            this.timeskip = timeskip;
            this.unit = unit;
            this.w = w;
            this.buffers = new LinkedList();
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                try {
                    Collection collection = (Collection) ObjectHelper.requireNonNull(this.bufferSupplier.call(), "The buffer supplied is null");
                    this.buffers.add(collection);
                    this.actual.onSubscribe(this);
                    this.w.schedulePeriodically(this, this.timeskip, this.timeskip, this.unit);
                    this.w.schedule(new RemoveFromBufferEmit(collection), this.timespan, this.unit);
                } catch (Throwable e) {
                    Exceptions.throwIfFatal(e);
                    s.dispose();
                    EmptyDisposable.error(e, this.actual);
                    this.w.dispose();
                }
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
            this.done = true;
            clear();
            this.actual.onError(t);
            this.w.dispose();
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            List<U> bs;
            synchronized (this) {
                bs = new ArrayList<>(this.buffers);
                this.buffers.clear();
            }
            for (U b : bs) {
                this.queue.offer(b);
            }
            this.done = true;
            if (enter()) {
                QueueDrainHelper.drainLoop(this.queue, this.actual, false, this.w, this);
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            if (!this.cancelled) {
                this.cancelled = true;
                clear();
                this.s.dispose();
                this.w.dispose();
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.cancelled;
        }

        void clear() {
            synchronized (this) {
                this.buffers.clear();
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.lang.Runnable
        public void run() {
            if (!this.cancelled) {
                try {
                    Collection collection = (Collection) ObjectHelper.requireNonNull(this.bufferSupplier.call(), "The bufferSupplier returned a null buffer");
                    synchronized (this) {
                        if (!this.cancelled) {
                            this.buffers.add(collection);
                            this.w.schedule(new RemoveFromBuffer(collection), this.timespan, this.unit);
                        }
                    }
                } catch (Throwable e) {
                    Exceptions.throwIfFatal(e);
                    this.actual.onError(e);
                    dispose();
                }
            }
        }

        public void accept(Observer<? super U> a, U v) {
            a.onNext(v);
        }

        /* loaded from: classes3.dex */
        final class RemoveFromBuffer implements Runnable {
            private final U b;

            RemoveFromBuffer(U b) {
                this.b = b;
            }

            @Override // java.lang.Runnable
            public void run() {
                synchronized (BufferSkipBoundedObserver.this) {
                    BufferSkipBoundedObserver.this.buffers.remove(this.b);
                }
                BufferSkipBoundedObserver.this.fastPathOrderedEmit(this.b, false, BufferSkipBoundedObserver.this.w);
            }
        }

        /* loaded from: classes3.dex */
        final class RemoveFromBufferEmit implements Runnable {
            private final U buffer;

            RemoveFromBufferEmit(U buffer) {
                this.buffer = buffer;
            }

            @Override // java.lang.Runnable
            public void run() {
                synchronized (BufferSkipBoundedObserver.this) {
                    BufferSkipBoundedObserver.this.buffers.remove(this.buffer);
                }
                BufferSkipBoundedObserver.this.fastPathOrderedEmit(this.buffer, false, BufferSkipBoundedObserver.this.w);
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class BufferExactBoundedObserver<T, U extends Collection<? super T>> extends QueueDrainObserver<T, U, U> implements Runnable, Disposable {
        U buffer;
        final Callable<U> bufferSupplier;
        long consumerIndex;
        final int maxSize;
        long producerIndex;
        final boolean restartTimerOnMaxSize;
        Disposable s;
        Disposable timer;
        final long timespan;
        final TimeUnit unit;
        final Scheduler.Worker w;

        /* JADX WARN: Multi-variable type inference failed */
        @Override // io.reactivex.internal.observers.QueueDrainObserver, io.reactivex.internal.util.ObservableQueueDrain
        public /* bridge */ /* synthetic */ void accept(Observer x0, Object x1) {
            accept((Observer<? super Observer>) x0, (Observer) ((Collection) x1));
        }

        BufferExactBoundedObserver(Observer<? super U> actual, Callable<U> bufferSupplier, long timespan, TimeUnit unit, int maxSize, boolean restartOnMaxSize, Scheduler.Worker w) {
            super(actual, new MpscLinkedQueue());
            this.bufferSupplier = bufferSupplier;
            this.timespan = timespan;
            this.unit = unit;
            this.maxSize = maxSize;
            this.restartTimerOnMaxSize = restartOnMaxSize;
            this.w = w;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                try {
                    U b = (U) ObjectHelper.requireNonNull(this.bufferSupplier.call(), "The buffer supplied is null");
                    this.buffer = b;
                    this.actual.onSubscribe(this);
                    this.timer = this.w.schedulePeriodically(this, this.timespan, this.timespan, this.unit);
                } catch (Throwable e) {
                    Exceptions.throwIfFatal(e);
                    s.dispose();
                    EmptyDisposable.error(e, this.actual);
                    this.w.dispose();
                }
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            synchronized (this) {
                U b = this.buffer;
                if (b != null) {
                    b.add(t);
                    if (b.size() >= this.maxSize) {
                        if (this.restartTimerOnMaxSize) {
                            this.buffer = null;
                            this.producerIndex++;
                            this.timer.dispose();
                        }
                        fastPathOrderedEmit(b, false, this);
                        try {
                            U b2 = (U) ObjectHelper.requireNonNull(this.bufferSupplier.call(), "The buffer supplied is null");
                            if (this.restartTimerOnMaxSize) {
                                synchronized (this) {
                                    this.buffer = b2;
                                    this.consumerIndex++;
                                }
                                this.timer = this.w.schedulePeriodically(this, this.timespan, this.timespan, this.unit);
                                return;
                            }
                            synchronized (this) {
                                this.buffer = b2;
                            }
                        } catch (Throwable e) {
                            Exceptions.throwIfFatal(e);
                            this.actual.onError(e);
                            dispose();
                        }
                    }
                }
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            synchronized (this) {
                this.buffer = null;
            }
            this.actual.onError(t);
            this.w.dispose();
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            U b;
            this.w.dispose();
            synchronized (this) {
                b = this.buffer;
                this.buffer = null;
            }
            this.queue.offer(b);
            this.done = true;
            if (enter()) {
                QueueDrainHelper.drainLoop(this.queue, this.actual, false, this, this);
            }
        }

        public void accept(Observer<? super U> a, U v) {
            a.onNext(v);
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.s.dispose();
                this.w.dispose();
                synchronized (this) {
                    this.buffer = null;
                }
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.cancelled;
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                U next = (U) ObjectHelper.requireNonNull(this.bufferSupplier.call(), "The bufferSupplier returned a null buffer");
                synchronized (this) {
                    U current = this.buffer;
                    if (current != null && this.producerIndex == this.consumerIndex) {
                        this.buffer = next;
                        fastPathOrderedEmit(current, false, this);
                    }
                }
            } catch (Throwable e) {
                Exceptions.throwIfFatal(e);
                dispose();
                this.actual.onError(e);
            }
        }
    }
}
