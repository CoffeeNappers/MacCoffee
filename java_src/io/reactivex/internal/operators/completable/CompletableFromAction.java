package io.reactivex.internal.operators.completable;

import io.reactivex.Completable;
import io.reactivex.CompletableObserver;
import io.reactivex.disposables.Disposable;
import io.reactivex.disposables.Disposables;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Action;
/* loaded from: classes3.dex */
public final class CompletableFromAction extends Completable {
    final Action run;

    public CompletableFromAction(Action run) {
        this.run = run;
    }

    @Override // io.reactivex.Completable
    protected void subscribeActual(CompletableObserver s) {
        Disposable d = Disposables.empty();
        s.onSubscribe(d);
        try {
            this.run.run();
            if (!d.isDisposed()) {
                s.onComplete();
            }
        } catch (Throwable e) {
            Exceptions.throwIfFatal(e);
            if (!d.isDisposed()) {
                s.onError(e);
            }
        }
    }
}
