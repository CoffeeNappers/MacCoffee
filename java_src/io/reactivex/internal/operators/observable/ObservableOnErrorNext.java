package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.CompositeException;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.SequentialDisposable;
import io.reactivex.plugins.RxJavaPlugins;
/* loaded from: classes3.dex */
public final class ObservableOnErrorNext<T> extends AbstractObservableWithUpstream<T, T> {
    final boolean allowFatal;
    final Function<? super Throwable, ? extends ObservableSource<? extends T>> nextSupplier;

    public ObservableOnErrorNext(ObservableSource<T> source, Function<? super Throwable, ? extends ObservableSource<? extends T>> nextSupplier, boolean allowFatal) {
        super(source);
        this.nextSupplier = nextSupplier;
        this.allowFatal = allowFatal;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> t) {
        OnErrorNextObserver<T> parent = new OnErrorNextObserver<>(t, this.nextSupplier, this.allowFatal);
        t.onSubscribe(parent.arbiter);
        this.source.subscribe(parent);
    }

    /* loaded from: classes3.dex */
    static final class OnErrorNextObserver<T> implements Observer<T> {
        final Observer<? super T> actual;
        final boolean allowFatal;
        final SequentialDisposable arbiter = new SequentialDisposable();
        boolean done;
        final Function<? super Throwable, ? extends ObservableSource<? extends T>> nextSupplier;
        boolean once;

        OnErrorNextObserver(Observer<? super T> actual, Function<? super Throwable, ? extends ObservableSource<? extends T>> nextSupplier, boolean allowFatal) {
            this.actual = actual;
            this.nextSupplier = nextSupplier;
            this.allowFatal = allowFatal;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            this.arbiter.replace(s);
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            if (!this.done) {
                this.actual.onNext(t);
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            if (this.once) {
                if (this.done) {
                    RxJavaPlugins.onError(t);
                    return;
                } else {
                    this.actual.onError(t);
                    return;
                }
            }
            this.once = true;
            if (this.allowFatal && !(t instanceof Exception)) {
                this.actual.onError(t);
                return;
            }
            try {
                ObservableSource<? extends T> p = this.nextSupplier.mo1190apply(t);
                if (p == null) {
                    NullPointerException npe = new NullPointerException("Observable is null");
                    npe.initCause(t);
                    this.actual.onError(npe);
                    return;
                }
                p.subscribe(this);
            } catch (Throwable e) {
                Exceptions.throwIfFatal(e);
                this.actual.onError(new CompositeException(t, e));
            }
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                this.once = true;
                this.actual.onComplete();
            }
        }
    }
}
