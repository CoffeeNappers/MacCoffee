package io.reactivex.internal.operators.single;

import io.reactivex.Scheduler;
import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class SingleTimer extends Single<Long> {
    final long delay;
    final Scheduler scheduler;
    final TimeUnit unit;

    public SingleTimer(long delay, TimeUnit unit, Scheduler scheduler) {
        this.delay = delay;
        this.unit = unit;
        this.scheduler = scheduler;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super Long> s) {
        TimerDisposable parent = new TimerDisposable(s);
        s.onSubscribe(parent);
        parent.setFuture(this.scheduler.scheduleDirect(parent, this.delay, this.unit));
    }

    /* loaded from: classes3.dex */
    static final class TimerDisposable extends AtomicReference<Disposable> implements Disposable, Runnable {
        private static final long serialVersionUID = 8465401857522493082L;
        final SingleObserver<? super Long> actual;

        TimerDisposable(SingleObserver<? super Long> actual) {
            this.actual = actual;
        }

        @Override // java.lang.Runnable
        public void run() {
            this.actual.onSuccess(0L);
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            DisposableHelper.dispose(this);
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return DisposableHelper.isDisposed(get());
        }

        void setFuture(Disposable d) {
            DisposableHelper.replace(this, d);
        }
    }
}