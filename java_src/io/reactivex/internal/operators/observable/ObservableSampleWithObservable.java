package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.observers.SerializedObserver;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class ObservableSampleWithObservable<T> extends AbstractObservableWithUpstream<T, T> {
    final boolean emitLast;
    final ObservableSource<?> other;

    public ObservableSampleWithObservable(ObservableSource<T> source, ObservableSource<?> other, boolean emitLast) {
        super(source);
        this.other = other;
        this.emitLast = emitLast;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> t) {
        SerializedObserver<T> serial = new SerializedObserver<>(t);
        if (this.emitLast) {
            this.source.subscribe(new SampleMainEmitLast(serial, this.other));
        } else {
            this.source.subscribe(new SampleMainNoLast(serial, this.other));
        }
    }

    /* loaded from: classes3.dex */
    static abstract class SampleMainObserver<T> extends AtomicReference<T> implements Observer<T>, Disposable {
        private static final long serialVersionUID = -3517602651313910099L;
        final Observer<? super T> actual;
        final AtomicReference<Disposable> other = new AtomicReference<>();
        Disposable s;
        final ObservableSource<?> sampler;

        abstract void completeMain();

        abstract void completeOther();

        abstract void run();

        SampleMainObserver(Observer<? super T> actual, ObservableSource<?> other) {
            this.actual = actual;
            this.sampler = other;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
                if (this.other.get() == null) {
                    this.sampler.subscribe(new SamplerObserver(this));
                }
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            lazySet(t);
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            DisposableHelper.dispose(this.other);
            this.actual.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            DisposableHelper.dispose(this.other);
            completeMain();
        }

        boolean setOther(Disposable o) {
            return DisposableHelper.setOnce(this.other, o);
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            DisposableHelper.dispose(this.other);
            this.s.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.other.get() == DisposableHelper.DISPOSED;
        }

        public void error(Throwable e) {
            this.s.dispose();
            this.actual.onError(e);
        }

        public void complete() {
            this.s.dispose();
            completeOther();
        }

        void emit() {
            T value = getAndSet(null);
            if (value != null) {
                this.actual.onNext(value);
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class SamplerObserver<T> implements Observer<Object> {
        final SampleMainObserver<T> parent;

        SamplerObserver(SampleMainObserver<T> parent) {
            this.parent = parent;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            this.parent.setOther(s);
        }

        @Override // io.reactivex.Observer
        public void onNext(Object t) {
            this.parent.run();
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.parent.error(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            this.parent.complete();
        }
    }

    /* loaded from: classes3.dex */
    static final class SampleMainNoLast<T> extends SampleMainObserver<T> {
        private static final long serialVersionUID = -3029755663834015785L;

        SampleMainNoLast(Observer<? super T> actual, ObservableSource<?> other) {
            super(actual, other);
        }

        @Override // io.reactivex.internal.operators.observable.ObservableSampleWithObservable.SampleMainObserver
        void completeMain() {
            this.actual.onComplete();
        }

        @Override // io.reactivex.internal.operators.observable.ObservableSampleWithObservable.SampleMainObserver
        void completeOther() {
            this.actual.onComplete();
        }

        @Override // io.reactivex.internal.operators.observable.ObservableSampleWithObservable.SampleMainObserver
        void run() {
            emit();
        }
    }

    /* loaded from: classes3.dex */
    static final class SampleMainEmitLast<T> extends SampleMainObserver<T> {
        private static final long serialVersionUID = -3029755663834015785L;
        volatile boolean done;
        final AtomicInteger wip;

        SampleMainEmitLast(Observer<? super T> actual, ObservableSource<?> other) {
            super(actual, other);
            this.wip = new AtomicInteger();
        }

        @Override // io.reactivex.internal.operators.observable.ObservableSampleWithObservable.SampleMainObserver
        void completeMain() {
            this.done = true;
            if (this.wip.getAndIncrement() == 0) {
                emit();
                this.actual.onComplete();
            }
        }

        @Override // io.reactivex.internal.operators.observable.ObservableSampleWithObservable.SampleMainObserver
        void completeOther() {
            this.done = true;
            if (this.wip.getAndIncrement() == 0) {
                emit();
                this.actual.onComplete();
            }
        }

        @Override // io.reactivex.internal.operators.observable.ObservableSampleWithObservable.SampleMainObserver
        void run() {
            if (this.wip.getAndIncrement() == 0) {
                do {
                    boolean d = this.done;
                    emit();
                    if (d) {
                        this.actual.onComplete();
                        return;
                    }
                } while (this.wip.decrementAndGet() != 0);
            }
        }
    }
}
