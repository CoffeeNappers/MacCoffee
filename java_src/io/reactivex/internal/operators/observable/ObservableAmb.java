package io.reactivex.internal.operators.observable;

import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class ObservableAmb<T> extends Observable<T> {
    final ObservableSource<? extends T>[] sources;
    final Iterable<? extends ObservableSource<? extends T>> sourcesIterable;

    public ObservableAmb(ObservableSource<? extends T>[] sources, Iterable<? extends ObservableSource<? extends T>> sourcesIterable) {
        this.sources = sources;
        this.sourcesIterable = sourcesIterable;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> s) {
        int count;
        ObservableSource<? extends T>[] sources = this.sources;
        int count2 = 0;
        if (sources == null) {
            sources = new Observable[8];
            try {
                Iterator i$ = this.sourcesIterable.iterator();
                while (true) {
                    try {
                        int count3 = count2;
                        if (!i$.hasNext()) {
                            count = count3;
                            break;
                        }
                        ObservableSource<? extends T> p = i$.next();
                        if (p == null) {
                            EmptyDisposable.error(new NullPointerException("One of the sources is null"), s);
                            return;
                        }
                        if (count3 == sources.length) {
                            ObservableSource<? extends T>[] b = new ObservableSource[(count3 >> 2) + count3];
                            System.arraycopy(sources, 0, b, 0, count3);
                            sources = b;
                        }
                        count2 = count3 + 1;
                        sources[count3] = p;
                    } catch (Throwable th) {
                        e = th;
                        Exceptions.throwIfFatal(e);
                        EmptyDisposable.error(e, s);
                        return;
                    }
                }
            } catch (Throwable th2) {
                e = th2;
            }
        } else {
            count = sources.length;
        }
        if (count == 0) {
            EmptyDisposable.complete(s);
        } else if (count == 1) {
            sources[0].subscribe(s);
        } else {
            AmbCoordinator<T> ac = new AmbCoordinator<>(s, count);
            ac.subscribe(sources);
        }
    }

    /* loaded from: classes3.dex */
    static final class AmbCoordinator<T> implements Disposable {
        final Observer<? super T> actual;
        final AmbInnerObserver<T>[] observers;
        final AtomicInteger winner = new AtomicInteger();

        AmbCoordinator(Observer<? super T> actual, int count) {
            this.actual = actual;
            this.observers = new AmbInnerObserver[count];
        }

        public void subscribe(ObservableSource<? extends T>[] sources) {
            AmbInnerObserver<T>[] as = this.observers;
            int len = as.length;
            for (int i = 0; i < len; i++) {
                as[i] = new AmbInnerObserver<>(this, i + 1, this.actual);
            }
            this.winner.lazySet(0);
            this.actual.onSubscribe(this);
            for (int i2 = 0; i2 < len && this.winner.get() == 0; i2++) {
                sources[i2].subscribe(as[i2]);
            }
        }

        public boolean win(int index) {
            int w = this.winner.get();
            if (w != 0) {
                return w == index;
            } else if (!this.winner.compareAndSet(0, index)) {
                return false;
            } else {
                AmbInnerObserver<T>[] a = this.observers;
                int n = a.length;
                for (int i = 0; i < n; i++) {
                    if (i + 1 != index) {
                        a[i].dispose();
                    }
                }
                return true;
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            if (this.winner.get() != -1) {
                this.winner.lazySet(-1);
                AmbInnerObserver<T>[] arr$ = this.observers;
                for (AmbInnerObserver<T> a : arr$) {
                    a.dispose();
                }
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.winner.get() == -1;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class AmbInnerObserver<T> extends AtomicReference<Disposable> implements Observer<T> {
        private static final long serialVersionUID = -1185974347409665484L;
        final Observer<? super T> actual;
        final int index;
        final AmbCoordinator<T> parent;
        boolean won;

        AmbInnerObserver(AmbCoordinator<T> parent, int index, Observer<? super T> actual) {
            this.parent = parent;
            this.index = index;
            this.actual = actual;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            DisposableHelper.setOnce(this, s);
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            if (this.won) {
                this.actual.onNext(t);
            } else if (this.parent.win(this.index)) {
                this.won = true;
                this.actual.onNext(t);
            } else {
                get().dispose();
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            if (this.won) {
                this.actual.onError(t);
            } else if (this.parent.win(this.index)) {
                this.won = true;
                this.actual.onError(t);
            } else {
                RxJavaPlugins.onError(t);
            }
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            if (this.won) {
                this.actual.onComplete();
            } else if (this.parent.win(this.index)) {
                this.won = true;
                this.actual.onComplete();
            }
        }

        public void dispose() {
            DisposableHelper.dispose(this);
        }
    }
}
