package io.reactivex.internal.observers;

import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Action;
import io.reactivex.functions.Consumer;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.plugins.RxJavaPlugins;
/* loaded from: classes3.dex */
public final class DisposableLambdaObserver<T> implements Observer<T>, Disposable {
    final Observer<? super T> actual;
    final Action onDispose;
    final Consumer<? super Disposable> onSubscribe;
    Disposable s;

    public DisposableLambdaObserver(Observer<? super T> actual, Consumer<? super Disposable> onSubscribe, Action onDispose) {
        this.actual = actual;
        this.onSubscribe = onSubscribe;
        this.onDispose = onDispose;
    }

    @Override // io.reactivex.Observer
    public void onSubscribe(Disposable s) {
        try {
            this.onSubscribe.accept(s);
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
            }
        } catch (Throwable e) {
            Exceptions.throwIfFatal(e);
            s.dispose();
            this.s = DisposableHelper.DISPOSED;
            EmptyDisposable.error(e, this.actual);
        }
    }

    @Override // io.reactivex.Observer
    public void onNext(T t) {
        this.actual.onNext(t);
    }

    @Override // io.reactivex.Observer
    public void onError(Throwable t) {
        if (this.s != DisposableHelper.DISPOSED) {
            this.actual.onError(t);
        } else {
            RxJavaPlugins.onError(t);
        }
    }

    @Override // io.reactivex.Observer
    public void onComplete() {
        if (this.s != DisposableHelper.DISPOSED) {
            this.actual.onComplete();
        }
    }

    @Override // io.reactivex.disposables.Disposable
    public void dispose() {
        try {
            this.onDispose.run();
        } catch (Throwable e) {
            Exceptions.throwIfFatal(e);
            RxJavaPlugins.onError(e);
        }
        this.s.dispose();
    }

    @Override // io.reactivex.disposables.Disposable
    public boolean isDisposed() {
        return this.s.isDisposed();
    }
}
