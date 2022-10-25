package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.ArrayCompositeDisposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.observers.SerializedObserver;
/* loaded from: classes3.dex */
public final class ObservableSkipUntil<T, U> extends AbstractObservableWithUpstream<T, T> {
    final ObservableSource<U> other;

    public ObservableSkipUntil(ObservableSource<T> source, ObservableSource<U> other) {
        super(source);
        this.other = other;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> child) {
        SerializedObserver<T> serial = new SerializedObserver<>(child);
        ArrayCompositeDisposable frc = new ArrayCompositeDisposable(2);
        serial.onSubscribe(frc);
        SkipUntilObserver<T> sus = new SkipUntilObserver<>(serial, frc);
        this.other.subscribe(new SkipUntil(frc, sus, serial));
        this.source.subscribe(sus);
    }

    /* loaded from: classes3.dex */
    static final class SkipUntilObserver<T> implements Observer<T> {
        final Observer<? super T> actual;
        final ArrayCompositeDisposable frc;
        volatile boolean notSkipping;
        boolean notSkippingLocal;
        Disposable s;

        SkipUntilObserver(Observer<? super T> actual, ArrayCompositeDisposable frc) {
            this.actual = actual;
            this.frc = frc;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                this.frc.setResource(0, s);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            if (this.notSkippingLocal) {
                this.actual.onNext(t);
            } else if (this.notSkipping) {
                this.notSkippingLocal = true;
                this.actual.onNext(t);
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.frc.dispose();
            this.actual.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            this.frc.dispose();
            this.actual.onComplete();
        }
    }

    /* loaded from: classes3.dex */
    final class SkipUntil implements Observer<U> {
        private final ArrayCompositeDisposable frc;
        Disposable s;
        private final SerializedObserver<T> serial;
        private final SkipUntilObserver<T> sus;

        SkipUntil(ArrayCompositeDisposable frc, SkipUntilObserver<T> sus, SerializedObserver<T> serial) {
            this.frc = frc;
            this.sus = sus;
            this.serial = serial;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                this.frc.setResource(1, s);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(U t) {
            this.s.dispose();
            this.sus.notSkipping = true;
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.frc.dispose();
            this.serial.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            this.sus.notSkipping = true;
        }
    }
}
