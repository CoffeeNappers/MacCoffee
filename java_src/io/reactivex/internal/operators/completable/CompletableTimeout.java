package io.reactivex.internal.operators.completable;

import io.reactivex.Completable;
import io.reactivex.CompletableObserver;
import io.reactivex.CompletableSource;
import io.reactivex.Scheduler;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes3.dex */
public final class CompletableTimeout extends Completable {
    final CompletableSource other;
    final Scheduler scheduler;
    final CompletableSource source;
    final long timeout;
    final TimeUnit unit;

    public CompletableTimeout(CompletableSource source, long timeout, TimeUnit unit, Scheduler scheduler, CompletableSource other) {
        this.source = source;
        this.timeout = timeout;
        this.unit = unit;
        this.scheduler = scheduler;
        this.other = other;
    }

    @Override // io.reactivex.Completable
    public void subscribeActual(CompletableObserver s) {
        CompositeDisposable set = new CompositeDisposable();
        s.onSubscribe(set);
        AtomicBoolean once = new AtomicBoolean();
        Disposable timer = this.scheduler.scheduleDirect(new DisposeTask(once, set, s), this.timeout, this.unit);
        set.add(timer);
        this.source.subscribe(new TimeOutObserver(set, once, s));
    }

    /* loaded from: classes3.dex */
    static final class TimeOutObserver implements CompletableObserver {
        private final AtomicBoolean once;
        private final CompletableObserver s;
        private final CompositeDisposable set;

        TimeOutObserver(CompositeDisposable set, AtomicBoolean once, CompletableObserver s) {
            this.set = set;
            this.once = once;
            this.s = s;
        }

        @Override // io.reactivex.CompletableObserver
        public void onSubscribe(Disposable d) {
            this.set.add(d);
        }

        @Override // io.reactivex.CompletableObserver
        public void onError(Throwable e) {
            if (this.once.compareAndSet(false, true)) {
                this.set.dispose();
                this.s.onError(e);
                return;
            }
            RxJavaPlugins.onError(e);
        }

        @Override // io.reactivex.CompletableObserver, io.reactivex.MaybeObserver
        public void onComplete() {
            if (this.once.compareAndSet(false, true)) {
                this.set.dispose();
                this.s.onComplete();
            }
        }
    }

    /* loaded from: classes3.dex */
    final class DisposeTask implements Runnable {
        private final AtomicBoolean once;
        final CompletableObserver s;
        final CompositeDisposable set;

        DisposeTask(AtomicBoolean once, CompositeDisposable set, CompletableObserver s) {
            this.once = once;
            this.set = set;
            this.s = s;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.once.compareAndSet(false, true)) {
                this.set.clear();
                if (CompletableTimeout.this.other == null) {
                    this.s.onError(new TimeoutException());
                } else {
                    CompletableTimeout.this.other.subscribe(new DisposeObserver());
                }
            }
        }

        /* loaded from: classes3.dex */
        final class DisposeObserver implements CompletableObserver {
            DisposeObserver() {
            }

            @Override // io.reactivex.CompletableObserver
            public void onSubscribe(Disposable d) {
                DisposeTask.this.set.add(d);
            }

            @Override // io.reactivex.CompletableObserver
            public void onError(Throwable e) {
                DisposeTask.this.set.dispose();
                DisposeTask.this.s.onError(e);
            }

            @Override // io.reactivex.CompletableObserver, io.reactivex.MaybeObserver
            public void onComplete() {
                DisposeTask.this.set.dispose();
                DisposeTask.this.s.onComplete();
            }
        }
    }
}
