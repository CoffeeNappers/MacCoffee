package io.reactivex.internal.observers;

import io.reactivex.SingleObserver;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class ResumeSingleObserver<T> implements SingleObserver<T> {
    final SingleObserver<? super T> actual;
    final AtomicReference<Disposable> parent;

    public ResumeSingleObserver(AtomicReference<Disposable> parent, SingleObserver<? super T> actual) {
        this.parent = parent;
        this.actual = actual;
    }

    @Override // io.reactivex.SingleObserver
    public void onSubscribe(Disposable d) {
        DisposableHelper.replace(this.parent, d);
    }

    @Override // io.reactivex.SingleObserver
    public void onSuccess(T value) {
        this.actual.onSuccess(value);
    }

    @Override // io.reactivex.SingleObserver
    public void onError(Throwable e) {
        this.actual.onError(e);
    }
}
