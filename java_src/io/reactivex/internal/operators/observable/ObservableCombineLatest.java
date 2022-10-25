package io.reactivex.internal.operators.observable;

import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class ObservableCombineLatest<T, R> extends Observable<R> {
    final int bufferSize;
    final Function<? super Object[], ? extends R> combiner;
    final boolean delayError;
    final ObservableSource<? extends T>[] sources;
    final Iterable<? extends ObservableSource<? extends T>> sourcesIterable;

    public ObservableCombineLatest(ObservableSource<? extends T>[] sources, Iterable<? extends ObservableSource<? extends T>> sourcesIterable, Function<? super Object[], ? extends R> combiner, int bufferSize, boolean delayError) {
        this.sources = sources;
        this.sourcesIterable = sourcesIterable;
        this.combiner = combiner;
        this.bufferSize = bufferSize;
        this.delayError = delayError;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super R> s) {
        ObservableSource<? extends T>[] sources = this.sources;
        int count = 0;
        if (sources == null) {
            sources = new Observable[8];
            for (ObservableSource<? extends T> p : this.sourcesIterable) {
                if (count == sources.length) {
                    ObservableSource<? extends T>[] b = new ObservableSource[(count >> 2) + count];
                    System.arraycopy(sources, 0, b, 0, count);
                    sources = b;
                }
                sources[count] = p;
                count++;
            }
        } else {
            count = sources.length;
        }
        if (count == 0) {
            EmptyDisposable.complete(s);
            return;
        }
        LatestCoordinator<T, R> lc = new LatestCoordinator<>(s, this.combiner, count, this.bufferSize, this.delayError);
        lc.subscribe(sources);
    }

    /* loaded from: classes3.dex */
    static final class LatestCoordinator<T, R> extends AtomicInteger implements Disposable {
        private static final long serialVersionUID = 8567835998786448817L;
        int active;
        final Observer<? super R> actual;
        volatile boolean cancelled;
        final Function<? super Object[], ? extends R> combiner;
        int complete;
        final boolean delayError;
        volatile boolean done;
        final AtomicThrowable errors = new AtomicThrowable();
        final T[] latest;
        final CombinerObserver<T, R>[] observers;
        final SpscLinkedArrayQueue<Object> queue;

        LatestCoordinator(Observer<? super R> actual, Function<? super Object[], ? extends R> combiner, int count, int bufferSize, boolean delayError) {
            this.actual = actual;
            this.combiner = combiner;
            this.delayError = delayError;
            this.latest = (T[]) new Object[count];
            this.observers = new CombinerObserver[count];
            this.queue = new SpscLinkedArrayQueue<>(bufferSize);
        }

        public void subscribe(ObservableSource<? extends T>[] sources) {
            CombinerObserver<T, R>[] combinerObserverArr = this.observers;
            int len = combinerObserverArr.length;
            for (int i = 0; i < len; i++) {
                combinerObserverArr[i] = new CombinerObserver<>(this, i);
            }
            lazySet(0);
            this.actual.onSubscribe(this);
            for (int i2 = 0; i2 < len && !this.done && !this.cancelled; i2++) {
                sources[i2].subscribe(combinerObserverArr[i2]);
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            if (!this.cancelled) {
                this.cancelled = true;
                cancelSources();
                if (getAndIncrement() == 0) {
                    clear(this.queue);
                }
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.cancelled;
        }

        void cancel(SpscLinkedArrayQueue<?> q) {
            clear(q);
            cancelSources();
        }

        void cancelSources() {
            CombinerObserver<T, R>[] arr$ = this.observers;
            for (CombinerObserver<T, R> s : arr$) {
                s.dispose();
            }
        }

        void clear(SpscLinkedArrayQueue<?> q) {
            synchronized (this) {
                Arrays.fill(this.latest, (Object) null);
            }
            q.clear();
        }

        void combine(T value, int index) {
            boolean empty = false;
            CombinerObserver<T, R> cs = this.observers[index];
            synchronized (this) {
                if (!this.cancelled) {
                    int len = this.latest.length;
                    T o = this.latest[index];
                    int a = this.active;
                    if (o == null) {
                        a++;
                        this.active = a;
                    }
                    int c = this.complete;
                    if (value == null) {
                        c++;
                        this.complete = c;
                    } else {
                        this.latest[index] = value;
                    }
                    boolean f = a == len;
                    if (c == len || (value == null && o == null)) {
                        empty = true;
                    }
                    if (!empty) {
                        if (value != null && f) {
                            this.queue.offer(cs, this.latest.clone());
                        } else if (value == null && this.errors.get() != null) {
                            this.done = true;
                        }
                    } else {
                        this.done = true;
                    }
                    if (f || value == null) {
                        drain();
                    }
                }
            }
        }

        void drain() {
            if (getAndIncrement() == 0) {
                SpscLinkedArrayQueue<Object> q = this.queue;
                Observer<? super R> a = this.actual;
                boolean delayError = this.delayError;
                int missed = 1;
                while (!checkTerminated(this.done, q.isEmpty(), a, q, delayError)) {
                    while (true) {
                        boolean d = this.done;
                        CombinerObserver<T, R> cs = (CombinerObserver) q.mo1188poll();
                        boolean empty = cs == null;
                        if (!checkTerminated(d, empty, a, q, delayError)) {
                            if (!empty) {
                                try {
                                    a.onNext((Object) ObjectHelper.requireNonNull(this.combiner.mo1190apply((Object[]) q.mo1188poll()), "The combiner returned a null"));
                                } catch (Throwable ex) {
                                    Exceptions.throwIfFatal(ex);
                                    this.cancelled = true;
                                    cancel(q);
                                    a.onError(ex);
                                    return;
                                }
                            } else {
                                missed = addAndGet(-missed);
                                if (missed == 0) {
                                    return;
                                }
                            }
                        } else {
                            return;
                        }
                    }
                }
            }
        }

        boolean checkTerminated(boolean d, boolean empty, Observer<?> a, SpscLinkedArrayQueue<?> q, boolean delayError) {
            if (this.cancelled) {
                cancel(q);
                return true;
            }
            if (d) {
                if (delayError) {
                    if (empty) {
                        cancel(q);
                        Throwable e = this.errors.terminate();
                        if (e != null) {
                            a.onError(e);
                            return true;
                        }
                        a.onComplete();
                        return true;
                    }
                } else if (this.errors.get() != null) {
                    cancel(q);
                    a.onError(this.errors.terminate());
                    return true;
                } else if (empty) {
                    clear(this.queue);
                    a.onComplete();
                    return true;
                }
            }
            return false;
        }

        void onError(Throwable e) {
            if (!this.errors.addThrowable(e)) {
                RxJavaPlugins.onError(e);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class CombinerObserver<T, R> implements Observer<T> {
        final int index;
        final LatestCoordinator<T, R> parent;
        final AtomicReference<Disposable> s = new AtomicReference<>();

        CombinerObserver(LatestCoordinator<T, R> parent, int index) {
            this.parent = parent;
            this.index = index;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            DisposableHelper.setOnce(this.s, s);
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            this.parent.combine(t, this.index);
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.parent.onError(t);
            this.parent.combine(null, this.index);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            this.parent.combine(null, this.index);
        }

        public void dispose() {
            DisposableHelper.dispose(this.s);
        }
    }
}
