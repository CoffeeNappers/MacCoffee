package io.reactivex.internal.operators.single;

import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.CompositeException;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Consumer;
/* loaded from: classes3.dex */
public final class SingleDoOnError<T> extends Single<T> {
    final Consumer<? super Throwable> onError;
    final SingleSource<T> source;

    public SingleDoOnError(SingleSource<T> source, Consumer<? super Throwable> onError) {
        this.source = source;
        this.onError = onError;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super T> s) {
        this.source.subscribe(new DoOnError(s));
    }

    /* loaded from: classes3.dex */
    final class DoOnError implements SingleObserver<T> {
        private final SingleObserver<? super T> s;

        DoOnError(SingleObserver<? super T> s) {
            this.s = s;
        }

        @Override // io.reactivex.SingleObserver
        public void onSubscribe(Disposable d) {
            this.s.onSubscribe(d);
        }

        @Override // io.reactivex.SingleObserver
        public void onSuccess(T value) {
            this.s.onSuccess(value);
        }

        @Override // io.reactivex.SingleObserver
        public void onError(Throwable e) {
            try {
                SingleDoOnError.this.onError.accept(e);
            } catch (Throwable ex) {
                Exceptions.throwIfFatal(ex);
                e = new CompositeException(e, ex);
            }
            this.s.onError(e);
        }
    }
}
