package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Predicate;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.plugins.RxJavaPlugins;
/* loaded from: classes3.dex */
public final class ObservableTakeUntilPredicate<T> extends AbstractObservableWithUpstream<T, T> {
    final Predicate<? super T> predicate;

    public ObservableTakeUntilPredicate(ObservableSource<T> source, Predicate<? super T> predicate) {
        super(source);
        this.predicate = predicate;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> s) {
        this.source.subscribe(new TakeUntilPredicateObserver(s, this.predicate));
    }

    /* loaded from: classes3.dex */
    static final class TakeUntilPredicateObserver<T> implements Observer<T>, Disposable {
        final Observer<? super T> actual;
        boolean done;
        final Predicate<? super T> predicate;
        Disposable s;

        TakeUntilPredicateObserver(Observer<? super T> actual, Predicate<? super T> predicate) {
            this.actual = actual;
            this.predicate = predicate;
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
            if (!this.done) {
                this.actual.onNext(t);
                try {
                    boolean b = this.predicate.test(t);
                    if (b) {
                        this.done = true;
                        this.s.dispose();
                        this.actual.onComplete();
                    }
                } catch (Throwable e) {
                    Exceptions.throwIfFatal(e);
                    this.s.dispose();
                    onError(e);
                }
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            if (!this.done) {
                this.done = true;
                this.actual.onError(t);
                return;
            }
            RxJavaPlugins.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                this.actual.onComplete();
            }
        }
    }
}
