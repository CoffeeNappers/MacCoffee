package io.reactivex.internal.operators.maybe;

import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
/* loaded from: classes3.dex */
public final class MaybeMap<T, R> extends AbstractMaybeWithUpstream<T, R> {
    final Function<? super T, ? extends R> mapper;

    public MaybeMap(MaybeSource<T> source, Function<? super T, ? extends R> mapper) {
        super(source);
        this.mapper = mapper;
    }

    @Override // io.reactivex.Maybe
    protected void subscribeActual(MaybeObserver<? super R> observer) {
        this.source.subscribe(new MapMaybeObserver(observer, this.mapper));
    }

    /* loaded from: classes3.dex */
    static final class MapMaybeObserver<T, R> implements MaybeObserver<T>, Disposable {
        final MaybeObserver<? super R> actual;
        Disposable d;
        final Function<? super T, ? extends R> mapper;

        /* JADX INFO: Access modifiers changed from: package-private */
        public MapMaybeObserver(MaybeObserver<? super R> actual, Function<? super T, ? extends R> mapper) {
            this.actual = actual;
            this.mapper = mapper;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            Disposable d = this.d;
            this.d = DisposableHelper.DISPOSED;
            d.dispose();
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
            try {
                this.actual.onSuccess(ObjectHelper.requireNonNull(this.mapper.mo1190apply(value), "The mapper returned a null item"));
            } catch (Throwable ex) {
                Exceptions.throwIfFatal(ex);
                this.actual.onError(ex);
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
    }
}
