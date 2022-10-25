package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.Scheduler;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.schedulers.Timed;
import java.util.concurrent.TimeUnit;
/* loaded from: classes3.dex */
public final class ObservableTimeInterval<T> extends AbstractObservableWithUpstream<T, Timed<T>> {
    final Scheduler scheduler;
    final TimeUnit unit;

    public ObservableTimeInterval(ObservableSource<T> source, TimeUnit unit, Scheduler scheduler) {
        super(source);
        this.scheduler = scheduler;
        this.unit = unit;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super Timed<T>> t) {
        this.source.subscribe(new TimeIntervalObserver(t, this.unit, this.scheduler));
    }

    /* loaded from: classes3.dex */
    static final class TimeIntervalObserver<T> implements Observer<T>, Disposable {
        final Observer<? super Timed<T>> actual;
        long lastTime;
        Disposable s;
        final Scheduler scheduler;
        final TimeUnit unit;

        TimeIntervalObserver(Observer<? super Timed<T>> actual, TimeUnit unit, Scheduler scheduler) {
            this.actual = actual;
            this.scheduler = scheduler;
            this.unit = unit;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                this.lastTime = this.scheduler.now(this.unit);
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.s.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.s.isDisposed();
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            long now = this.scheduler.now(this.unit);
            long last = this.lastTime;
            this.lastTime = now;
            long delta = now - last;
            this.actual.onNext(new Timed(t, delta, this.unit));
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.actual.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            this.actual.onComplete();
        }
    }
}
