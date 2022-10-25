package io.reactivex.internal.operators.single;

import io.reactivex.Scheduler;
import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.SequentialDisposable;
import java.util.concurrent.TimeUnit;
/* loaded from: classes3.dex */
public final class SingleDelay<T> extends Single<T> {
    final Scheduler scheduler;
    final SingleSource<? extends T> source;
    final long time;
    final TimeUnit unit;

    public SingleDelay(SingleSource<? extends T> source, long time, TimeUnit unit, Scheduler scheduler) {
        this.source = source;
        this.time = time;
        this.unit = unit;
        this.scheduler = scheduler;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super T> s) {
        SequentialDisposable sd = new SequentialDisposable();
        s.onSubscribe(sd);
        this.source.subscribe(new Delay(sd, s));
    }

    /* loaded from: classes3.dex */
    final class Delay implements SingleObserver<T> {
        final SingleObserver<? super T> s;
        private final SequentialDisposable sd;

        Delay(SequentialDisposable sd, SingleObserver<? super T> s) {
            this.sd = sd;
            this.s = s;
        }

        @Override // io.reactivex.SingleObserver
        public void onSubscribe(Disposable d) {
            this.sd.replace(d);
        }

        @Override // io.reactivex.SingleObserver
        public void onSuccess(T value) {
            this.sd.replace(SingleDelay.this.scheduler.scheduleDirect(new OnSuccess(value), SingleDelay.this.time, SingleDelay.this.unit));
        }

        @Override // io.reactivex.SingleObserver
        public void onError(Throwable e) {
            this.sd.replace(SingleDelay.this.scheduler.scheduleDirect(new OnError(e), 0L, SingleDelay.this.unit));
        }

        /* loaded from: classes3.dex */
        final class OnSuccess implements Runnable {
            private final T value;

            OnSuccess(T value) {
                this.value = value;
            }

            @Override // java.lang.Runnable
            public void run() {
                Delay.this.s.onSuccess((T) this.value);
            }
        }

        /* loaded from: classes3.dex */
        final class OnError implements Runnable {
            private final Throwable e;

            OnError(Throwable e) {
                this.e = e;
            }

            @Override // java.lang.Runnable
            public void run() {
                Delay.this.s.onError(this.e);
            }
        }
    }
}
