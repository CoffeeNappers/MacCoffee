package io.reactivex.internal.operators.completable;

import io.reactivex.Completable;
import io.reactivex.CompletableObserver;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.disposables.Disposable;
/* loaded from: classes3.dex */
public final class CompletableFromSingle<T> extends Completable {
    final SingleSource<T> single;

    public CompletableFromSingle(SingleSource<T> single) {
        this.single = single;
    }

    @Override // io.reactivex.Completable
    protected void subscribeActual(CompletableObserver s) {
        this.single.subscribe(new CompletableFromSingleObserver(s));
    }

    /* loaded from: classes3.dex */
    static final class CompletableFromSingleObserver<T> implements SingleObserver<T> {
        final CompletableObserver co;

        CompletableFromSingleObserver(CompletableObserver co) {
            this.co = co;
        }

        @Override // io.reactivex.SingleObserver
        public void onError(Throwable e) {
            this.co.onError(e);
        }

        @Override // io.reactivex.SingleObserver
        public void onSubscribe(Disposable d) {
            this.co.onSubscribe(d);
        }

        @Override // io.reactivex.SingleObserver
        public void onSuccess(T value) {
            this.co.onComplete();
        }
    }
}
