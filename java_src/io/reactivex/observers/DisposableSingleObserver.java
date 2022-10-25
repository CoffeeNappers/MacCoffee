package io.reactivex.observers;

import io.reactivex.SingleObserver;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public abstract class DisposableSingleObserver<T> implements SingleObserver<T>, Disposable {
    final AtomicReference<Disposable> s = new AtomicReference<>();

    @Override // io.reactivex.SingleObserver
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
