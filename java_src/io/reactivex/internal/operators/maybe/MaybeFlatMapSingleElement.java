package io.reactivex.internal.operators.maybe;

import io.reactivex.Maybe;
import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.annotations.Experimental;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import java.util.concurrent.atomic.AtomicReference;
@Experimental
/* loaded from: classes3.dex */
public final class MaybeFlatMapSingleElement<T, R> extends Maybe<R> {
    final Function<? super T, ? extends SingleSource<? extends R>> mapper;
    final MaybeSource<T> source;

    public MaybeFlatMapSingleElement(MaybeSource<T> source, Function<? super T, ? extends SingleSource<? extends R>> mapper) {
        this.source = source;
        this.mapper = mapper;
    }

    @Override // io.reactivex.Maybe
    protected void subscribeActual(MaybeObserver<? super R> actual) {
        this.source.subscribe(new FlatMapMaybeObserver(actual, this.mapper));
    }

    /* loaded from: classes3.dex */
    static final class FlatMapMaybeObserver<T, R> extends AtomicReference<Disposable> implements MaybeObserver<T>, Disposable {
        private static final long serialVersionUID = 4827726964688405508L;
        final MaybeObserver<? super R> actual;
        final Function<? super T, ? extends SingleSource<? extends R>> mapper;

        FlatMapMaybeObserver(MaybeObserver<? super R> actual, Function<? super T, ? extends SingleSource<? extends R>> mapper) {
            this.actual = actual;
            this.mapper = mapper;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            DisposableHelper.dispose(this);
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return DisposableHelper.isDisposed(get());
        }

        @Override // io.reactivex.MaybeObserver
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.setOnce(this, d)) {
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.MaybeObserver
        public void onSuccess(T value) {
            try {
                SingleSource<? extends R> ss = (SingleSource) ObjectHelper.requireNonNull(this.mapper.mo1190apply(value), "The mapper returned a null SingleSource");
                ss.subscribe(new FlatMapSingleObserver<>(this, this.actual));
            } catch (Throwable ex) {
                Exceptions.throwIfFatal(ex);
                onError(ex);
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

    /* loaded from: classes3.dex */
    static final class FlatMapSingleObserver<R> implements SingleObserver<R> {
        final MaybeObserver<? super R> actual;
        final AtomicReference<Disposable> parent;

        FlatMapSingleObserver(AtomicReference<Disposable> parent, MaybeObserver<? super R> actual) {
            this.parent = parent;
            this.actual = actual;
        }

        @Override // io.reactivex.SingleObserver
        public void onSubscribe(Disposable d) {
            DisposableHelper.replace(this.parent, d);
        }

        @Override // io.reactivex.SingleObserver
        public void onSuccess(R value) {
            this.actual.onSuccess(value);
        }

        @Override // io.reactivex.SingleObserver
        public void onError(Throwable e) {
            this.actual.onError(e);
        }
    }
}
