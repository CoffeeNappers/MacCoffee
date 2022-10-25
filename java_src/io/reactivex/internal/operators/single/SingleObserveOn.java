package io.reactivex.internal.operators.single;

import io.reactivex.Scheduler;
import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class SingleObserveOn<T> extends Single<T> {
    final Scheduler scheduler;
    final SingleSource<T> source;

    public SingleObserveOn(SingleSource<T> source, Scheduler scheduler) {
        this.source = source;
        this.scheduler = scheduler;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super T> s) {
        this.source.subscribe(new ObserveOnSingleObserver(s, this.scheduler));
    }

    /* loaded from: classes3.dex */
    static final class ObserveOnSingleObserver<T> extends AtomicReference<Disposable> implements SingleObserver<T>, Disposable, Runnable {
        private static final long serialVersionUID = 3528003840217436037L;
        final SingleObserver<? super T> actual;
        Throwable error;
        final Scheduler scheduler;
        T value;

        ObserveOnSingleObserver(SingleObserver<? super T> actual, Scheduler scheduler) {
            this.actual = actual;
            this.scheduler = scheduler;
        }

        @Override // io.reactivex.SingleObserver
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.setOnce(this, d)) {
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.SingleObserver
        public void onSuccess(T value) {
            this.value = value;
            Disposable d = this.scheduler.scheduleDirect(this);
            DisposableHelper.replace(this, d);
        }

        @Override // io.reactivex.SingleObserver
        public void onError(Throwable e) {
            this.error = e;
            Disposable d = this.scheduler.scheduleDirect(this);
            DisposableHelper.replace(this, d);
        }

        @Override // java.lang.Runnable
        public void run() {
            Throwable ex = this.error;
            if (ex != null) {
                this.actual.onError(ex);
            } else {
                this.actual.onSuccess((T) this.value);
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            DisposableHelper.dispose(this);
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return DisposableHelper.isDisposed(get());
        }
    }
}
