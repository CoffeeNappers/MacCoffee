package io.reactivex.observers;

import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
/* loaded from: classes3.dex */
public abstract class DefaultObserver<T> implements Observer<T> {
    private Disposable s;

    @Override // io.reactivex.Observer
    public final void onSubscribe(Disposable s) {
        if (DisposableHelper.validate(this.s, s)) {
            this.s = s;
            onStart();
        }
    }

    protected final void cancel() {
        Disposable s = this.s;
        this.s = DisposableHelper.DISPOSED;
        s.dispose();
    }

    protected void onStart() {
    }
}
