package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.Scheduler;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes3.dex */
public final class ObservableTakeLastTimed<T> extends AbstractObservableWithUpstream<T, T> {
    final int bufferSize;
    final long count;
    final boolean delayError;
    final Scheduler scheduler;
    final long time;
    final TimeUnit unit;

    public ObservableTakeLastTimed(ObservableSource<T> source, long count, long time, TimeUnit unit, Scheduler scheduler, int bufferSize, boolean delayError) {
        super(source);
        this.count = count;
        this.time = time;
        this.unit = unit;
        this.scheduler = scheduler;
        this.bufferSize = bufferSize;
        this.delayError = delayError;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> t) {
        this.source.subscribe(new TakeLastTimedObserver(t, this.count, this.time, this.unit, this.scheduler, this.bufferSize, this.delayError));
    }

    /* loaded from: classes3.dex */
    static final class TakeLastTimedObserver<T> extends AtomicBoolean implements Observer<T>, Disposable {
        private static final long serialVersionUID = -5677354903406201275L;
        final Observer<? super T> actual;
        volatile boolean cancelled;
        final long count;
        Disposable d;
        final boolean delayError;
        Throwable error;
        final SpscLinkedArrayQueue<Object> queue;
        final Scheduler scheduler;
        final long time;
        final TimeUnit unit;

        TakeLastTimedObserver(Observer<? super T> actual, long count, long time, TimeUnit unit, Scheduler scheduler, int bufferSize, boolean delayError) {
            this.actual = actual;
            this.count = count;
            this.time = time;
            this.unit = unit;
            this.scheduler = scheduler;
            this.queue = new SpscLinkedArrayQueue<>(bufferSize);
            this.delayError = delayError;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.validate(this.d, d)) {
                this.d = d;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            SpscLinkedArrayQueue<Object> q = this.queue;
            long now = this.scheduler.now(this.unit);
            long time = this.time;
            long c = this.count;
            boolean unbounded = c == Long.MAX_VALUE;
            q.offer(Long.valueOf(now), t);
            while (!q.isEmpty()) {
                long ts = ((Long) q.peek()).longValue();
                if (ts <= now - time || (!unbounded && (q.size() >> 1) > c)) {
                    q.mo1188poll();
                    q.mo1188poll();
                } else {
                    return;
                }
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.error = t;
            drain();
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            drain();
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.d.dispose();
                if (compareAndSet(false, true)) {
                    this.queue.clear();
                }
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.cancelled;
        }

        void drain() {
            Throwable ex;
            if (compareAndSet(false, true)) {
                Observer<? super T> a = this.actual;
                SpscLinkedArrayQueue<Object> q = this.queue;
                boolean delayError = this.delayError;
                while (!this.cancelled) {
                    if (!delayError && (ex = this.error) != null) {
                        q.clear();
                        a.onError(ex);
                        return;
                    }
                    Object ts = q.mo1188poll();
                    boolean empty = ts == null;
                    if (empty) {
                        Throwable ex2 = this.error;
                        if (ex2 != null) {
                            a.onError(ex2);
                            return;
                        } else {
                            a.onComplete();
                            return;
                        }
                    }
                    Object mo1188poll = q.mo1188poll();
                    if (((Long) ts).longValue() >= this.scheduler.now(this.unit) - this.time) {
                        a.onNext(mo1188poll);
                    }
                }
                q.clear();
            }
        }
    }
}
