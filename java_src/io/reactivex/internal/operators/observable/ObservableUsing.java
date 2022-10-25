package io.reactivex.internal.operators.observable;

import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.CompositeException;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes3.dex */
public final class ObservableUsing<T, D> extends Observable<T> {
    final Consumer<? super D> disposer;
    final boolean eager;
    final Callable<? extends D> resourceSupplier;
    final Function<? super D, ? extends ObservableSource<? extends T>> sourceSupplier;

    public ObservableUsing(Callable<? extends D> resourceSupplier, Function<? super D, ? extends ObservableSource<? extends T>> sourceSupplier, Consumer<? super D> disposer, boolean eager) {
        this.resourceSupplier = resourceSupplier;
        this.sourceSupplier = sourceSupplier;
        this.disposer = disposer;
        this.eager = eager;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> s) {
        try {
            D resource = this.resourceSupplier.call();
            try {
                ObservableSource<? extends T> source = this.sourceSupplier.mo1190apply(resource);
                UsingObserver<T, D> us = new UsingObserver<>(s, resource, this.disposer, this.eager);
                source.subscribe(us);
            } catch (Throwable e) {
                Exceptions.throwIfFatal(e);
                try {
                    this.disposer.accept(resource);
                    EmptyDisposable.error(e, s);
                } catch (Throwable ex) {
                    Exceptions.throwIfFatal(ex);
                    EmptyDisposable.error(new CompositeException(e, ex), s);
                }
            }
        } catch (Throwable e2) {
            Exceptions.throwIfFatal(e2);
            EmptyDisposable.error(e2, s);
        }
    }

    /* loaded from: classes3.dex */
    static final class UsingObserver<T, D> extends AtomicBoolean implements Observer<T>, Disposable {
        private static final long serialVersionUID = 5904473792286235046L;
        final Observer<? super T> actual;
        final Consumer<? super D> disposer;
        final boolean eager;
        final D resource;
        Disposable s;

        UsingObserver(Observer<? super T> actual, D resource, Consumer<? super D> disposer, boolean eager) {
            this.actual = actual;
            this.resource = resource;
            this.disposer = disposer;
            this.eager = eager;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            this.actual.onNext(t);
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            if (this.eager) {
                if (compareAndSet(false, true)) {
                    try {
                        this.disposer.accept((D) this.resource);
                    } catch (Throwable e) {
                        Exceptions.throwIfFatal(e);
                        t = new CompositeException(t, e);
                    }
                }
                this.s.dispose();
                this.actual.onError(t);
                return;
            }
            this.actual.onError(t);
            this.s.dispose();
            disposeAfter();
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            if (this.eager) {
                if (compareAndSet(false, true)) {
                    try {
                        this.disposer.accept((D) this.resource);
                    } catch (Throwable e) {
                        Exceptions.throwIfFatal(e);
                        this.actual.onError(e);
                        return;
                    }
                }
                this.s.dispose();
                this.actual.onComplete();
                return;
            }
            this.actual.onComplete();
            this.s.dispose();
            disposeAfter();
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            disposeAfter();
            this.s.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return get();
        }

        void disposeAfter() {
            if (compareAndSet(false, true)) {
                try {
                    this.disposer.accept((D) this.resource);
                } catch (Throwable e) {
                    Exceptions.throwIfFatal(e);
                    RxJavaPlugins.onError(e);
                }
            }
        }
    }
}
