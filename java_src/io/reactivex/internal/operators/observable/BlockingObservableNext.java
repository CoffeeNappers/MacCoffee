package io.reactivex.internal.operators.observable;

import io.reactivex.Notification;
import io.reactivex.ObservableSource;
import io.reactivex.internal.util.BlockingHelper;
import io.reactivex.internal.util.ExceptionHelper;
import io.reactivex.observers.DisposableObserver;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes3.dex */
public final class BlockingObservableNext<T> implements Iterable<T> {
    final ObservableSource<T> source;

    public BlockingObservableNext(ObservableSource<T> source) {
        this.source = source;
    }

    @Override // java.lang.Iterable
    public Iterator<T> iterator() {
        NextObserver<T> nextObserver = new NextObserver<>();
        return new NextIterator(this.source, nextObserver);
    }

    /* loaded from: classes3.dex */
    static final class NextIterator<T> implements Iterator<T> {
        private Throwable error;
        private boolean hasNext = true;
        private boolean isNextConsumed = true;
        private final ObservableSource<T> items;
        private T next;
        private final NextObserver<T> observer;
        private boolean started;

        NextIterator(ObservableSource<T> items, NextObserver<T> observer) {
            this.items = items;
            this.observer = observer;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            if (this.error != null) {
                throw ExceptionHelper.wrapOrThrow(this.error);
            }
            if (!this.hasNext) {
                return false;
            }
            return !this.isNextConsumed || moveToNext();
        }

        private boolean moveToNext() {
            if (!this.started) {
                this.started = true;
                this.observer.setWaiting();
                new ObservableMaterialize(this.items).subscribe(this.observer);
            }
            try {
                Notification<T> nextNotification = this.observer.takeNext();
                if (nextNotification.isOnNext()) {
                    this.isNextConsumed = false;
                    this.next = nextNotification.getValue();
                    return true;
                }
                this.hasNext = false;
                if (nextNotification.isOnComplete()) {
                    return false;
                }
                this.error = nextNotification.getError();
                throw ExceptionHelper.wrapOrThrow(this.error);
            } catch (InterruptedException e) {
                this.observer.dispose();
                this.error = e;
                throw ExceptionHelper.wrapOrThrow(e);
            }
        }

        @Override // java.util.Iterator
        public T next() {
            if (this.error != null) {
                throw ExceptionHelper.wrapOrThrow(this.error);
            }
            if (hasNext()) {
                this.isNextConsumed = true;
                return this.next;
            }
            throw new NoSuchElementException("No more elements");
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new UnsupportedOperationException("Read only iterator");
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class NextObserver<T> extends DisposableObserver<Notification<T>> {
        private final BlockingQueue<Notification<T>> buf = new ArrayBlockingQueue(1);
        final AtomicInteger waiting = new AtomicInteger();

        NextObserver() {
        }

        @Override // io.reactivex.Observer
        public /* bridge */ /* synthetic */ void onNext(Object x0) {
            onNext((Notification) ((Notification) x0));
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable e) {
            RxJavaPlugins.onError(e);
        }

        public void onNext(Notification<T> args) {
            if (this.waiting.getAndSet(0) == 1 || !args.isOnNext()) {
                Notification<T> toOffer = args;
                while (!this.buf.offer(toOffer)) {
                    Notification<T> concurrentItem = this.buf.poll();
                    if (concurrentItem != null && !concurrentItem.isOnNext()) {
                        toOffer = concurrentItem;
                    }
                }
            }
        }

        public Notification<T> takeNext() throws InterruptedException {
            setWaiting();
            BlockingHelper.verifyNonBlocking();
            return this.buf.take();
        }

        void setWaiting() {
            this.waiting.set(1);
        }
    }
}