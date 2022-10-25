package io.reactivex.internal.operators.completable;

import io.reactivex.Completable;
import io.reactivex.CompletableEmitter;
import io.reactivex.CompletableObserver;
import io.reactivex.CompletableOnSubscribe;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Cancellable;
import io.reactivex.internal.disposables.CancellableDisposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class CompletableCreate extends Completable {
    final CompletableOnSubscribe source;

    public CompletableCreate(CompletableOnSubscribe source) {
        this.source = source;
    }

    @Override // io.reactivex.Completable
    protected void subscribeActual(CompletableObserver s) {
        Emitter parent = new Emitter(s);
        s.onSubscribe(parent);
        try {
            this.source.subscribe(parent);
        } catch (Throwable ex) {
            Exceptions.throwIfFatal(ex);
            parent.onError(ex);
        }
    }

    /* loaded from: classes3.dex */
    static final class Emitter extends AtomicReference<Disposable> implements CompletableEmitter, Disposable {
        private static final long serialVersionUID = -2467358622224974244L;
        final CompletableObserver actual;

        Emitter(CompletableObserver actual) {
            this.actual = actual;
        }

        @Override // io.reactivex.CompletableEmitter
        public void onComplete() {
            Disposable d;
            if (get() != DisposableHelper.DISPOSED && (d = getAndSet(DisposableHelper.DISPOSED)) != DisposableHelper.DISPOSED) {
                try {
                    this.actual.onComplete();
                } finally {
                    if (d != null) {
                        d.dispose();
                    }
                }
            }
        }

        @Override // io.reactivex.CompletableEmitter
        public void onError(Throwable t) {
            Disposable d;
            if (t == null) {
                t = new NullPointerException("onError called with null. Null values are generally not allowed in 2.x operators and sources.");
            }
            if (get() != DisposableHelper.DISPOSED && (d = getAndSet(DisposableHelper.DISPOSED)) != DisposableHelper.DISPOSED) {
                try {
                    this.actual.onError(t);
                    if (d != null) {
                        return;
                    }
                    return;
                } finally {
                    if (d != null) {
                        d.dispose();
                    }
                }
            }
            RxJavaPlugins.onError(t);
        }

        @Override // io.reactivex.CompletableEmitter
        public void setDisposable(Disposable d) {
            DisposableHelper.set(this, d);
        }

        @Override // io.reactivex.CompletableEmitter
        public void setCancellable(Cancellable c) {
            setDisposable(new CancellableDisposable(c));
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            DisposableHelper.dispose(this);
        }

        @Override // io.reactivex.CompletableEmitter, io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return DisposableHelper.isDisposed(get());
        }
    }
}
