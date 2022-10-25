package io.reactivex.internal.operators.observable;

import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.internal.functions.ObjectHelper;
import java.util.concurrent.Callable;
/* loaded from: classes3.dex */
public final class ObservableDefer<T> extends Observable<T> {
    final Callable<? extends ObservableSource<? extends T>> supplier;

    public ObservableDefer(Callable<? extends ObservableSource<? extends T>> supplier) {
        this.supplier = supplier;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> s) {
        try {
            ObservableSource<? extends T> pub = (ObservableSource) ObjectHelper.requireNonNull(this.supplier.call(), "null publisher supplied");
            pub.subscribe(s);
        } catch (Throwable t) {
            Exceptions.throwIfFatal(t);
            EmptyDisposable.error(t, s);
        }
    }
}
