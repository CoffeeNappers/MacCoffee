package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.internal.functions.ObjectHelper;
import java.util.ArrayDeque;
import java.util.Collection;
import java.util.Iterator;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes3.dex */
public final class ObservableBuffer<T, U extends Collection<? super T>> extends AbstractObservableWithUpstream<T, U> {
    final Callable<U> bufferSupplier;
    final int count;
    final int skip;

    public ObservableBuffer(ObservableSource<T> source, int count, int skip, Callable<U> bufferSupplier) {
        super(source);
        this.count = count;
        this.skip = skip;
        this.bufferSupplier = bufferSupplier;
    }

    @Override // io.reactivex.Observable
    protected void subscribeActual(Observer<? super U> t) {
        if (this.skip == this.count) {
            BufferExactObserver<T, U> bes = new BufferExactObserver<>(t, this.count, this.bufferSupplier);
            if (bes.createBuffer()) {
                this.source.subscribe(bes);
                return;
            }
            return;
        }
        this.source.subscribe(new BufferSkipObserver(t, this.count, this.skip, this.bufferSupplier));
    }

    /* loaded from: classes3.dex */
    static final class BufferExactObserver<T, U extends Collection<? super T>> implements Observer<T>, Disposable {
        final Observer<? super U> actual;
        U buffer;
        final Callable<U> bufferSupplier;
        final int count;
        Disposable s;
        int size;

        BufferExactObserver(Observer<? super U> actual, int count, Callable<U> bufferSupplier) {
            this.actual = actual;
            this.count = count;
            this.bufferSupplier = bufferSupplier;
        }

        boolean createBuffer() {
            try {
                U b = (U) ObjectHelper.requireNonNull(this.bufferSupplier.call(), "Empty buffer supplied");
                this.buffer = b;
                return true;
            } catch (Throwable t) {
                Exceptions.throwIfFatal(t);
                this.buffer = null;
                if (this.s == null) {
                    EmptyDisposable.error(t, this.actual);
                } else {
                    this.s.dispose();
                    this.actual.onError(t);
                }
                return false;
            }
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
            U b = this.buffer;
            if (b != null) {
                b.add(t);
                int i = this.size + 1;
                this.size = i;
                if (i >= this.count) {
                    this.actual.onNext(b);
                    this.size = 0;
                    createBuffer();
                }
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.buffer = null;
            this.actual.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            U b = this.buffer;
            this.buffer = null;
            if (b != null && !b.isEmpty()) {
                this.actual.onNext(b);
            }
            this.actual.onComplete();
        }
    }

    /* loaded from: classes3.dex */
    static final class BufferSkipObserver<T, U extends Collection<? super T>> extends AtomicBoolean implements Observer<T>, Disposable {
        private static final long serialVersionUID = -8223395059921494546L;
        final Observer<? super U> actual;
        final Callable<U> bufferSupplier;
        final ArrayDeque<U> buffers = new ArrayDeque<>();
        final int count;
        long index;
        Disposable s;
        final int skip;

        BufferSkipObserver(Observer<? super U> actual, int count, int skip, Callable<U> bufferSupplier) {
            this.actual = actual;
            this.count = count;
            this.skip = skip;
            this.bufferSupplier = bufferSupplier;
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

        /* JADX WARN: Multi-variable type inference failed */
        @Override // io.reactivex.Observer
        public void onNext(T t) {
            long j = this.index;
            this.index = 1 + j;
            if (j % this.skip == 0) {
                try {
                    this.buffers.offer((Collection) ObjectHelper.requireNonNull(this.bufferSupplier.call(), "The bufferSupplier returned a null collection. Null values are generally not allowed in 2.x operators and sources."));
                } catch (Throwable e) {
                    this.buffers.clear();
                    this.s.dispose();
                    this.actual.onError(e);
                    return;
                }
            }
            Iterator<U> it = this.buffers.iterator();
            while (it.hasNext()) {
                U b = it.next();
                b.add(t);
                if (this.count <= b.size()) {
                    it.remove();
                    this.actual.onNext(b);
                }
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.buffers.clear();
            this.actual.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            while (!this.buffers.isEmpty()) {
                this.actual.onNext(this.buffers.poll());
            }
            this.actual.onComplete();
        }
    }
}
