package io.reactivex.internal.operators.maybe;

import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
/* loaded from: classes3.dex */
public final class MaybeIsEmpty<T> extends AbstractMaybeWithUpstream<T, Boolean> {
    public MaybeIsEmpty(MaybeSource<T> source) {
        super(source);
    }

    @Override // io.reactivex.Maybe
    protected void subscribeActual(MaybeObserver<? super Boolean> observer) {
        this.source.subscribe(new IsEmptyMaybeObserver(observer));
    }

    /* loaded from: classes3.dex */
    static final class IsEmptyMaybeObserver<T> implements MaybeObserver<T>, Disposable {
        final MaybeObserver<? super Boolean> actual;
        Disposable d;

        IsEmptyMaybeObserver(MaybeObserver<? super Boolean> actual) {
            this.actual = actual;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.d.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.d.isDisposed();
        }

        @Override // io.reactivex.MaybeObserver
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.validate(this.d, d)) {
                this.d = d;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.MaybeObserver
        public void onSuccess(T value) {
            this.actual.onSuccess(false);
        }

        @Override // io.reactivex.MaybeObserver
        public void onError(Throwable e) {
            this.actual.onError(e);
        }

        @Override // io.reactivex.MaybeObserver
        public void onComplete() {
            this.actual.onSuccess(true);
        }
    }
}
