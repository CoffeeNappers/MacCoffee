package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import java.util.concurrent.Callable;
/* loaded from: classes3.dex */
public final class ObservableMapNotification<T, R> extends AbstractObservableWithUpstream<T, ObservableSource<? extends R>> {
    final Callable<? extends ObservableSource<? extends R>> onCompleteSupplier;
    final Function<? super Throwable, ? extends ObservableSource<? extends R>> onErrorMapper;
    final Function<? super T, ? extends ObservableSource<? extends R>> onNextMapper;

    public ObservableMapNotification(ObservableSource<T> source, Function<? super T, ? extends ObservableSource<? extends R>> onNextMapper, Function<? super Throwable, ? extends ObservableSource<? extends R>> onErrorMapper, Callable<? extends ObservableSource<? extends R>> onCompleteSupplier) {
        super(source);
        this.onNextMapper = onNextMapper;
        this.onErrorMapper = onErrorMapper;
        this.onCompleteSupplier = onCompleteSupplier;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super ObservableSource<? extends R>> t) {
        this.source.subscribe(new MapNotificationObserver(t, this.onNextMapper, this.onErrorMapper, this.onCompleteSupplier));
    }

    /* loaded from: classes3.dex */
    static final class MapNotificationObserver<T, R> implements Observer<T>, Disposable {
        final Observer<? super ObservableSource<? extends R>> actual;
        final Callable<? extends ObservableSource<? extends R>> onCompleteSupplier;
        final Function<? super Throwable, ? extends ObservableSource<? extends R>> onErrorMapper;
        final Function<? super T, ? extends ObservableSource<? extends R>> onNextMapper;
        Disposable s;

        MapNotificationObserver(Observer<? super ObservableSource<? extends R>> actual, Function<? super T, ? extends ObservableSource<? extends R>> onNextMapper, Function<? super Throwable, ? extends ObservableSource<? extends R>> onErrorMapper, Callable<? extends ObservableSource<? extends R>> onCompleteSupplier) {
            this.actual = actual;
            this.onNextMapper = onNextMapper;
            this.onErrorMapper = onErrorMapper;
            this.onCompleteSupplier = onCompleteSupplier;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.s.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.s.isDisposed();
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            try {
                ObservableSource<? extends R> p = (ObservableSource) ObjectHelper.requireNonNull(this.onNextMapper.mo1190apply(t), "The onNext publisher returned is null");
                this.actual.onNext(p);
            } catch (Throwable e) {
                Exceptions.throwIfFatal(e);
                this.actual.onError(e);
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            try {
                ObservableSource<? extends R> p = (ObservableSource) ObjectHelper.requireNonNull(this.onErrorMapper.mo1190apply(t), "The onError publisher returned is null");
                this.actual.onNext(p);
                this.actual.onComplete();
            } catch (Throwable e) {
                Exceptions.throwIfFatal(e);
                this.actual.onError(e);
            }
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            try {
                ObservableSource<? extends R> p = (ObservableSource) ObjectHelper.requireNonNull(this.onCompleteSupplier.call(), "The onComplete publisher returned is null");
                this.actual.onNext(p);
                this.actual.onComplete();
            } catch (Throwable e) {
                Exceptions.throwIfFatal(e);
                this.actual.onError(e);
            }
        }
    }
}
