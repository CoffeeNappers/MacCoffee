package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.ArrayCompositeDisposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.observers.SerializedObserver;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes3.dex */
public final class ObservableTakeUntil<T, U> extends AbstractObservableWithUpstream<T, T> {
    final ObservableSource<? extends U> other;

    public ObservableTakeUntil(ObservableSource<T> source, ObservableSource<? extends U> other) {
        super(source);
        this.other = other;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> child) {
        SerializedObserver<T> serial = new SerializedObserver<>(child);
        ArrayCompositeDisposable frc = new ArrayCompositeDisposable(2);
        TakeUntilObserver<T> tus = new TakeUntilObserver<>(serial, frc);
        child.onSubscribe(frc);
        this.other.subscribe(new TakeUntil(frc, serial));
        this.source.subscribe(tus);
    }

    /* loaded from: classes3.dex */
    static final class TakeUntilObserver<T> extends AtomicBoolean implements Observer<T> {
        private static final long serialVersionUID = 3451719290311127173L;
        final Observer<? super T> actual;
        final ArrayCompositeDisposable frc;
        Disposable s;

        TakeUntilObserver(Observer<? super T> actual, ArrayCompositeDisposable frc) {
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
            this.actual.onNext(t);
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
    final class TakeUntil implements Observer<U> {
        private final ArrayCompositeDisposable frc;
        private final SerializedObserver<T> serial;

        TakeUntil(ArrayCompositeDisposable frc, SerializedObserver<T> serial) {
            this.frc = frc;
            this.serial = serial;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            this.frc.setResource(1, s);
        }

        @Override // io.reactivex.Observer
        public void onNext(U t) {
            this.frc.dispose();
            this.serial.onComplete();
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.frc.dispose();
            this.serial.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            this.frc.dispose();
            this.serial.onComplete();
        }
    }
}
