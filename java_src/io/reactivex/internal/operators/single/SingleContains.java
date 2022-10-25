package io.reactivex.internal.operators.single;

import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.BiPredicate;
/* loaded from: classes3.dex */
public final class SingleContains<T> extends io.reactivex.Single<Boolean> {
    final BiPredicate<Object, Object> comparer;
    final SingleSource<T> source;
    final Object value;

    public SingleContains(SingleSource<T> source, Object value, BiPredicate<Object, Object> comparer) {
        this.source = source;
        this.value = value;
        this.comparer = comparer;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super Boolean> s) {
        this.source.subscribe(new Single(s));
    }

    /* loaded from: classes3.dex */
    final class Single implements SingleObserver<T> {
        private final SingleObserver<? super Boolean> s;

        Single(SingleObserver<? super Boolean> s) {
            this.s = s;
        }

        @Override // io.reactivex.SingleObserver
        public void onSubscribe(Disposable d) {
            this.s.onSubscribe(d);
        }

        @Override // io.reactivex.SingleObserver
        public void onSuccess(T v) {
            try {
                boolean b = SingleContains.this.comparer.test(v, SingleContains.this.value);
                this.s.onSuccess(Boolean.valueOf(b));
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
