package io.reactivex.internal.operators.single;

import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.disposables.EmptyDisposable;
import java.util.concurrent.Callable;
/* loaded from: classes3.dex */
public final class SingleFromCallable<T> extends Single<T> {
    final Callable<? extends T> callable;

    public SingleFromCallable(Callable<? extends T> callable) {
        this.callable = callable;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super T> s) {
        s.onSubscribe(EmptyDisposable.INSTANCE);
        try {
            Object obj = (T) this.callable.call();
            if (obj != null) {
                s.onSuccess(obj);
            } else {
                s.onError(new NullPointerException("The callable returned a null value"));
            }
        } catch (Throwable e) {
            Exceptions.throwIfFatal(e);
            s.onError(e);
        }
    }
}
