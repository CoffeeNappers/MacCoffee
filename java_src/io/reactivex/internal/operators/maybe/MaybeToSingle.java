package io.reactivex.internal.operators.maybe;

import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.fuseable.HasUpstreamMaybeSource;
import java.util.NoSuchElementException;
/* loaded from: classes3.dex */
public final class MaybeToSingle<T> extends Single<T> implements HasUpstreamMaybeSource<T> {
    final T defaultValue;
    final MaybeSource<T> source;

    public MaybeToSingle(MaybeSource<T> source, T defaultValue) {
        this.source = source;
        this.defaultValue = defaultValue;
    }

    @Override // io.reactivex.internal.fuseable.HasUpstreamMaybeSource
    public MaybeSource<T> source() {
        return this.source;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super T> observer) {
        this.source.subscribe(new ToSingleMaybeSubscriber(observer, this.defaultValue));
    }

    /* loaded from: classes3.dex */
    static final class ToSingleMaybeSubscriber<T> implements MaybeObserver<T>, Disposable {
        final SingleObserver<? super T> actual;
        Disposable d;
        final T defaultValue;

        ToSingleMaybeSubscriber(SingleObserver<? super T> actual, T defaultValue) {
            this.actual = actual;
            this.defaultValue = defaultValue;
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
            this.actual.onSuccess(value);
        }

        @Override // io.reactivex.MaybeObserver
        public void onError(Throwable e) {
            this.d = DisposableHelper.DISPOSED;
            this.actual.onError(e);
        }

        @Override // io.reactivex.MaybeObserver
        public void onComplete() {
            this.d = DisposableHelper.DISPOSED;
            if (this.defaultValue != null) {
                this.actual.onSuccess((T) this.defaultValue);
            } else {
                this.actual.onError(new NoSuchElementException("The MaybeSource is empty"));
            }
        }
    }
}
