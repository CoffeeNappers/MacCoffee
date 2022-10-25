package io.reactivex.internal.operators.single;

import io.reactivex.Scheduler;
import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes3.dex */
public final class SingleTimeout<T> extends Single<T> {
    final SingleSource<? extends T> other;
    final Scheduler scheduler;
    final SingleSource<T> source;
    final long timeout;
    final TimeUnit unit;

    public SingleTimeout(SingleSource<T> source, long timeout, TimeUnit unit, Scheduler scheduler, SingleSource<? extends T> other) {
        this.source = source;
        this.timeout = timeout;
        this.unit = unit;
        this.scheduler = scheduler;
        this.other = other;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super T> s) {
        CompositeDisposable set = new CompositeDisposable();
        s.onSubscribe(set);
        AtomicBoolean once = new AtomicBoolean();
        Disposable timer = this.scheduler.scheduleDirect(new TimeoutDispose(once, set, s), this.timeout, this.unit);
        set.add(timer);
        this.source.subscribe(new TimeoutObserver(once, set, s));
    }

    /* loaded from: classes3.dex */
    final class TimeoutDispose implements Runnable {
        private final AtomicBoolean once;
        final SingleObserver<? super T> s;
        final CompositeDisposable set;

        TimeoutDispose(AtomicBoolean once, CompositeDisposable set, SingleObserver<? super T> s) {
            this.once = once;
            this.set = set;
            this.s = s;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.once.compareAndSet(false, true)) {
                if (SingleTimeout.this.other != null) {
                    this.set.clear();
                    SingleTimeout.this.other.subscribe(new TimeoutObserver());
                    return;
                }
                this.set.dispose();
                this.s.onError(new TimeoutException());
            }
        }

        /* loaded from: classes3.dex */
        final class TimeoutObserver implements SingleObserver<T> {
            TimeoutObserver() {
            }

            @Override // io.reactivex.SingleObserver
            public void onError(Throwable e) {
                TimeoutDispose.this.set.dispose();
                TimeoutDispose.this.s.onError(e);
            }

            @Override // io.reactivex.SingleObserver
            public void onSubscribe(Disposable d) {
                TimeoutDispose.this.set.add(d);
            }

            @Override // io.reactivex.SingleObserver
            public void onSuccess(T value) {
                TimeoutDispose.this.set.dispose();
                TimeoutDispose.this.s.onSuccess(value);
            }
        }
    }

    /* loaded from: classes3.dex */
    final class TimeoutObserver implements SingleObserver<T> {
        private final AtomicBoolean once;
        private final SingleObserver<? super T> s;
        private final CompositeDisposable set;

        TimeoutObserver(AtomicBoolean once, CompositeDisposable set, SingleObserver<? super T> s) {
            this.once = once;
            this.set = set;
            this.s = s;
        }

        @Override // io.reactivex.SingleObserver
        public void onError(Throwable e) {
            if (this.once.compareAndSet(false, true)) {
                this.set.dispose();
                this.s.onError(e);
            }
        }

        @Override // io.reactivex.SingleObserver
        public void onSubscribe(Disposable d) {
            this.set.add(d);
        }

        @Override // io.reactivex.SingleObserver
        public void onSuccess(T value) {
            if (this.once.compareAndSet(false, true)) {
                this.set.dispose();
                this.s.onSuccess(value);
            }
        }
    }
}
