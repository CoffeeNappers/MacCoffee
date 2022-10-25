package io.reactivex.internal.operators.single;

import io.reactivex.Maybe;
import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class SingleFlatMapMaybe<T, R> extends Maybe<R> {
    final Function<? super T, ? extends MaybeSource<? extends R>> mapper;
    final SingleSource<? extends T> source;

    public SingleFlatMapMaybe(SingleSource<? extends T> source, Function<? super T, ? extends MaybeSource<? extends R>> mapper) {
        this.mapper = mapper;
        this.source = source;
    }

    @Override // io.reactivex.Maybe
    protected void subscribeActual(MaybeObserver<? super R> actual) {
        this.source.subscribe(new FlatMapSingleObserver(actual, this.mapper));
    }

    /* loaded from: classes3.dex */
    static final class FlatMapSingleObserver<T, R> extends AtomicReference<Disposable> implements SingleObserver<T>, Disposable {
        private static final long serialVersionUID = -5843758257109742742L;
        final MaybeObserver<? super R> actual;
        final Function<? super T, ? extends MaybeSource<? extends R>> mapper;

        FlatMapSingleObserver(MaybeObserver<? super R> actual, Function<? super T, ? extends MaybeSource<? extends R>> mapper) {
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

        @Override // io.reactivex.SingleObserver
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.setOnce(this, d)) {
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.SingleObserver
        public void onSuccess(T value) {
            try {
                MaybeSource<? extends R> ms = (MaybeSource) ObjectHelper.requireNonNull(this.mapper.mo1190apply(value), "The mapper returned a null MaybeSource");
                if (!isDisposed()) {
                    ms.subscribe(new FlatMapMaybeObserver<>(this, this.actual));
                }
            } catch (Throwable ex) {
                Exceptions.throwIfFatal(ex);
                onError(ex);
            }
        }

        @Override // io.reactivex.SingleObserver
        public void onError(Throwable e) {
            this.actual.onError(e);
        }
    }

    /* loaded from: classes3.dex */
    static final class FlatMapMaybeObserver<R> implements MaybeObserver<R> {
        final MaybeObserver<? super R> actual;
        final AtomicReference<Disposable> parent;

        FlatMapMaybeObserver(AtomicReference<Disposable> parent, MaybeObserver<? super R> actual) {
            this.parent = parent;
            this.actual = actual;
        }

        @Override // io.reactivex.MaybeObserver
        public void onSubscribe(Disposable d) {
            DisposableHelper.replace(this.parent, d);
        }

        @Override // io.reactivex.MaybeObserver
        public void onSuccess(R value) {
            this.actual.onSuccess(value);
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
