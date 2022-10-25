package io.reactivex.internal.operators.single;

import io.reactivex.CompletableObserver;
import io.reactivex.CompletableSource;
import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.observers.ResumeSingleObserver;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class SingleDelayWithCompletable<T> extends Single<T> {
    final CompletableSource other;
    final SingleSource<T> source;

    public SingleDelayWithCompletable(SingleSource<T> source, CompletableSource other) {
        this.source = source;
        this.other = other;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super T> subscriber) {
        this.other.subscribe(new OtherObserver(subscriber, this.source));
    }

    /* loaded from: classes3.dex */
    static final class OtherObserver<T> extends AtomicReference<Disposable> implements CompletableObserver, Disposable {
        private static final long serialVersionUID = -8565274649390031272L;
        final SingleObserver<? super T> actual;
        final SingleSource<T> source;

        OtherObserver(SingleObserver<? super T> actual, SingleSource<T> source) {
            this.actual = actual;
            this.source = source;
        }

        @Override // io.reactivex.CompletableObserver
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.setOnce(this, d)) {
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.CompletableObserver
        public void onError(Throwable e) {
            this.actual.onError(e);
        }

        @Override // io.reactivex.CompletableObserver, io.reactivex.MaybeObserver
        public void onComplete() {
            this.source.subscribe(new ResumeSingleObserver(this, this.actual));
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
