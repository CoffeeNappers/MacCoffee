package io.reactivex.internal.operators.maybe;

import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class MaybeFlatten<T, R> extends AbstractMaybeWithUpstream<T, R> {
    final Function<? super T, ? extends MaybeSource<? extends R>> mapper;

    public MaybeFlatten(MaybeSource<T> source, Function<? super T, ? extends MaybeSource<? extends R>> mapper) {
        super(source);
        this.mapper = mapper;
    }

    @Override // io.reactivex.Maybe
    protected void subscribeActual(MaybeObserver<? super R> observer) {
        this.source.subscribe(new FlatMapMaybeObserver(observer, this.mapper));
    }

    /* loaded from: classes3.dex */
    static final class FlatMapMaybeObserver<T, R> extends AtomicReference<Disposable> implements MaybeObserver<T>, Disposable {
        private static final long serialVersionUID = 4375739915521278546L;
        final MaybeObserver<? super R> actual;
        Disposable d;
        final Function<? super T, ? extends MaybeSource<? extends R>> mapper;

        FlatMapMaybeObserver(MaybeObserver<? super R> actual, Function<? super T, ? extends MaybeSource<? extends R>> mapper) {
            this.actual = actual;
            this.mapper = mapper;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            DisposableHelper.dispose(this);
            this.d.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return DisposableHelper.isDisposed(get());
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
                MaybeSource<? extends R> source = (MaybeSource) ObjectHelper.requireNonNull(this.mapper.mo1190apply(value), "The mapper returned a null MaybeSource");
                if (!isDisposed()) {
                    source.subscribe(new InnerObserver());
                }
            } catch (Exception ex) {
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

        /* loaded from: classes3.dex */
        final class InnerObserver implements MaybeObserver<R> {
            InnerObserver() {
            }

            @Override // io.reactivex.MaybeObserver
            public void onSubscribe(Disposable d) {
                DisposableHelper.setOnce(FlatMapMaybeObserver.this, d);
            }

            @Override // io.reactivex.MaybeObserver
            public void onSuccess(R value) {
                FlatMapMaybeObserver.this.actual.onSuccess(value);
            }

            @Override // io.reactivex.MaybeObserver
            public void onError(Throwable e) {
                FlatMapMaybeObserver.this.actual.onError(e);
            }

            @Override // io.reactivex.MaybeObserver
            public void onComplete() {
                FlatMapMaybeObserver.this.actual.onComplete();
            }
        }
    }
}
