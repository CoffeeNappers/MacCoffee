package io.reactivex.internal.operators.observable;

import io.reactivex.Observable;
import io.reactivex.Observer;
import io.reactivex.annotations.Nullable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.observers.BasicQueueDisposable;
/* loaded from: classes3.dex */
public final class ObservableFromArray<T> extends Observable<T> {
    final T[] array;

    public ObservableFromArray(T[] array) {
        this.array = array;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> s) {
        FromArrayDisposable<T> d = new FromArrayDisposable<>(s, this.array);
        s.onSubscribe(d);
        if (!d.fusionMode) {
            d.run();
        }
    }

    /* loaded from: classes3.dex */
    static final class FromArrayDisposable<T> extends BasicQueueDisposable<T> {
        final Observer<? super T> actual;
        final T[] array;
        volatile boolean disposed;
        boolean fusionMode;
        int index;

        FromArrayDisposable(Observer<? super T> actual, T[] array) {
            this.actual = actual;
            this.array = array;
        }

        @Override // io.reactivex.internal.fuseable.QueueFuseable
        public int requestFusion(int mode) {
            if ((mode & 1) != 0) {
                this.fusionMode = true;
                return 1;
            }
            return 0;
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        @Nullable
        /* renamed from: poll */
        public T mo1188poll() {
            int i = this.index;
            T[] a = this.array;
            if (i != a.length) {
                this.index = i + 1;
                return (T) ObjectHelper.requireNonNull(a[i], "The array element is null");
            }
            return null;
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public boolean isEmpty() {
            return this.index == this.array.length;
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public void clear() {
            this.index = this.array.length;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.disposed = true;
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.disposed;
        }

        void run() {
            T[] a = this.array;
            int n = a.length;
            for (int i = 0; i < n && !isDisposed(); i++) {
                T value = a[i];
                if (value == null) {
                    this.actual.onError(new NullPointerException("The " + i + "th element is null"));
                    return;
                }
                this.actual.onNext(value);
            }
            if (!isDisposed()) {
                this.actual.onComplete();
            }
        }
    }
}
