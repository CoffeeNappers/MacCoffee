package io.reactivex.internal.operators.maybe;

import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.CompositeException;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class MaybeFlatMapNotification<T, R> extends AbstractMaybeWithUpstream<T, R> {
    final Callable<? extends MaybeSource<? extends R>> onCompleteSupplier;
    final Function<? super Throwable, ? extends MaybeSource<? extends R>> onErrorMapper;
    final Function<? super T, ? extends MaybeSource<? extends R>> onSuccessMapper;

    public MaybeFlatMapNotification(MaybeSource<T> source, Function<? super T, ? extends MaybeSource<? extends R>> onSuccessMapper, Function<? super Throwable, ? extends MaybeSource<? extends R>> onErrorMapper, Callable<? extends MaybeSource<? extends R>> onCompleteSupplier) {
        super(source);
        this.onSuccessMapper = onSuccessMapper;
        this.onErrorMapper = onErrorMapper;
        this.onCompleteSupplier = onCompleteSupplier;
    }

    @Override // io.reactivex.Maybe
    protected void subscribeActual(MaybeObserver<? super R> observer) {
        this.source.subscribe(new FlatMapMaybeObserver(observer, this.onSuccessMapper, this.onErrorMapper, this.onCompleteSupplier));
    }

    /* loaded from: classes3.dex */
    static final class FlatMapMaybeObserver<T, R> extends AtomicReference<Disposable> implements MaybeObserver<T>, Disposable {
        private static final long serialVersionUID = 4375739915521278546L;
        final MaybeObserver<? super R> actual;
        Disposable d;
        final Callable<? extends MaybeSource<? extends R>> onCompleteSupplier;
        final Function<? super Throwable, ? extends MaybeSource<? extends R>> onErrorMapper;
        final Function<? super T, ? extends MaybeSource<? extends R>> onSuccessMapper;

        FlatMapMaybeObserver(MaybeObserver<? super R> actual, Function<? super T, ? extends MaybeSource<? extends R>> onSuccessMapper, Function<? super Throwable, ? extends MaybeSource<? extends R>> onErrorMapper, Callable<? extends MaybeSource<? extends R>> onCompleteSupplier) {
            this.actual = actual;
            this.onSuccessMapper = onSuccessMapper;
            this.onErrorMapper = onErrorMapper;
            this.onCompleteSupplier = onCompleteSupplier;
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
                MaybeSource<? extends R> source = (MaybeSource) ObjectHelper.requireNonNull(this.onSuccessMapper.mo1190apply(value), "The onSuccessMapper returned a null MaybeSource");
                source.subscribe(new InnerObserver());
            } catch (Exception ex) {
                Exceptions.throwIfFatal(ex);
                this.actual.onError(ex);
            }
        }

        @Override // io.reactivex.MaybeObserver
        public void onError(Throwable e) {
            try {
                MaybeSource<? extends R> source = (MaybeSource) ObjectHelper.requireNonNull(this.onErrorMapper.mo1190apply(e), "The onErrorMapper returned a null MaybeSource");
                source.subscribe(new InnerObserver());
            } catch (Exception ex) {
                Exceptions.throwIfFatal(ex);
                this.actual.onError(new CompositeException(e, ex));
            }
        }

        @Override // io.reactivex.MaybeObserver
        public void onComplete() {
            try {
                MaybeSource<? extends R> source = (MaybeSource) ObjectHelper.requireNonNull(this.onCompleteSupplier.call(), "The onCompleteSupplier returned a null MaybeSource");
                source.subscribe(new InnerObserver());
            } catch (Exception ex) {
                Exceptions.throwIfFatal(ex);
                this.actual.onError(ex);
            }
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
