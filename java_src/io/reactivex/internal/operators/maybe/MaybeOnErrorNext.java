package io.reactivex.internal.operators.maybe;

import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.CompositeException;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class MaybeOnErrorNext<T> extends AbstractMaybeWithUpstream<T, T> {
    final boolean allowFatal;
    final Function<? super Throwable, ? extends MaybeSource<? extends T>> resumeFunction;

    public MaybeOnErrorNext(MaybeSource<T> source, Function<? super Throwable, ? extends MaybeSource<? extends T>> resumeFunction, boolean allowFatal) {
        super(source);
        this.resumeFunction = resumeFunction;
        this.allowFatal = allowFatal;
    }

    @Override // io.reactivex.Maybe
    protected void subscribeActual(MaybeObserver<? super T> observer) {
        this.source.subscribe(new OnErrorNextMaybeObserver(observer, this.resumeFunction, this.allowFatal));
    }

    /* loaded from: classes3.dex */
    static final class OnErrorNextMaybeObserver<T> extends AtomicReference<Disposable> implements MaybeObserver<T>, Disposable {
        private static final long serialVersionUID = 2026620218879969836L;
        final MaybeObserver<? super T> actual;
        final boolean allowFatal;
        final Function<? super Throwable, ? extends MaybeSource<? extends T>> resumeFunction;

        OnErrorNextMaybeObserver(MaybeObserver<? super T> actual, Function<? super Throwable, ? extends MaybeSource<? extends T>> resumeFunction, boolean allowFatal) {
            this.actual = actual;
            this.resumeFunction = resumeFunction;
            this.allowFatal = allowFatal;
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
            this.actual.onSuccess(value);
        }

        @Override // io.reactivex.MaybeObserver
        public void onError(Throwable e) {
            if (!this.allowFatal && !(e instanceof Exception)) {
                this.actual.onError(e);
                return;
            }
            try {
                MaybeSource<? extends T> m = (MaybeSource) ObjectHelper.requireNonNull(this.resumeFunction.mo1190apply(e), "The resumeFunction returned a null MaybeSource");
                DisposableHelper.replace(this, null);
                m.subscribe(new NextMaybeObserver<>(this.actual, this));
            } catch (Throwable ex) {
                Exceptions.throwIfFatal(ex);
                this.actual.onError(new CompositeException(e, ex));
            }
        }

        @Override // io.reactivex.MaybeObserver
        public void onComplete() {
            this.actual.onComplete();
        }

        /* loaded from: classes3.dex */
        static final class NextMaybeObserver<T> implements MaybeObserver<T> {
            final MaybeObserver<? super T> actual;
            final AtomicReference<Disposable> d;

            NextMaybeObserver(MaybeObserver<? super T> actual, AtomicReference<Disposable> d) {
                this.actual = actual;
                this.d = d;
            }

            @Override // io.reactivex.MaybeObserver
            public void onSubscribe(Disposable d) {
                DisposableHelper.setOnce(this.d, d);
            }

            @Override // io.reactivex.MaybeObserver
            public void onSuccess(T value) {
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
}
