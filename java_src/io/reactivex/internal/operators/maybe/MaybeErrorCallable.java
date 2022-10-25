package io.reactivex.internal.operators.maybe;

import io.reactivex.Maybe;
import io.reactivex.MaybeObserver;
import io.reactivex.disposables.Disposables;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.functions.ObjectHelper;
import java.util.concurrent.Callable;
/* loaded from: classes3.dex */
public final class MaybeErrorCallable<T> extends Maybe<T> {
    final Callable<? extends Throwable> errorSupplier;

    public MaybeErrorCallable(Callable<? extends Throwable> errorSupplier) {
        this.errorSupplier = errorSupplier;
    }

    @Override // io.reactivex.Maybe
    protected void subscribeActual(MaybeObserver<? super T> observer) {
        Throwable ex;
        observer.onSubscribe(Disposables.disposed());
        try {
            ex = (Throwable) ObjectHelper.requireNonNull(this.errorSupplier.call(), "Callable returned null throwable. Null values are generally not allowed in 2.x operators and sources.");
        } catch (Throwable ex1) {
            Exceptions.throwIfFatal(ex1);
            ex = ex1;
        }
        observer.onError(ex);
    }
}
