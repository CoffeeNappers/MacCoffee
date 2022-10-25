package io.reactivex.internal.operators.single;

import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
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
public final class SingleUsing<T, U> extends Single<T> {
    final Consumer<? super U> disposer;
    final boolean eager;
    final Callable<U> resourceSupplier;
    final Function<? super U, ? extends SingleSource<? extends T>> singleFunction;

    public SingleUsing(Callable<U> resourceSupplier, Function<? super U, ? extends SingleSource<? extends T>> singleFunction, Consumer<? super U> disposer, boolean eager) {
        this.resourceSupplier = resourceSupplier;
        this.singleFunction = singleFunction;
        this.disposer = disposer;
        this.eager = eager;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super T> s) {
        try {
            U resource = this.resourceSupplier.call();
            try {
                SingleSource<? extends T> source = (SingleSource) ObjectHelper.requireNonNull(this.singleFunction.mo1190apply(resource), "The singleFunction returned a null SingleSource");
                source.subscribe(new UsingSingleObserver<>(s, resource, this.eager, this.disposer));
            } catch (Throwable th) {
                ex = th;
                Exceptions.throwIfFatal(ex);
                if (this.eager) {
                    try {
                        this.disposer.accept(resource);
                    } catch (Throwable exc) {
                        Exceptions.throwIfFatal(exc);
                        ex = new CompositeException(ex, exc);
                    }
                }
                EmptyDisposable.error(ex, s);
                if (!this.eager) {
                    try {
                        this.disposer.accept(resource);
                    } catch (Throwable exc2) {
                        Exceptions.throwIfFatal(exc2);
                        RxJavaPlugins.onError(exc2);
                    }
                }
            }
        } catch (Throwable ex) {
            Exceptions.throwIfFatal(ex);
            EmptyDisposable.error(ex, s);
        }
    }

    /* loaded from: classes3.dex */
    static final class UsingSingleObserver<T, U> extends AtomicReference<Object> implements SingleObserver<T>, Disposable {
        private static final long serialVersionUID = -5331524057054083935L;
        final SingleObserver<? super T> actual;
        Disposable d;
        final Consumer<? super U> disposer;
        final boolean eager;

        UsingSingleObserver(SingleObserver<? super T> actual, U resource, boolean eager, Consumer<? super U> disposer) {
            super(resource);
            this.actual = actual;
            this.eager = eager;
            this.disposer = disposer;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.d.dispose();
            this.d = DisposableHelper.DISPOSED;
            disposeAfter();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.d.isDisposed();
        }

        @Override // io.reactivex.SingleObserver
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.validate(this.d, d)) {
                this.d = d;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.SingleObserver
        public void onSuccess(T value) {
            this.d = DisposableHelper.DISPOSED;
            if (this.eager) {
                Object u = getAndSet(this);
                if (u != this) {
                    try {
                        this.disposer.accept(u);
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
                disposeAfter();
            }
        }

        @Override // io.reactivex.SingleObserver
        public void onError(Throwable e) {
            this.d = DisposableHelper.DISPOSED;
            if (this.eager) {
                Object u = getAndSet(this);
                if (u != this) {
                    try {
                        this.disposer.accept(u);
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
                disposeAfter();
            }
        }

        void disposeAfter() {
            Object u = getAndSet(this);
            if (u != this) {
                try {
                    this.disposer.accept(u);
                } catch (Throwable ex) {
                    Exceptions.throwIfFatal(ex);
                    RxJavaPlugins.onError(ex);
                }
            }
        }
    }
}
