package io.reactivex.internal.operators.observable;

import io.reactivex.Observable;
import io.reactivex.Observer;
import io.reactivex.Scheduler;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class ObservableIntervalRange extends Observable<Long> {
    final long end;
    final long initialDelay;
    final long period;
    final Scheduler scheduler;
    final long start;
    final TimeUnit unit;

    public ObservableIntervalRange(long start, long end, long initialDelay, long period, TimeUnit unit, Scheduler scheduler) {
        this.initialDelay = initialDelay;
        this.period = period;
        this.unit = unit;
        this.scheduler = scheduler;
        this.start = start;
        this.end = end;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super Long> s) {
        IntervalRangeObserver is = new IntervalRangeObserver(s, this.start, this.end);
        s.onSubscribe(is);
        Disposable d = this.scheduler.schedulePeriodicallyDirect(is, this.initialDelay, this.period, this.unit);
        is.setResource(d);
    }

    /* loaded from: classes3.dex */
    static final class IntervalRangeObserver extends AtomicReference<Disposable> implements Disposable, Runnable {
        private static final long serialVersionUID = 1891866368734007884L;
        final Observer<? super Long> actual;
        long count;
        final long end;

        IntervalRangeObserver(Observer<? super Long> actual, long start, long end) {
            this.actual = actual;
            this.count = start;
            this.end = end;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            DisposableHelper.dispose(this);
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return get() == DisposableHelper.DISPOSED;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (!isDisposed()) {
                long c = this.count;
                this.actual.onNext(Long.valueOf(c));
                if (c == this.end) {
                    DisposableHelper.dispose(this);
                    this.actual.onComplete();
                    return;
                }
                this.count = 1 + c;
            }
        }

        public void setResource(Disposable d) {
            DisposableHelper.setOnce(this, d);
        }
    }
}
