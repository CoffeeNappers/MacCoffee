package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.Notification;
import io.reactivex.internal.util.BlockingHelper;
import io.reactivex.internal.util.ExceptionHelper;
import io.reactivex.plugins.RxJavaPlugins;
import io.reactivex.subscribers.DisposableSubscriber;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.atomic.AtomicInteger;
import org.reactivestreams.Publisher;
/* loaded from: classes3.dex */
public final class BlockingFlowableNext<T> implements Iterable<T> {
    final Publisher<? extends T> source;

    public BlockingFlowableNext(Publisher<? extends T> source) {
        this.source = source;
    }

    @Override // java.lang.Iterable
    public Iterator<T> iterator() {
        NextSubscriber<T> nextSubscriber = new NextSubscriber<>();
        return new NextIterator(this.source, nextSubscriber);
    }

    /* loaded from: classes3.dex */
    static final class NextIterator<T> implements Iterator<T> {
        private Throwable error;
        private boolean hasNext = true;
        private boolean isNextConsumed = true;
        private final Publisher<? extends T> items;
        private T next;
        private final NextSubscriber<T> observer;
        private boolean started;

        NextIterator(Publisher<? extends T> items, NextSubscriber<T> observer) {
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
            try {
                if (!this.started) {
                    this.started = true;
                    this.observer.setWaiting();
                    Flowable.fromPublisher(this.items).materialize().subscribe((FlowableSubscriber<? super Notification<T>>) this.observer);
                }
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
                if (nextNotification.isOnError()) {
                    this.error = nextNotification.getError();
                    throw ExceptionHelper.wrapOrThrow(this.error);
                }
                throw new IllegalStateException("Should not reach here");
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
    public static final class NextSubscriber<T> extends DisposableSubscriber<Notification<T>> {
        private final BlockingQueue<Notification<T>> buf = new ArrayBlockingQueue(1);
        final AtomicInteger waiting = new AtomicInteger();

        NextSubscriber() {
        }

        @Override // org.reactivestreams.Subscriber
        public /* bridge */ /* synthetic */ void onNext(Object x0) {
            onNext((Notification) ((Notification) x0));
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
        }

        @Override // org.reactivestreams.Subscriber
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
