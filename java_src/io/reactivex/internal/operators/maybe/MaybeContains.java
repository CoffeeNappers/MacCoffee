package io.reactivex.internal.operators.maybe;

import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.HasUpstreamMaybeSource;
/* loaded from: classes3.dex */
public final class MaybeContains<T> extends Single<Boolean> implements HasUpstreamMaybeSource<T> {
    final MaybeSource<T> source;
    final Object value;

    public MaybeContains(MaybeSource<T> source, Object value) {
        this.source = source;
        this.value = value;
    }

    @Override // io.reactivex.internal.fuseable.HasUpstreamMaybeSource
    public MaybeSource<T> source() {
        return this.source;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super Boolean> observer) {
        this.source.subscribe(new ContainsMaybeObserver(observer, this.value));
    }

    /* loaded from: classes3.dex */
    static final class ContainsMaybeObserver implements MaybeObserver<Object>, Disposable {
        final SingleObserver<? super Boolean> actual;
        Disposable d;
        final Object value;

        ContainsMaybeObserver(SingleObserver<? super Boolean> actual, Object value) {
            this.actual = actual;
            this.value = value;
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
        public void onSuccess(Object value) {
            this.d = DisposableHelper.DISPOSED;
            this.actual.onSuccess(Boolean.valueOf(ObjectHelper.equals(value, this.value)));
        }

        @Override // io.reactivex.MaybeObserver
        public void onError(Throwable e) {
            this.d = DisposableHelper.DISPOSED;
            this.actual.onError(e);
        }

        @Override // io.reactivex.MaybeObserver
        public void onComplete() {
            this.d = DisposableHelper.DISPOSED;
            this.actual.onSuccess(false);
        }
    }
}
