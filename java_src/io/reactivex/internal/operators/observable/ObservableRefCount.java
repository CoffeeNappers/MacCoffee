package io.reactivex.internal.operators.observable;

import io.reactivex.Observer;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.disposables.Disposables;
import io.reactivex.functions.Consumer;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.observables.ConnectableObservable;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.locks.ReentrantLock;
/* loaded from: classes3.dex */
public final class ObservableRefCount<T> extends AbstractObservableWithUpstream<T, T> {
    volatile CompositeDisposable baseDisposable;
    final ReentrantLock lock;
    final ConnectableObservable<? extends T> source;
    final AtomicInteger subscriptionCount;

    /* JADX WARN: Multi-variable type inference failed */
    public ObservableRefCount(ConnectableObservable<T> source) {
        super(source);
        this.baseDisposable = new CompositeDisposable();
        this.subscriptionCount = new AtomicInteger();
        this.lock = new ReentrantLock();
        this.source = source;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> subscriber) {
        boolean z;
        this.lock.lock();
        if (this.subscriptionCount.incrementAndGet() == 1) {
            AtomicBoolean writeLocked = new AtomicBoolean(true);
            try {
                this.source.connect(onSubscribe(subscriber, writeLocked));
                if (z) {
                    return;
                }
                return;
            } finally {
                if (writeLocked.get()) {
                }
            }
        }
        try {
            doSubscribe(subscriber, this.baseDisposable);
        } finally {
            this.lock.unlock();
        }
    }

    private Consumer<Disposable> onSubscribe(Observer<? super T> observer, AtomicBoolean writeLocked) {
        return new DisposeConsumer(observer, writeLocked);
    }

    void doSubscribe(Observer<? super T> observer, CompositeDisposable currentBase) {
        Disposable d = disconnect(currentBase);
        ObservableRefCount<T>.ConnectionObserver s = new ConnectionObserver(observer, currentBase, d);
        observer.onSubscribe(s);
        this.source.subscribe(s);
    }

    private Disposable disconnect(CompositeDisposable current) {
        return Disposables.fromRunnable(new DisposeTask(current));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public final class ConnectionObserver extends AtomicReference<Disposable> implements Observer<T>, Disposable {
        private static final long serialVersionUID = 3813126992133394324L;
        final CompositeDisposable currentBase;
        final Disposable resource;
        final Observer<? super T> subscriber;

        ConnectionObserver(Observer<? super T> subscriber, CompositeDisposable currentBase, Disposable resource) {
            this.subscriber = subscriber;
            this.currentBase = currentBase;
            this.resource = resource;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            DisposableHelper.setOnce(this, s);
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable e) {
            cleanup();
            this.subscriber.onError(e);
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            this.subscriber.onNext(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            cleanup();
            this.subscriber.onComplete();
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            DisposableHelper.dispose(this);
            this.resource.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return DisposableHelper.isDisposed(get());
        }

        void cleanup() {
            ObservableRefCount.this.lock.lock();
            try {
                if (ObservableRefCount.this.baseDisposable == this.currentBase) {
                    if (ObservableRefCount.this.source instanceof Disposable) {
                        ((Disposable) ObservableRefCount.this.source).dispose();
                    }
                    ObservableRefCount.this.baseDisposable.dispose();
                    ObservableRefCount.this.baseDisposable = new CompositeDisposable();
                    ObservableRefCount.this.subscriptionCount.set(0);
                }
            } finally {
                ObservableRefCount.this.lock.unlock();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public final class DisposeConsumer implements Consumer<Disposable> {
        private final Observer<? super T> observer;
        private final AtomicBoolean writeLocked;

        DisposeConsumer(Observer<? super T> observer, AtomicBoolean writeLocked) {
            this.observer = observer;
            this.writeLocked = writeLocked;
        }

        @Override // io.reactivex.functions.Consumer
        public void accept(Disposable subscription) {
            try {
                ObservableRefCount.this.baseDisposable.add(subscription);
                ObservableRefCount.this.doSubscribe(this.observer, ObservableRefCount.this.baseDisposable);
            } finally {
                ObservableRefCount.this.lock.unlock();
                this.writeLocked.set(false);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public final class DisposeTask implements Runnable {
        private final CompositeDisposable current;

        DisposeTask(CompositeDisposable current) {
            this.current = current;
        }

        @Override // java.lang.Runnable
        public void run() {
            ObservableRefCount.this.lock.lock();
            try {
                if (ObservableRefCount.this.baseDisposable == this.current && ObservableRefCount.this.subscriptionCount.decrementAndGet() == 0) {
                    if (ObservableRefCount.this.source instanceof Disposable) {
                        ((Disposable) ObservableRefCount.this.source).dispose();
                    }
                    ObservableRefCount.this.baseDisposable.dispose();
                    ObservableRefCount.this.baseDisposable = new CompositeDisposable();
                }
            } finally {
                ObservableRefCount.this.lock.unlock();
            }
        }
    }
}
