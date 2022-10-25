package io.reactivex.internal.operators.single;

import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.CompositeException;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.BiConsumer;
/* loaded from: classes3.dex */
public final class SingleDoOnEvent<T> extends Single<T> {
    final BiConsumer<? super T, ? super Throwable> onEvent;
    final SingleSource<T> source;

    public SingleDoOnEvent(SingleSource<T> source, BiConsumer<? super T, ? super Throwable> onEvent) {
        this.source = source;
        this.onEvent = onEvent;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super T> s) {
        this.source.subscribe(new DoOnEvent(s));
    }

    /* loaded from: classes3.dex */
    final class DoOnEvent implements SingleObserver<T> {
        private final SingleObserver<? super T> s;

        DoOnEvent(SingleObserver<? super T> s) {
            this.s = s;
        }

        @Override // io.reactivex.SingleObserver
        public void onSubscribe(Disposable d) {
            this.s.onSubscribe(d);
        }

        @Override // io.reactivex.SingleObserver
        public void onSuccess(T value) {
            try {
                SingleDoOnEvent.this.onEvent.accept(value, null);
                this.s.onSuccess(value);
            } catch (Throwable ex) {
                Exceptions.throwIfFatal(ex);
                this.s.onError(ex);
            }
        }

        @Override // io.reactivex.SingleObserver
        public void onError(Throwable e) {
            try {
                SingleDoOnEvent.this.onEvent.accept(null, e);
            } catch (Throwable ex) {
                Exceptions.throwIfFatal(ex);
                e = new CompositeException(e, ex);
            }
            this.s.onError(e);
        }
    }
}
