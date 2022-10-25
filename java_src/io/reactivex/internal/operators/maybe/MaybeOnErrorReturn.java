package io.reactivex.internal.operators.maybe;

import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.CompositeException;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
/* loaded from: classes3.dex */
public final class MaybeOnErrorReturn<T> extends AbstractMaybeWithUpstream<T, T> {
    final Function<? super Throwable, ? extends T> valueSupplier;

    public MaybeOnErrorReturn(MaybeSource<T> source, Function<? super Throwable, ? extends T> valueSupplier) {
        super(source);
        this.valueSupplier = valueSupplier;
    }

    @Override // io.reactivex.Maybe
    protected void subscribeActual(MaybeObserver<? super T> observer) {
        this.source.subscribe(new OnErrorReturnMaybeObserver(observer, this.valueSupplier));
    }

    /* loaded from: classes3.dex */
    static final class OnErrorReturnMaybeObserver<T> implements MaybeObserver<T>, Disposable {
        final MaybeObserver<? super T> actual;
        Disposable d;
        final Function<? super Throwable, ? extends T> valueSupplier;

        OnErrorReturnMaybeObserver(MaybeObserver<? super T> actual, Function<? super Throwable, ? extends T> valueSupplier) {
            this.actual = actual;
            this.valueSupplier = valueSupplier;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.d.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.d.isDisposed();
        }

        @Override // io.reactivex.MaybeObserver
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.validate(this.d, d)) {
                this.d = d;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.MaybeObserver
        public void onSuccess(T value) {
            this.actual.onSuccess(value);
        }

        @Override // io.reactivex.MaybeObserver
        public void onError(Throwable e) {
            try {
                this.actual.onSuccess(ObjectHelper.requireNonNull(this.valueSupplier.mo1190apply(e), "The valueSupplier returned a null value"));
            } catch (Throwable ex) {
                Exceptions.throwIfFatal(ex);
                this.actual.onError(new CompositeException(e, ex));
            }
        }

        @Override // io.reactivex.MaybeObserver
        public void onComplete() {
            this.actual.onComplete();
        }
    }
}
