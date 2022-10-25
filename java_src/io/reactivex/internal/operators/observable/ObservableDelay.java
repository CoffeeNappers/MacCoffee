package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.Scheduler;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.observers.SerializedObserver;
import java.util.concurrent.TimeUnit;
/* loaded from: classes3.dex */
public final class ObservableDelay<T> extends AbstractObservableWithUpstream<T, T> {
    final long delay;
    final boolean delayError;
    final Scheduler scheduler;
    final TimeUnit unit;

    public ObservableDelay(ObservableSource<T> source, long delay, TimeUnit unit, Scheduler scheduler, boolean delayError) {
        super(source);
        this.delay = delay;
        this.unit = unit;
        this.scheduler = scheduler;
        this.delayError = delayError;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> t) {
        Observer<? super T> serializedObserver;
        if (this.delayError) {
            serializedObserver = t;
        } else {
            serializedObserver = new SerializedObserver<>(t);
        }
        Scheduler.Worker w = this.scheduler.createWorker();
        this.source.subscribe(new DelayObserver(serializedObserver, this.delay, this.unit, w, this.delayError));
    }

    /* loaded from: classes3.dex */
    static final class DelayObserver<T> implements Observer<T>, Disposable {
        final Observer<? super T> actual;
        final long delay;
        final boolean delayError;
        Disposable s;
        final TimeUnit unit;
        final Scheduler.Worker w;

        DelayObserver(Observer<? super T> actual, long delay, TimeUnit unit, Scheduler.Worker w, boolean delayError) {
            this.actual = actual;
            this.delay = delay;
            this.unit = unit;
            this.w = w;
            this.delayError = delayError;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            this.w.schedule(new OnNext(t), this.delay, this.unit);
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.w.schedule(new OnError(t), this.delayError ? this.delay : 0L, this.unit);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            this.w.schedule(new OnComplete(), this.delay, this.unit);
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.s.dispose();
            this.w.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.w.isDisposed();
        }

        /* loaded from: classes3.dex */
        final class OnNext implements Runnable {
            private final T t;

            OnNext(T t) {
                this.t = t;
            }

            @Override // java.lang.Runnable
            public void run() {
                DelayObserver.this.actual.onNext((T) this.t);
            }
        }

        /* loaded from: classes3.dex */
        final class OnError implements Runnable {
            private final Throwable throwable;

            OnError(Throwable throwable) {
                this.throwable = throwable;
            }

            @Override // java.lang.Runnable
            public void run() {
                try {
                    DelayObserver.this.actual.onError(this.throwable);
                } finally {
                    DelayObserver.this.w.dispose();
                }
            }
        }

        /* loaded from: classes3.dex */
        final class OnComplete implements Runnable {
            OnComplete() {
            }

            @Override // java.lang.Runnable
            public void run() {
                try {
                    DelayObserver.this.actual.onComplete();
                } finally {
                    DelayObserver.this.w.dispose();
                }
            }
        }
    }
}
