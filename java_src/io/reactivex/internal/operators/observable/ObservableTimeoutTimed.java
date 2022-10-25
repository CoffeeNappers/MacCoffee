package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.Scheduler;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.ObserverFullArbiter;
import io.reactivex.internal.observers.FullArbiterObserver;
import io.reactivex.observers.SerializedObserver;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class ObservableTimeoutTimed<T> extends AbstractObservableWithUpstream<T, T> {
    static final Disposable NEW_TIMER = new EmptyDisposable();
    final ObservableSource<? extends T> other;
    final Scheduler scheduler;
    final long timeout;
    final TimeUnit unit;

    public ObservableTimeoutTimed(ObservableSource<T> source, long timeout, TimeUnit unit, Scheduler scheduler, ObservableSource<? extends T> other) {
        super(source);
        this.timeout = timeout;
        this.unit = unit;
        this.scheduler = scheduler;
        this.other = other;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> t) {
        if (this.other == null) {
            this.source.subscribe(new TimeoutTimedObserver(new SerializedObserver(t), this.timeout, this.unit, this.scheduler.createWorker()));
        } else {
            this.source.subscribe(new TimeoutTimedOtherObserver(t, this.timeout, this.unit, this.scheduler.createWorker(), this.other));
        }
    }

    /* loaded from: classes3.dex */
    static final class TimeoutTimedOtherObserver<T> extends AtomicReference<Disposable> implements Observer<T>, Disposable {
        private static final long serialVersionUID = -4619702551964128179L;
        final Observer<? super T> actual;
        final ObserverFullArbiter<T> arbiter;
        volatile boolean done;
        volatile long index;
        final ObservableSource<? extends T> other;
        Disposable s;
        final long timeout;
        final TimeUnit unit;
        final Scheduler.Worker worker;

        TimeoutTimedOtherObserver(Observer<? super T> actual, long timeout, TimeUnit unit, Scheduler.Worker worker, ObservableSource<? extends T> other) {
            this.actual = actual;
            this.timeout = timeout;
            this.unit = unit;
            this.worker = worker;
            this.other = other;
            this.arbiter = new ObserverFullArbiter<>(actual, this, 8);
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                if (this.arbiter.setDisposable(s)) {
                    this.actual.onSubscribe(this.arbiter);
                    scheduleTimeout(0L);
                }
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            if (!this.done) {
                long idx = this.index + 1;
                this.index = idx;
                if (this.arbiter.onNext(t, this.s)) {
                    scheduleTimeout(idx);
                }
            }
        }

        void scheduleTimeout(long idx) {
            Disposable d = get();
            if (d != null) {
                d.dispose();
            }
            if (compareAndSet(d, ObservableTimeoutTimed.NEW_TIMER)) {
                DisposableHelper.replace(this, this.worker.schedule(new SubscribeNext(idx), this.timeout, this.unit));
            }
        }

        void subscribeNext() {
            this.other.subscribe(new FullArbiterObserver(this.arbiter));
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
                return;
            }
            this.done = true;
            this.arbiter.onError(t, this.s);
            this.worker.dispose();
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                this.arbiter.onComplete(this.s);
                this.worker.dispose();
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.s.dispose();
            this.worker.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.worker.isDisposed();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes3.dex */
        public final class SubscribeNext implements Runnable {
            private final long idx;

            SubscribeNext(long idx) {
                this.idx = idx;
            }

            @Override // java.lang.Runnable
            public void run() {
                if (this.idx == TimeoutTimedOtherObserver.this.index) {
                    TimeoutTimedOtherObserver.this.done = true;
                    TimeoutTimedOtherObserver.this.s.dispose();
                    DisposableHelper.dispose(TimeoutTimedOtherObserver.this);
                    TimeoutTimedOtherObserver.this.subscribeNext();
                    TimeoutTimedOtherObserver.this.worker.dispose();
                }
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class TimeoutTimedObserver<T> extends AtomicReference<Disposable> implements Observer<T>, Disposable {
        private static final long serialVersionUID = -8387234228317808253L;
        final Observer<? super T> actual;
        volatile boolean done;
        volatile long index;
        Disposable s;
        final long timeout;
        final TimeUnit unit;
        final Scheduler.Worker worker;

        TimeoutTimedObserver(Observer<? super T> actual, long timeout, TimeUnit unit, Scheduler.Worker worker) {
            this.actual = actual;
            this.timeout = timeout;
            this.unit = unit;
            this.worker = worker;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
                scheduleTimeout(0L);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            if (!this.done) {
                long idx = this.index + 1;
                this.index = idx;
                this.actual.onNext(t);
                scheduleTimeout(idx);
            }
        }

        void scheduleTimeout(long idx) {
            Disposable d = get();
            if (d != null) {
                d.dispose();
            }
            if (compareAndSet(d, ObservableTimeoutTimed.NEW_TIMER)) {
                DisposableHelper.replace(this, this.worker.schedule(new TimeoutTask(idx), this.timeout, this.unit));
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
                return;
            }
            this.done = true;
            this.actual.onError(t);
            dispose();
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                this.actual.onComplete();
                dispose();
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.s.dispose();
            this.worker.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.worker.isDisposed();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes3.dex */
        public final class TimeoutTask implements Runnable {
            private final long idx;

            TimeoutTask(long idx) {
                this.idx = idx;
            }

            @Override // java.lang.Runnable
            public void run() {
                if (this.idx == TimeoutTimedObserver.this.index) {
                    TimeoutTimedObserver.this.done = true;
                    TimeoutTimedObserver.this.s.dispose();
                    DisposableHelper.dispose(TimeoutTimedObserver.this);
                    TimeoutTimedObserver.this.actual.onError(new TimeoutException());
                    TimeoutTimedObserver.this.worker.dispose();
                }
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class EmptyDisposable implements Disposable {
        EmptyDisposable() {
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return true;
        }
    }
}
