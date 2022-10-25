package io.reactivex.internal.operators.observable;

import io.reactivex.Observable;
import io.reactivex.Observer;
import io.reactivex.Scheduler;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.EmptyDisposable;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class ObservableTimer extends Observable<Long> {
    final long delay;
    final Scheduler scheduler;
    final TimeUnit unit;

    public ObservableTimer(long delay, TimeUnit unit, Scheduler scheduler) {
        this.delay = delay;
        this.unit = unit;
        this.scheduler = scheduler;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super Long> s) {
        TimerObserver ios = new TimerObserver(s);
        s.onSubscribe(ios);
        Disposable d = this.scheduler.scheduleDirect(ios, this.delay, this.unit);
        ios.setResource(d);
    }

    /* loaded from: classes3.dex */
    static final class TimerObserver extends AtomicReference<Disposable> implements Disposable, Runnable {
        private static final long serialVersionUID = -2809475196591179431L;
        final Observer<? super Long> actual;

        TimerObserver(Observer<? super Long> actual) {
            this.actual = actual;
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
                this.actual.onNext(0L);
                lazySet(EmptyDisposable.INSTANCE);
                this.actual.onComplete();
            }
        }

        public void setResource(Disposable d) {
            DisposableHelper.trySet(this, d);
        }
    }
}
