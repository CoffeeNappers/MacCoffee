package io.reactivex.internal.operators.completable;

import io.reactivex.Completable;
import io.reactivex.CompletableObserver;
import io.reactivex.CompletableSource;
import io.reactivex.Scheduler;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import java.util.concurrent.TimeUnit;
/* loaded from: classes3.dex */
public final class CompletableDelay extends Completable {
    final long delay;
    final boolean delayError;
    final Scheduler scheduler;
    final CompletableSource source;
    final TimeUnit unit;

    public CompletableDelay(CompletableSource source, long delay, TimeUnit unit, Scheduler scheduler, boolean delayError) {
        this.source = source;
        this.delay = delay;
        this.unit = unit;
        this.scheduler = scheduler;
        this.delayError = delayError;
    }

    @Override // io.reactivex.Completable
    protected void subscribeActual(CompletableObserver s) {
        CompositeDisposable set = new CompositeDisposable();
        this.source.subscribe(new Delay(set, s));
    }

    /* loaded from: classes3.dex */
    final class Delay implements CompletableObserver {
        final CompletableObserver s;
        private final CompositeDisposable set;

        Delay(CompositeDisposable set, CompletableObserver s) {
            this.set = set;
            this.s = s;
        }

        @Override // io.reactivex.CompletableObserver, io.reactivex.MaybeObserver
        public void onComplete() {
            this.set.add(CompletableDelay.this.scheduler.scheduleDirect(new OnComplete(), CompletableDelay.this.delay, CompletableDelay.this.unit));
        }

        @Override // io.reactivex.CompletableObserver
        public void onError(Throwable e) {
            this.set.add(CompletableDelay.this.scheduler.scheduleDirect(new OnError(e), CompletableDelay.this.delayError ? CompletableDelay.this.delay : 0L, CompletableDelay.this.unit));
        }

        @Override // io.reactivex.CompletableObserver
        public void onSubscribe(Disposable d) {
            this.set.add(d);
            this.s.onSubscribe(this.set);
        }

        /* loaded from: classes3.dex */
        final class OnComplete implements Runnable {
            OnComplete() {
            }

            @Override // java.lang.Runnable
            public void run() {
                Delay.this.s.onComplete();
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
