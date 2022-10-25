package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.BiFunction;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.observers.SerializedObserver;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class ObservableWithLatestFrom<T, U, R> extends AbstractObservableWithUpstream<T, R> {
    final BiFunction<? super T, ? super U, ? extends R> combiner;
    final ObservableSource<? extends U> other;

    public ObservableWithLatestFrom(ObservableSource<T> source, BiFunction<? super T, ? super U, ? extends R> combiner, ObservableSource<? extends U> other) {
        super(source);
        this.combiner = combiner;
        this.other = other;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super R> t) {
        SerializedObserver<R> serial = new SerializedObserver<>(t);
        WithLatestFromObserver<T, U, R> wlf = new WithLatestFromObserver<>(serial, this.combiner);
        serial.onSubscribe(wlf);
        this.other.subscribe(new WithLastFrom(wlf));
        this.source.subscribe(wlf);
    }

    /* loaded from: classes3.dex */
    static final class WithLatestFromObserver<T, U, R> extends AtomicReference<U> implements Observer<T>, Disposable {
        private static final long serialVersionUID = -312246233408980075L;
        final Observer<? super R> actual;
        final BiFunction<? super T, ? super U, ? extends R> combiner;
        final AtomicReference<Disposable> s = new AtomicReference<>();
        final AtomicReference<Disposable> other = new AtomicReference<>();

        WithLatestFromObserver(Observer<? super R> actual, BiFunction<? super T, ? super U, ? extends R> combiner) {
            this.actual = actual;
            this.combiner = combiner;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            DisposableHelper.setOnce(this.s, s);
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            U u = get();
            if (u != null) {
                try {
                    this.actual.onNext(ObjectHelper.requireNonNull(this.combiner.apply(t, u), "The combiner returned a null value"));
                } catch (Throwable e) {
                    Exceptions.throwIfFatal(e);
                    dispose();
                    this.actual.onError(e);
                }
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            DisposableHelper.dispose(this.other);
            this.actual.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            DisposableHelper.dispose(this.other);
            this.actual.onComplete();
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            DisposableHelper.dispose(this.s);
            DisposableHelper.dispose(this.other);
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return DisposableHelper.isDisposed(this.s.get());
        }

        public boolean setOther(Disposable o) {
            return DisposableHelper.setOnce(this.other, o);
        }

        public void otherError(Throwable e) {
            DisposableHelper.dispose(this.s);
            this.actual.onError(e);
        }
    }

    /* loaded from: classes3.dex */
    final class WithLastFrom implements Observer<U> {
        private final WithLatestFromObserver<T, U, R> wlf;

        WithLastFrom(WithLatestFromObserver<T, U, R> wlf) {
            this.wlf = wlf;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            this.wlf.setOther(s);
        }

        @Override // io.reactivex.Observer
        public void onNext(U t) {
            this.wlf.lazySet(t);
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.wlf.otherError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
        }
    }
}
