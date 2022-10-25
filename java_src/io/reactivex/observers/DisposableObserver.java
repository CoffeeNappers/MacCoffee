package io.reactivex.observers;

import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public abstract class DisposableObserver<T> implements Observer<T>, Disposable {
    final AtomicReference<Disposable> s = new AtomicReference<>();

    @Override // io.reactivex.Observer
    public final void onSubscribe(Disposable s) {
        if (DisposableHelper.setOnce(this.s, s)) {
            onStart();
        }
    }

    protected void onStart() {
    }

    @Override // io.reactivex.disposables.Disposable
    public final boolean isDisposed() {
        return this.s.get() == DisposableHelper.DISPOSED;
    }

    @Override // io.reactivex.disposables.Disposable
    public final void dispose() {
        DisposableHelper.dispose(this.s);
    }
}
