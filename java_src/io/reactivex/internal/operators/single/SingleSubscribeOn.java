package io.reactivex.internal.operators.single;

import io.reactivex.Scheduler;
import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.SequentialDisposable;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class SingleSubscribeOn<T> extends Single<T> {
    final Scheduler scheduler;
    final SingleSource<? extends T> source;

    public SingleSubscribeOn(SingleSource<? extends T> source, Scheduler scheduler) {
        this.source = source;
        this.scheduler = scheduler;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super T> s) {
        SubscribeOnObserver<T> parent = new SubscribeOnObserver<>(s, this.source);
        s.onSubscribe(parent);
        Disposable f = this.scheduler.scheduleDirect(parent);
        parent.task.replace(f);
    }

    /* loaded from: classes3.dex */
    static final class SubscribeOnObserver<T> extends AtomicReference<Disposable> implements SingleObserver<T>, Disposable, Runnable {
        private static final long serialVersionUID = 7000911171163930287L;
        final SingleObserver<? super T> actual;
        final SingleSource<? extends T> source;
        final SequentialDisposable task = new SequentialDisposable();

        SubscribeOnObserver(SingleObserver<? super T> actual, SingleSource<? extends T> source) {
            this.actual = actual;
            this.source = source;
        }

        @Override // io.reactivex.SingleObserver
        public void onSubscribe(Disposable d) {
            DisposableHelper.setOnce(this, d);
        }

        @Override // io.reactivex.SingleObserver
        public void onSuccess(T value) {
            this.actual.onSuccess(value);
        }

        @Override // io.reactivex.SingleObserver
        public void onError(Throwable e) {
            this.actual.onError(e);
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            DisposableHelper.dispose(this);
            this.task.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return DisposableHelper.isDisposed(get());
        }

        @Override // java.lang.Runnable
        public void run() {
            this.source.subscribe(this);
        }
    }
}
