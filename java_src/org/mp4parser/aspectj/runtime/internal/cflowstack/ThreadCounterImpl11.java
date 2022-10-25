package org.mp4parser.aspectj.runtime.internal.cflowstack;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;
/* loaded from: classes3.dex */
public class ThreadCounterImpl11 implements ThreadCounter {
    private static final int COLLECT_AT = 20000;
    private static final int MIN_COLLECT_AT = 100;
    private Counter cached_counter;
    private Thread cached_thread;
    private Hashtable counters = new Hashtable();
    private int change_count = 0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static class Counter {
        protected int value = 0;

        Counter() {
        }
    }

    private synchronized Counter getThreadCounter() {
        if (Thread.currentThread() != this.cached_thread) {
            this.cached_thread = Thread.currentThread();
            this.cached_counter = (Counter) this.counters.get(this.cached_thread);
            if (this.cached_counter == null) {
                this.cached_counter = new Counter();
                this.counters.put(this.cached_thread, this.cached_counter);
            }
            this.change_count++;
            int size = Math.max(1, this.counters.size());
            if (this.change_count > Math.max(100, 20000 / size)) {
                List<Thread> dead_stacks = new ArrayList();
                Enumeration e = this.counters.keys();
                while (e.hasMoreElements()) {
                    Thread t = (Thread) e.nextElement();
                    if (!t.isAlive()) {
                        dead_stacks.add(t);
                    }
                }
                for (Thread t2 : dead_stacks) {
                    this.counters.remove(t2);
                }
                this.change_count = 0;
            }
        }
        return this.cached_counter;
    }

    @Override // org.mp4parser.aspectj.runtime.internal.cflowstack.ThreadCounter
    public void inc() {
        getThreadCounter().value++;
    }

    @Override // org.mp4parser.aspectj.runtime.internal.cflowstack.ThreadCounter
    public void dec() {
        Counter threadCounter = getThreadCounter();
        threadCounter.value--;
    }

    @Override // org.mp4parser.aspectj.runtime.internal.cflowstack.ThreadCounter
    public boolean isNotZero() {
        return getThreadCounter().value != 0;
    }

    @Override // org.mp4parser.aspectj.runtime.internal.cflowstack.ThreadCounter
    public void removeThreadCounter() {
    }
}
