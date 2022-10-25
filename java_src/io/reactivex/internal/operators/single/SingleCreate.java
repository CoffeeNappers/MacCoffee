package io.reactivex.internal.operators.single;

import io.reactivex.Single;
import io.reactivex.SingleEmitter;
import io.reactivex.SingleObserver;
import io.reactivex.SingleOnSubscribe;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Cancellable;
import io.reactivex.internal.disposables.CancellableDisposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class SingleCreate<T> extends Single<T> {
    final SingleOnSubscribe<T> source;

    public SingleCreate(SingleOnSubscribe<T> source) {
        this.source = source;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super T> s) {
        Emitter<T> parent = new Emitter<>(s);
        s.onSubscribe(parent);
        try {
            this.source.subscribe(parent);
        } catch (Throwable ex) {
            Exceptions.throwIfFatal(ex);
            parent.onError(ex);
        }
    }

    /* loaded from: classes3.dex */
    static final class Emitter<T> extends AtomicReference<Disposable> implements SingleEmitter<T>, Disposable {
        private static final long serialVersionUID = -2467358622224974244L;
        final SingleObserver<? super T> actual;

        Emitter(SingleObserver<? super T> actual) {
            this.actual = actual;
        }

        @Override // io.reactivex.SingleEmitter
        public void onSuccess(T value) {
            Disposable d;
            if (get() != DisposableHelper.DISPOSED && (d = getAndSet(DisposableHelper.DISPOSED)) != DisposableHelper.DISPOSED) {
                try {
                    if (value == null) {
                        this.actual.onError(new NullPointerException("onSuccess called with null. Null values are generally not allowed in 2.x operators and sources."));
                    } else {
                        this.actual.onSuccess(value);
                    }
                    if (d != null) {
                        d.dispose();
                    }
                } catch (Throwable th) {
                    if (d != null) {
                        d.dispose();
                    }
                    throw th;
                }
            }
        }

        @Override // io.reactivex.SingleEmitter
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

        @Override // io.reactivex.SingleEmitter
        public void setDisposable(Disposable d) {
            DisposableHelper.set(this, d);
        }

        @Override // io.reactivex.SingleEmitter
        public void setCancellable(Cancellable c) {
            setDisposable(new CancellableDisposable(c));
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            DisposableHelper.dispose(this);
        }

        @Override // io.reactivex.SingleEmitter, io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return DisposableHelper.isDisposed(get());
        }
    }
}
