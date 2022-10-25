package io.fabric.sdk.android.services.concurrency;

import io.fabric.sdk.android.services.concurrency.Dependency;
import io.fabric.sdk.android.services.concurrency.PriorityProvider;
import io.fabric.sdk.android.services.concurrency.Task;
import java.lang.reflect.Array;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Queue;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;
/* loaded from: classes3.dex */
public class DependencyPriorityBlockingQueue<E extends Dependency & Task & PriorityProvider> extends PriorityBlockingQueue<E> {
    static final int PEEK = 1;
    static final int POLL = 2;
    static final int POLL_WITH_TIMEOUT = 3;
    static final int TAKE = 0;
    final Queue<E> blockedQueue = new LinkedList();
    private final ReentrantLock lock = new ReentrantLock();

    @Override // java.util.concurrent.PriorityBlockingQueue, java.util.concurrent.BlockingQueue
    /* renamed from: take */
    public E mo1155take() throws InterruptedException {
        return get(0, null, null);
    }

    @Override // java.util.concurrent.PriorityBlockingQueue, java.util.Queue
    /* renamed from: peek */
    public E mo1152peek() {
        try {
            return get(1, null, null);
        } catch (InterruptedException e) {
            return null;
        }
    }

    @Override // java.util.concurrent.PriorityBlockingQueue, java.util.concurrent.BlockingQueue
    /* renamed from: poll */
    public E mo1154poll(long timeout, TimeUnit unit) throws InterruptedException {
        return get(3, Long.valueOf(timeout), unit);
    }

    @Override // java.util.concurrent.PriorityBlockingQueue, java.util.Queue
    /* renamed from: poll */
    public E mo1153poll() {
        try {
            return get(2, null, null);
        } catch (InterruptedException e) {
            return null;
        }
    }

    @Override // java.util.concurrent.PriorityBlockingQueue, java.util.AbstractCollection, java.util.Collection
    public int size() {
        try {
            this.lock.lock();
            return this.blockedQueue.size() + super.size();
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.concurrent.PriorityBlockingQueue, java.util.AbstractCollection, java.util.Collection
    public <T> T[] toArray(T[] a) {
        try {
            this.lock.lock();
            return (T[]) concatenate(super.toArray(a), this.blockedQueue.toArray(a));
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.concurrent.PriorityBlockingQueue, java.util.AbstractCollection, java.util.Collection
    public Object[] toArray() {
        try {
            this.lock.lock();
            return concatenate(super.toArray(), this.blockedQueue.toArray());
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.concurrent.PriorityBlockingQueue, java.util.concurrent.BlockingQueue
    public int drainTo(Collection<? super E> c) {
        try {
            this.lock.lock();
            int numberOfItems = super.drainTo(c) + this.blockedQueue.size();
            while (!this.blockedQueue.isEmpty()) {
                c.add(this.blockedQueue.poll());
            }
            return numberOfItems;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.concurrent.PriorityBlockingQueue, java.util.concurrent.BlockingQueue
    public int drainTo(Collection<? super E> c, int maxElements) {
        try {
            this.lock.lock();
            int numberOfItems = super.drainTo(c, maxElements);
            while (!this.blockedQueue.isEmpty() && numberOfItems <= maxElements) {
                c.add(this.blockedQueue.poll());
                numberOfItems++;
            }
            return numberOfItems;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.concurrent.PriorityBlockingQueue, java.util.AbstractCollection, java.util.Collection, java.util.concurrent.BlockingQueue
    public boolean contains(Object o) {
        boolean z;
        try {
            this.lock.lock();
            if (!super.contains(o)) {
                if (!this.blockedQueue.contains(o)) {
                    z = false;
                    return z;
                }
            }
            z = true;
            return z;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.concurrent.PriorityBlockingQueue, java.util.AbstractQueue, java.util.AbstractCollection, java.util.Collection
    public void clear() {
        try {
            this.lock.lock();
            this.blockedQueue.clear();
            super.clear();
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.concurrent.PriorityBlockingQueue, java.util.AbstractCollection, java.util.Collection, java.util.concurrent.BlockingQueue
    public boolean remove(Object o) {
        boolean z;
        try {
            this.lock.lock();
            if (!super.remove(o)) {
                if (!this.blockedQueue.remove(o)) {
                    z = false;
                    return z;
                }
            }
            z = true;
            return z;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public boolean removeAll(Collection<?> collection) {
        try {
            this.lock.lock();
            return super.removeAll(collection) | this.blockedQueue.removeAll(collection);
        } finally {
            this.lock.unlock();
        }
    }

    E performOperation(int operation, Long time, TimeUnit unit) throws InterruptedException {
        switch (operation) {
            case 0:
                return (E) ((Dependency) super.take());
            case 1:
                return (E) ((Dependency) super.peek());
            case 2:
                return (E) ((Dependency) super.poll());
            case 3:
                return (E) ((Dependency) super.poll(time.longValue(), unit));
            default:
                return null;
        }
    }

    boolean offerBlockedResult(int operation, E result) {
        try {
            this.lock.lock();
            if (operation == 1) {
                super.remove(result);
            }
            return this.blockedQueue.offer(result);
        } finally {
            this.lock.unlock();
        }
    }

    E get(int operation, Long time, TimeUnit unit) throws InterruptedException {
        E result;
        while (true) {
            result = performOperation(operation, time, unit);
            if (result == null || canProcess(result)) {
                break;
            }
            offerBlockedResult(operation, result);
        }
        return result;
    }

    boolean canProcess(E result) {
        return result.areDependenciesMet();
    }

    public void recycleBlockedQueue() {
        try {
            this.lock.lock();
            Iterator<E> iterator = this.blockedQueue.iterator();
            while (iterator.hasNext()) {
                E blockedItem = iterator.next();
                if (canProcess(blockedItem)) {
                    super.offer(blockedItem);
                    iterator.remove();
                }
            }
        } finally {
            this.lock.unlock();
        }
    }

    <T> T[] concatenate(T[] arr1, T[] arr2) {
        int arr1Len = arr1.length;
        int arr2Len = arr2.length;
        T[] C = (T[]) ((Object[]) Array.newInstance(arr1.getClass().getComponentType(), arr1Len + arr2Len));
        System.arraycopy(arr1, 0, C, 0, arr1Len);
        System.arraycopy(arr2, 0, C, arr1Len, arr2Len);
        return C;
    }
}
