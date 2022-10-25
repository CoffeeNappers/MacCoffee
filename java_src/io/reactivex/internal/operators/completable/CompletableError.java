package io.reactivex.internal.operators.completable;

import io.reactivex.Completable;
import io.reactivex.CompletableObserver;
import io.reactivex.internal.disposables.EmptyDisposable;
/* loaded from: classes3.dex */
public final class CompletableError extends Completable {
    final Throwable error;

    public CompletableError(Throwable error) {
        this.error = error;
    }

    @Override // io.reactivex.Completable
    protected void subscribeActual(CompletableObserver s) {
        EmptyDisposable.error(this.error, s);
    }
}
