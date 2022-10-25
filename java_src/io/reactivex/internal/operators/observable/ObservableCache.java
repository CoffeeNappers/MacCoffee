package io.reactivex.internal.operators.observable;

import io.reactivex.Observable;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.SequentialDisposable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.util.LinkedArrayList;
import io.reactivex.internal.util.NotificationLite;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class ObservableCache<T> extends AbstractObservableWithUpstream<T, T> {
    final AtomicBoolean once;
    final CacheState<T> state;

    public static <T> Observable<T> from(Observable<T> source) {
        return from(source, 16);
    }

    public static <T> Observable<T> from(Observable<T> source, int capacityHint) {
        ObjectHelper.verifyPositive(capacityHint, "capacityHint");
        CacheState<T> state = new CacheState<>(source, capacityHint);
        return RxJavaPlugins.onAssembly(new ObservableCache(source, state));
    }

    private ObservableCache(Observable<T> source, CacheState<T> state) {
        super(source);
        this.state = state;
        this.once = new AtomicBoolean();
    }

    @Override // io.reactivex.Observable
    protected void subscribeActual(Observer<? super T> t) {
        ReplayDisposable<T> rp = new ReplayDisposable<>(t, this.state);
        t.onSubscribe(rp);
        this.state.addChild(rp);
        if (!this.once.get() && this.once.compareAndSet(false, true)) {
            this.state.connect();
        }
        rp.replay();
    }

    boolean isConnected() {
        return this.state.isConnected;
    }

    boolean hasObservers() {
        return this.state.observers.get().length != 0;
    }

    int cachedEventCount() {
        return this.state.size();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class CacheState<T> extends LinkedArrayList implements Observer<T> {
        static final ReplayDisposable[] EMPTY = new ReplayDisposable[0];
        static final ReplayDisposable[] TERMINATED = new ReplayDisposable[0];
        final SequentialDisposable connection;
        volatile boolean isConnected;
        final AtomicReference<ReplayDisposable<T>[]> observers;
        final Observable<? extends T> source;
        boolean sourceDone;

        CacheState(Observable<? extends T> source, int capacityHint) {
            super(capacityHint);
            this.source = source;
            this.observers = new AtomicReference<>(EMPTY);
            this.connection = new SequentialDisposable();
        }

        public boolean addChild(ReplayDisposable<T> p) {
            ReplayDisposable<T>[] a;
            ReplayDisposable<T>[] b;
            do {
                a = this.observers.get();
                if (a == TERMINATED) {
                    return false;
                }
                int n = a.length;
                b = new ReplayDisposable[n + 1];
                System.arraycopy(a, 0, b, 0, n);
                b[n] = p;
            } while (!this.observers.compareAndSet(a, b));
            return true;
        }

        public void removeChild(ReplayDisposable<T> p) {
            ReplayDisposable<T>[] a;
            ReplayDisposable<T>[] b;
            do {
                a = this.observers.get();
                int n = a.length;
                if (n != 0) {
                    int j = -1;
                    int i = 0;
                    while (true) {
                        if (i >= n) {
                            break;
                        } else if (!a[i].equals(p)) {
                            i++;
                        } else {
                            j = i;
                            break;
                        }
                    }
                    if (j >= 0) {
                        if (n == 1) {
                            b = EMPTY;
                        } else {
                            b = new ReplayDisposable[n - 1];
                            System.arraycopy(a, 0, b, 0, j);
                            System.arraycopy(a, j + 1, b, j, (n - j) - 1);
                        }
                    } else {
                        return;
                    }
                } else {
                    return;
                }
            } while (!this.observers.compareAndSet(a, b));
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            this.connection.update(s);
        }

        public void connect() {
            this.source.subscribe(this);
            this.isConnected = true;
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            if (!this.sourceDone) {
                Object o = NotificationLite.next(t);
                add(o);
                ReplayDisposable[] arr$ = this.observers.get();
                for (ReplayDisposable<?> rp : arr$) {
                    rp.replay();
                }
            }
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable e) {
            if (!this.sourceDone) {
                this.sourceDone = true;
                Object o = NotificationLite.error(e);
                add(o);
                this.connection.dispose();
                ReplayDisposable[] arr$ = this.observers.getAndSet(TERMINATED);
                for (ReplayDisposable<?> rp : arr$) {
                    rp.replay();
                }
            }
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            if (!this.sourceDone) {
                this.sourceDone = true;
                Object o = NotificationLite.complete();
                add(o);
                this.connection.dispose();
                ReplayDisposable[] arr$ = this.observers.getAndSet(TERMINATED);
                for (ReplayDisposable<?> rp : arr$) {
                    rp.replay();
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class ReplayDisposable<T> extends AtomicInteger implements Disposable {
        private static final long serialVersionUID = 7058506693698832024L;
        volatile boolean cancelled;
        final Observer<? super T> child;
        Object[] currentBuffer;
        int currentIndexInBuffer;
        int index;
        final CacheState<T> state;

        ReplayDisposable(Observer<? super T> child, CacheState<T> state) {
            this.child = child;
            this.state = state;
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.cancelled;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.state.removeChild(this);
            }
        }

        public void replay() {
            if (getAndIncrement() == 0) {
                Observer<? super T> child = this.child;
                int missed = 1;
                while (!this.cancelled) {
                    int s = this.state.size();
                    if (s != 0) {
                        Object[] b = this.currentBuffer;
                        if (b == null) {
                            b = this.state.head();
                            this.currentBuffer = b;
                        }
                        int n = b.length - 1;
                        int j = this.index;
                        int k = this.currentIndexInBuffer;
                        while (j < s) {
                            if (!this.cancelled) {
                                if (k == n) {
                                    b = (Object[]) b[n];
                                    k = 0;
                                }
                                Object o = b[k];
                                if (!NotificationLite.accept(o, child)) {
                                    k++;
                                    j++;
                                } else {
                                    return;
                                }
                            } else {
                                return;
                            }
                        }
                        if (!this.cancelled) {
                            this.index = j;
                            this.currentIndexInBuffer = k;
                            this.currentBuffer = b;
                        } else {
                            return;
                        }
                    }
                    missed = addAndGet(-missed);
                    if (missed == 0) {
                        return;
                    }
                }
            }
        }
    }
}
