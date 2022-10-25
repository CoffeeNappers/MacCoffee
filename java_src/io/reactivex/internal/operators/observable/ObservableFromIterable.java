package io.reactivex.internal.operators.observable;

import io.reactivex.Observable;
import io.reactivex.Observer;
import io.reactivex.annotations.Nullable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.observers.BasicQueueDisposable;
import java.util.Iterator;
/* loaded from: classes3.dex */
public final class ObservableFromIterable<T> extends Observable<T> {
    final Iterable<? extends T> source;

    public ObservableFromIterable(Iterable<? extends T> source) {
        this.source = source;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> s) {
        try {
            Iterator<? extends T> it = this.source.iterator();
            try {
                boolean hasNext = it.hasNext();
                if (!hasNext) {
                    EmptyDisposable.complete(s);
                    return;
                }
                FromIterableDisposable<T> d = new FromIterableDisposable<>(s, it);
                s.onSubscribe(d);
                if (!d.fusionMode) {
                    d.run();
                }
            } catch (Throwable e) {
                Exceptions.throwIfFatal(e);
                EmptyDisposable.error(e, s);
            }
        } catch (Throwable e2) {
            Exceptions.throwIfFatal(e2);
            EmptyDisposable.error(e2, s);
        }
    }

    /* loaded from: classes3.dex */
    static final class FromIterableDisposable<T> extends BasicQueueDisposable<T> {
        final Observer<? super T> actual;
        boolean checkNext;
        volatile boolean disposed;
        boolean done;
        boolean fusionMode;
        final Iterator<? extends T> it;

        FromIterableDisposable(Observer<? super T> actual, Iterator<? extends T> it) {
            this.actual = actual;
            this.it = it;
        }

        void run() {
            while (!isDisposed()) {
                try {
                    this.actual.onNext(ObjectHelper.requireNonNull(this.it.next(), "The iterator returned a null value"));
                    if (!isDisposed()) {
                        try {
                            boolean hasNext = this.it.hasNext();
                            if (!hasNext) {
                                if (!isDisposed()) {
                                    this.actual.onComplete();
                                    return;
                                }
                                return;
                            }
                        } catch (Throwable e) {
                            Exceptions.throwIfFatal(e);
                            this.actual.onError(e);
                            return;
                        }
                    } else {
                        return;
                    }
                } catch (Throwable e2) {
                    Exceptions.throwIfFatal(e2);
                    this.actual.onError(e2);
                    return;
                }
            }
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
            if (this.done) {
                return null;
            }
            if (this.checkNext) {
                if (!this.it.hasNext()) {
                    this.done = true;
                    return null;
                }
            } else {
                this.checkNext = true;
            }
            return (T) ObjectHelper.requireNonNull(this.it.next(), "The iterator returned a null value");
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public boolean isEmpty() {
            return this.done;
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public void clear() {
            this.done = true;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.disposed = true;
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.disposed;
        }
    }
}
