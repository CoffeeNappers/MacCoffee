package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.Scheduler;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.observers.SerializedObserver;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class ObservableSampleTimed<T> extends AbstractObservableWithUpstream<T, T> {
    final boolean emitLast;
    final long period;
    final Scheduler scheduler;
    final TimeUnit unit;

    public ObservableSampleTimed(ObservableSource<T> source, long period, TimeUnit unit, Scheduler scheduler, boolean emitLast) {
        super(source);
        this.period = period;
        this.unit = unit;
        this.scheduler = scheduler;
        this.emitLast = emitLast;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> t) {
        SerializedObserver<T> serial = new SerializedObserver<>(t);
        if (this.emitLast) {
            this.source.subscribe(new SampleTimedEmitLast(serial, this.period, this.unit, this.scheduler));
        } else {
            this.source.subscribe(new SampleTimedNoLast(serial, this.period, this.unit, this.scheduler));
        }
    }

    /* loaded from: classes3.dex */
    static abstract class SampleTimedObserver<T> extends AtomicReference<T> implements Observer<T>, Disposable, Runnable {
        private static final long serialVersionUID = -3517602651313910099L;
        final Observer<? super T> actual;
        final long period;
        Disposable s;
        final Scheduler scheduler;
        final AtomicReference<Disposable> timer = new AtomicReference<>();
        final TimeUnit unit;

        abstract void complete();

        SampleTimedObserver(Observer<? super T> actual, long period, TimeUnit unit, Scheduler scheduler) {
            this.actual = actual;
            this.period = period;
            this.unit = unit;
            this.scheduler = scheduler;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
                Disposable d = this.scheduler.schedulePeriodicallyDirect(this, this.period, this.period, this.unit);
                DisposableHelper.replace(this.timer, d);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            lazySet(t);
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            cancelTimer();
            this.actual.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            cancelTimer();
            complete();
        }

        void cancelTimer() {
            DisposableHelper.dispose(this.timer);
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            cancelTimer();
            this.s.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.s.isDisposed();
        }

        void emit() {
            T value = getAndSet(null);
            if (value != null) {
                this.actual.onNext(value);
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class SampleTimedNoLast<T> extends SampleTimedObserver<T> {
        private static final long serialVersionUID = -7139995637533111443L;

        SampleTimedNoLast(Observer<? super T> actual, long period, TimeUnit unit, Scheduler scheduler) {
            super(actual, period, unit, scheduler);
        }

        @Override // io.reactivex.internal.operators.observable.ObservableSampleTimed.SampleTimedObserver
        void complete() {
            this.actual.onComplete();
        }

        @Override // java.lang.Runnable
        public void run() {
            emit();
        }
    }

    /* loaded from: classes3.dex */
    static final class SampleTimedEmitLast<T> extends SampleTimedObserver<T> {
        private static final long serialVersionUID = -7139995637533111443L;
        final AtomicInteger wip;

        SampleTimedEmitLast(Observer<? super T> actual, long period, TimeUnit unit, Scheduler scheduler) {
            super(actual, period, unit, scheduler);
            this.wip = new AtomicInteger(1);
        }

        @Override // io.reactivex.internal.operators.observable.ObservableSampleTimed.SampleTimedObserver
        void complete() {
            emit();
            if (this.wip.decrementAndGet() == 0) {
                this.actual.onComplete();
            }
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.wip.incrementAndGet() == 2) {
                emit();
                if (this.wip.decrementAndGet() == 0) {
                    this.actual.onComplete();
                }
            }
        }
    }
}
