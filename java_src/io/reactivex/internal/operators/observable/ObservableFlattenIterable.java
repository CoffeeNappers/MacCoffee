package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Iterator;
/* loaded from: classes3.dex */
public final class ObservableFlattenIterable<T, R> extends AbstractObservableWithUpstream<T, R> {
    final Function<? super T, ? extends Iterable<? extends R>> mapper;

    public ObservableFlattenIterable(ObservableSource<T> source, Function<? super T, ? extends Iterable<? extends R>> mapper) {
        super(source);
        this.mapper = mapper;
    }

    @Override // io.reactivex.Observable
    protected void subscribeActual(Observer<? super R> observer) {
        this.source.subscribe(new FlattenIterableObserver(observer, this.mapper));
    }

    /* loaded from: classes3.dex */
    static final class FlattenIterableObserver<T, R> implements Observer<T>, Disposable {
        final Observer<? super R> actual;
        Disposable d;
        final Function<? super T, ? extends Iterable<? extends R>> mapper;

        FlattenIterableObserver(Observer<? super R> actual, Function<? super T, ? extends Iterable<? extends R>> mapper) {
            this.actual = actual;
            this.mapper = mapper;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.validate(this.d, d)) {
                this.d = d;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T value) {
            if (this.d != DisposableHelper.DISPOSED) {
                try {
                    Iterator<? extends R> it = this.mapper.mo1190apply(value).iterator();
                    Observer<? super R> a = this.actual;
                    while (true) {
                        try {
                            boolean b = it.hasNext();
                            if (b) {
                                try {
                                    a.onNext((Object) ObjectHelper.requireNonNull(it.next(), "The iterator returned a null value"));
                                } catch (Throwable ex) {
                                    Exceptions.throwIfFatal(ex);
                                    this.d.dispose();
                                    onError(ex);
                                    return;
                                }
                            } else {
                                return;
                            }
                        } catch (Throwable ex2) {
                            Exceptions.throwIfFatal(ex2);
                            this.d.dispose();
                            onError(ex2);
                            return;
                        }
                    }
                } catch (Throwable ex3) {
                    Exceptions.throwIfFatal(ex3);
                    this.d.dispose();
                    onError(ex3);
                }
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable e) {
            if (this.d == DisposableHelper.DISPOSED) {
                RxJavaPlugins.onError(e);
                return;
            }
            this.d = DisposableHelper.DISPOSED;
            this.actual.onError(e);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            if (this.d != DisposableHelper.DISPOSED) {
                this.d = DisposableHelper.DISPOSED;
                this.actual.onComplete();
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.d.isDisposed();
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.d.dispose();
            this.d = DisposableHelper.DISPOSED;
        }
    }
}
