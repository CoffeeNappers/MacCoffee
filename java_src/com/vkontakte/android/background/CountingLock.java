package com.vkontakte.android.background;

import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes2.dex */
public class CountingLock {
    private AtomicInteger count = new AtomicInteger(0);
    private Object lock = new Object();

    public void await() {
        synchronized (this.lock) {
            if (this.count.get() > 0) {
                try {
                    this.lock.wait();
                } catch (InterruptedException e) {
                }
            }
        }
    }

    public void increment() {
        this.count.incrementAndGet();
    }

    public void decrement() {
        synchronized (this.lock) {
            int val = this.count.decrementAndGet();
            if (val == 0) {
                this.lock.notifyAll();
            } else if (val < 0) {
                throw new IllegalStateException("Decrement below 0");
            }
        }
    }
}
