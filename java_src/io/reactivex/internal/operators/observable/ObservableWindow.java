package io.reactivex.internal.operators.observable;

import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.subjects.UnicastSubject;
import java.util.ArrayDeque;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes3.dex */
public final class ObservableWindow<T> extends AbstractObservableWithUpstream<T, Observable<T>> {
    final int capacityHint;
    final long count;
    final long skip;

    public ObservableWindow(ObservableSource<T> source, long count, long skip, int capacityHint) {
        super(source);
        this.count = count;
        this.skip = skip;
        this.capacityHint = capacityHint;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super Observable<T>> t) {
        if (this.count == this.skip) {
            this.source.subscribe(new WindowExactObserver(t, this.count, this.capacityHint));
        } else {
            this.source.subscribe(new WindowSkipObserver(t, this.count, this.skip, this.capacityHint));
        }
    }

    /* loaded from: classes3.dex */
    static final class WindowExactObserver<T> extends AtomicInteger implements Observer<T>, Disposable, Runnable {
        private static final long serialVersionUID = -7481782523886138128L;
        final Observer<? super Observable<T>> actual;
        volatile boolean cancelled;
        final int capacityHint;
        final long count;
        Disposable s;
        long size;
        UnicastSubject<T> window;

        WindowExactObserver(Observer<? super Observable<T>> actual, long count, int capacityHint) {
            this.actual = actual;
            this.count = count;
            this.capacityHint = capacityHint;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            UnicastSubject<T> w = this.window;
            if (w == null && !this.cancelled) {
                w = UnicastSubject.create(this.capacityHint, this);
                this.window = w;
                this.actual.onNext(w);
            }
            if (w != null) {
                w.onNext(t);
                long j = this.size + 1;
                this.size = j;
                if (j >= this.count) {
                    this.size = 0L;
                    this.window = null;
                    w.onComplete();
                    if (this.cancelled) {
                        this.s.dispose();
                    }
                }
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            UnicastSubject<T> w = this.window;
            if (w != null) {
                this.window = null;
                w.onError(t);
            }
            this.actual.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            UnicastSubject<T> w = this.window;
            if (w != null) {
                this.window = null;
                w.onComplete();
            }
            this.actual.onComplete();
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.cancelled = true;
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.cancelled;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.cancelled) {
                this.s.dispose();
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class WindowSkipObserver<T> extends AtomicBoolean implements Observer<T>, Disposable, Runnable {
        private static final long serialVersionUID = 3366976432059579510L;
        final Observer<? super Observable<T>> actual;
        volatile boolean cancelled;
        final int capacityHint;
        final long count;
        long firstEmission;
        long index;
        Disposable s;
        final long skip;
        final AtomicInteger wip = new AtomicInteger();
        final ArrayDeque<UnicastSubject<T>> windows = new ArrayDeque<>();

        WindowSkipObserver(Observer<? super Observable<T>> actual, long count, long skip, int capacityHint) {
            this.actual = actual;
            this.count = count;
            this.skip = skip;
            this.capacityHint = capacityHint;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            ArrayDeque<UnicastSubject<T>> ws = this.windows;
            long i = this.index;
            long s = this.skip;
            if (i % s == 0 && !this.cancelled) {
                this.wip.getAndIncrement();
                UnicastSubject<T> w = UnicastSubject.create(this.capacityHint, this);
                ws.offer(w);
                this.actual.onNext(w);
            }
            long c = this.firstEmission + 1;
            Iterator i$ = ws.iterator();
            while (i$.hasNext()) {
                i$.next().onNext(t);
            }
            if (c >= this.count) {
                ws.poll().onComplete();
                if (ws.isEmpty() && this.cancelled) {
                    this.s.dispose();
                    return;
                }
                this.firstEmission = c - s;
            } else {
                this.firstEmission = c;
            }
            this.index = 1 + i;
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            ArrayDeque<UnicastSubject<T>> ws = this.windows;
            while (!ws.isEmpty()) {
                ws.poll().onError(t);
            }
            this.actual.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            ArrayDeque<UnicastSubject<T>> ws = this.windows;
            while (!ws.isEmpty()) {
                ws.poll().onComplete();
            }
            this.actual.onComplete();
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.cancelled = true;
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.cancelled;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.wip.decrementAndGet() == 0 && this.cancelled) {
                this.s.dispose();
            }
        }
    }
}
