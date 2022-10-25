package io.reactivex.internal.operators.maybe;

import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.annotations.Experimental;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Consumer;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.plugins.RxJavaPlugins;
@Experimental
/* loaded from: classes3.dex */
public final class MaybeDoAfterSuccess<T> extends AbstractMaybeWithUpstream<T, T> {
    final Consumer<? super T> onAfterSuccess;

    public MaybeDoAfterSuccess(MaybeSource<T> source, Consumer<? super T> onAfterSuccess) {
        super(source);
        this.onAfterSuccess = onAfterSuccess;
    }

    @Override // io.reactivex.Maybe
    protected void subscribeActual(MaybeObserver<? super T> s) {
        this.source.subscribe(new DoAfterObserver(s, this.onAfterSuccess));
    }

    /* loaded from: classes3.dex */
    static final class DoAfterObserver<T> implements MaybeObserver<T>, Disposable {
        final MaybeObserver<? super T> actual;
        Disposable d;
        final Consumer<? super T> onAfterSuccess;

        DoAfterObserver(MaybeObserver<? super T> actual, Consumer<? super T> onAfterSuccess) {
            this.actual = actual;
            this.onAfterSuccess = onAfterSuccess;
        }

        @Override // io.reactivex.MaybeObserver
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.validate(this.d, d)) {
                this.d = d;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.MaybeObserver
        public void onSuccess(T t) {
            this.actual.onSuccess(t);
            try {
                this.onAfterSuccess.accept(t);
            } catch (Throwable ex) {
                Exceptions.throwIfFatal(ex);
                RxJavaPlugins.onError(ex);
            }
        }

        @Override // io.reactivex.MaybeObserver
        public void onError(Throwable e) {
            this.actual.onError(e);
        }

        @Override // io.reactivex.MaybeObserver
        public void onComplete() {
            this.actual.onComplete();
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.d.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.d.isDisposed();
        }
    }
}
