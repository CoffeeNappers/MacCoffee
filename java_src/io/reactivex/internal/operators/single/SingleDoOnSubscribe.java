package io.reactivex.internal.operators.single;

import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Consumer;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.plugins.RxJavaPlugins;
/* loaded from: classes3.dex */
public final class SingleDoOnSubscribe<T> extends Single<T> {
    final Consumer<? super Disposable> onSubscribe;
    final SingleSource<T> source;

    public SingleDoOnSubscribe(SingleSource<T> source, Consumer<? super Disposable> onSubscribe) {
        this.source = source;
        this.onSubscribe = onSubscribe;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super T> s) {
        this.source.subscribe(new DoOnSubscribeSingleObserver(s, this.onSubscribe));
    }

    /* loaded from: classes3.dex */
    static final class DoOnSubscribeSingleObserver<T> implements SingleObserver<T> {
        final SingleObserver<? super T> actual;
        boolean done;
        final Consumer<? super Disposable> onSubscribe;

        DoOnSubscribeSingleObserver(SingleObserver<? super T> actual, Consumer<? super Disposable> onSubscribe) {
            this.actual = actual;
            this.onSubscribe = onSubscribe;
        }

        @Override // io.reactivex.SingleObserver
        public void onSubscribe(Disposable d) {
            try {
                this.onSubscribe.accept(d);
                this.actual.onSubscribe(d);
            } catch (Throwable ex) {
                Exceptions.throwIfFatal(ex);
                this.done = true;
                d.dispose();
                EmptyDisposable.error(ex, this.actual);
            }
        }

        @Override // io.reactivex.SingleObserver
        public void onSuccess(T value) {
            if (!this.done) {
                this.actual.onSuccess(value);
            }
        }

        @Override // io.reactivex.SingleObserver
        public void onError(Throwable e) {
            if (this.done) {
                RxJavaPlugins.onError(e);
            } else {
                this.actual.onError(e);
            }
        }
    }
}
