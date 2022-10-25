package io.reactivex.internal.operators.maybe;

import io.reactivex.Maybe;
import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.CompositeException;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class MaybeUsing<T, D> extends Maybe<T> {
    final boolean eager;
    final Consumer<? super D> resourceDisposer;
    final Callable<? extends D> resourceSupplier;
    final Function<? super D, ? extends MaybeSource<? extends T>> sourceSupplier;

    public MaybeUsing(Callable<? extends D> resourceSupplier, Function<? super D, ? extends MaybeSource<? extends T>> sourceSupplier, Consumer<? super D> resourceDisposer, boolean eager) {
        this.resourceSupplier = resourceSupplier;
        this.sourceSupplier = sourceSupplier;
        this.resourceDisposer = resourceDisposer;
        this.eager = eager;
    }

    @Override // io.reactivex.Maybe
    protected void subscribeActual(MaybeObserver<? super T> observer) {
        try {
            D resource = this.resourceSupplier.call();
            try {
                MaybeSource<? extends T> source = (MaybeSource) ObjectHelper.requireNonNull(this.sourceSupplier.mo1190apply(resource), "The sourceSupplier returned a null MaybeSource");
                source.subscribe(new UsingObserver<>(observer, resource, this.resourceDisposer, this.eager));
            } catch (Throwable ex) {
                Exceptions.throwIfFatal(ex);
                if (this.eager) {
                    try {
                        this.resourceDisposer.accept(resource);
                    } catch (Throwable exc) {
                        Exceptions.throwIfFatal(exc);
                        EmptyDisposable.error(new CompositeException(ex, exc), observer);
                        return;
                    }
                }
                EmptyDisposable.error(ex, observer);
                if (!this.eager) {
                    try {
                        this.resourceDisposer.accept(resource);
                    } catch (Throwable exc2) {
                        Exceptions.throwIfFatal(exc2);
                        RxJavaPlugins.onError(exc2);
                    }
                }
            }
        } catch (Throwable ex2) {
            Exceptions.throwIfFatal(ex2);
            EmptyDisposable.error(ex2, observer);
        }
    }

    /* loaded from: classes3.dex */
    static final class UsingObserver<T, D> extends AtomicReference<Object> implements MaybeObserver<T>, Disposable {
        private static final long serialVersionUID = -674404550052917487L;
        final MaybeObserver<? super T> actual;
        Disposable d;
        final Consumer<? super D> disposer;
        final boolean eager;

        UsingObserver(MaybeObserver<? super T> actual, D resource, Consumer<? super D> disposer, boolean eager) {
            super(resource);
            this.actual = actual;
            this.disposer = disposer;
            this.eager = eager;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.d.dispose();
            this.d = DisposableHelper.DISPOSED;
            disposeResourceAfter();
        }

        void disposeResourceAfter() {
            Object resource = getAndSet(this);
            if (resource != this) {
                try {
                    this.disposer.accept(resource);
                } catch (Throwable ex) {
                    Exceptions.throwIfFatal(ex);
                    RxJavaPlugins.onError(ex);
                }
            }
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
            if (this.eager) {
                Object resource = getAndSet(this);
                if (resource != this) {
                    try {
                        this.disposer.accept(resource);
                    } catch (Throwable ex) {
                        Exceptions.throwIfFatal(ex);
                        this.actual.onError(ex);
                        return;
                    }
                } else {
                    return;
                }
            }
            this.actual.onSuccess(value);
            if (!this.eager) {
                disposeResourceAfter();
            }
        }

        @Override // io.reactivex.MaybeObserver
        public void onError(Throwable e) {
            this.d = DisposableHelper.DISPOSED;
            if (this.eager) {
                Object resource = getAndSet(this);
                if (resource != this) {
                    try {
                        this.disposer.accept(resource);
                    } catch (Throwable ex) {
                        Exceptions.throwIfFatal(ex);
                        e = new CompositeException(e, ex);
                    }
                } else {
                    return;
                }
            }
            this.actual.onError(e);
            if (!this.eager) {
                disposeResourceAfter();
            }
        }

        @Override // io.reactivex.MaybeObserver
        public void onComplete() {
            this.d = DisposableHelper.DISPOSED;
            if (this.eager) {
                Object resource = getAndSet(this);
                if (resource != this) {
                    try {
                        this.disposer.accept(resource);
                    } catch (Throwable ex) {
                        Exceptions.throwIfFatal(ex);
                        this.actual.onError(ex);
                        return;
                    }
                } else {
                    return;
                }
            }
            this.actual.onComplete();
            if (!this.eager) {
                disposeResourceAfter();
            }
        }
    }
}
