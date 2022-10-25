package io.reactivex.internal.operators.single;

import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class SingleFlatMap<T, R> extends Single<R> {
    final Function<? super T, ? extends SingleSource<? extends R>> mapper;
    final SingleSource<? extends T> source;

    public SingleFlatMap(SingleSource<? extends T> source, Function<? super T, ? extends SingleSource<? extends R>> mapper) {
        this.mapper = mapper;
        this.source = source;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super R> actual) {
        this.source.subscribe(new SingleFlatMapCallback(actual, this.mapper));
    }

    /* loaded from: classes3.dex */
    static final class SingleFlatMapCallback<T, R> extends AtomicReference<Disposable> implements SingleObserver<T>, Disposable {
        private static final long serialVersionUID = 3258103020495908596L;
        final SingleObserver<? super R> actual;
        final Function<? super T, ? extends SingleSource<? extends R>> mapper;

        SingleFlatMapCallback(SingleObserver<? super R> actual, Function<? super T, ? extends SingleSource<? extends R>> mapper) {
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
                SingleSource<? extends R> o = (SingleSource) ObjectHelper.requireNonNull(this.mapper.mo1190apply(value), "The single returned by the mapper is null");
                if (!isDisposed()) {
                    o.subscribe(new FlatMapSingleObserver<>(this, this.actual));
                }
            } catch (Throwable e) {
                Exceptions.throwIfFatal(e);
                this.actual.onError(e);
            }
        }

        @Override // io.reactivex.SingleObserver
        public void onError(Throwable e) {
            this.actual.onError(e);
        }

        /* loaded from: classes3.dex */
        static final class FlatMapSingleObserver<R> implements SingleObserver<R> {
            final SingleObserver<? super R> actual;
            final AtomicReference<Disposable> parent;

            FlatMapSingleObserver(AtomicReference<Disposable> parent, SingleObserver<? super R> actual) {
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
}
