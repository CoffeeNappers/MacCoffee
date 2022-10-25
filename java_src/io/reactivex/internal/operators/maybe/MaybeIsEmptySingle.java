package io.reactivex.internal.operators.maybe;

import io.reactivex.Maybe;
import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.fuseable.FuseToMaybe;
import io.reactivex.internal.fuseable.HasUpstreamMaybeSource;
import io.reactivex.plugins.RxJavaPlugins;
/* loaded from: classes3.dex */
public final class MaybeIsEmptySingle<T> extends Single<Boolean> implements HasUpstreamMaybeSource<T>, FuseToMaybe<Boolean> {
    final MaybeSource<T> source;

    public MaybeIsEmptySingle(MaybeSource<T> source) {
        this.source = source;
    }

    @Override // io.reactivex.internal.fuseable.HasUpstreamMaybeSource
    public MaybeSource<T> source() {
        return this.source;
    }

    @Override // io.reactivex.internal.fuseable.FuseToMaybe
    public Maybe<Boolean> fuseToMaybe() {
        return RxJavaPlugins.onAssembly(new MaybeIsEmpty(this.source));
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super Boolean> observer) {
        this.source.subscribe(new IsEmptyMaybeObserver(observer));
    }

    /* loaded from: classes3.dex */
    static final class IsEmptyMaybeObserver<T> implements MaybeObserver<T>, Disposable {
        final SingleObserver<? super Boolean> actual;
        Disposable d;

        IsEmptyMaybeObserver(SingleObserver<? super Boolean> actual) {
            this.actual = actual;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.d.dispose();
            this.d = DisposableHelper.DISPOSED;
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
            this.d = DisposableHelper.DISPOSED;
            this.actual.onSuccess(false);
        }

        @Override // io.reactivex.MaybeObserver
        public void onError(Throwable e) {
            this.d = DisposableHelper.DISPOSED;
            this.actual.onError(e);
        }

        @Override // io.reactivex.MaybeObserver
        public void onComplete() {
            this.d = DisposableHelper.DISPOSED;
            this.actual.onSuccess(true);
        }
    }
}
