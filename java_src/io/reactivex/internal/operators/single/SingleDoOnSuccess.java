package io.reactivex.internal.operators.single;

import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Consumer;
/* loaded from: classes3.dex */
public final class SingleDoOnSuccess<T> extends Single<T> {
    final Consumer<? super T> onSuccess;
    final SingleSource<T> source;

    public SingleDoOnSuccess(SingleSource<T> source, Consumer<? super T> onSuccess) {
        this.source = source;
        this.onSuccess = onSuccess;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super T> s) {
        this.source.subscribe(new DoOnSuccess(s));
    }

    /* loaded from: classes3.dex */
    final class DoOnSuccess implements SingleObserver<T> {
        private final SingleObserver<? super T> s;

        DoOnSuccess(SingleObserver<? super T> s) {
            this.s = s;
        }

        @Override // io.reactivex.SingleObserver
        public void onSubscribe(Disposable d) {
            this.s.onSubscribe(d);
        }

        @Override // io.reactivex.SingleObserver
        public void onSuccess(T value) {
            try {
                SingleDoOnSuccess.this.onSuccess.accept(value);
                this.s.onSuccess(value);
            } catch (Throwable ex) {
                Exceptions.throwIfFatal(ex);
                this.s.onError(ex);
            }
        }

        @Override // io.reactivex.SingleObserver
        public void onError(Throwable e) {
            this.s.onError(e);
        }
    }
}
