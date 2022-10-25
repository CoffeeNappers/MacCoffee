package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.annotations.Experimental;
import io.reactivex.annotations.Nullable;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Action;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.fuseable.QueueDisposable;
import io.reactivex.internal.observers.BasicIntQueueDisposable;
import io.reactivex.plugins.RxJavaPlugins;
@Experimental
/* loaded from: classes3.dex */
public final class ObservableDoFinally<T> extends AbstractObservableWithUpstream<T, T> {
    final Action onFinally;

    public ObservableDoFinally(ObservableSource<T> source, Action onFinally) {
        super(source);
        this.onFinally = onFinally;
    }

    @Override // io.reactivex.Observable
    protected void subscribeActual(Observer<? super T> s) {
        this.source.subscribe(new DoFinallyObserver(s, this.onFinally));
    }

    /* loaded from: classes3.dex */
    static final class DoFinallyObserver<T> extends BasicIntQueueDisposable<T> implements Observer<T> {
        private static final long serialVersionUID = 4109457741734051389L;
        final Observer<? super T> actual;
        Disposable d;
        final Action onFinally;
        QueueDisposable<T> qd;
        boolean syncFused;

        DoFinallyObserver(Observer<? super T> actual, Action onFinally) {
            this.actual = actual;
            this.onFinally = onFinally;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.validate(this.d, d)) {
                this.d = d;
                if (d instanceof QueueDisposable) {
                    this.qd = (QueueDisposable) d;
                }
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            this.actual.onNext(t);
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.actual.onError(t);
            runFinally();
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            this.actual.onComplete();
            runFinally();
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.d.dispose();
            runFinally();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.d.isDisposed();
        }

        @Override // io.reactivex.internal.fuseable.QueueFuseable
        public int requestFusion(int mode) {
            boolean z = true;
            QueueDisposable<T> qd = this.qd;
            if (qd == null || (mode & 4) != 0) {
                return 0;
            }
            int m = qd.requestFusion(mode);
            if (m != 0) {
                if (m != 1) {
                    z = false;
                }
                this.syncFused = z;
                return m;
            }
            return m;
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public void clear() {
            this.qd.clear();
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public boolean isEmpty() {
            return this.qd.isEmpty();
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        @Nullable
        /* renamed from: poll */
        public T mo1188poll() throws Exception {
            T v = this.qd.mo1188poll();
            if (v == null && this.syncFused) {
                runFinally();
            }
            return v;
        }

        void runFinally() {
            if (compareAndSet(0, 1)) {
                try {
                    this.onFinally.run();
                } catch (Throwable ex) {
                    Exceptions.throwIfFatal(ex);
                    RxJavaPlugins.onError(ex);
                }
            }
        }
    }
}
