package org.mp4parser.aspectj.runtime.internal.cflowstack;

import java.util.Stack;
/* loaded from: classes3.dex */
public class ThreadStackFactoryImpl implements ThreadStackFactory {

    /* renamed from: org.mp4parser.aspectj.runtime.internal.cflowstack.ThreadStackFactoryImpl$1  reason: invalid class name */
    /* loaded from: classes3.dex */
    static class AnonymousClass1 {
    }

    /* loaded from: classes3.dex */
    private static class ThreadStackImpl extends ThreadLocal implements ThreadStack {
        private ThreadStackImpl() {
        }

        ThreadStackImpl(AnonymousClass1 x0) {
            this();
        }

        @Override // java.lang.ThreadLocal
        public Object initialValue() {
            return new Stack();
        }

        @Override // org.mp4parser.aspectj.runtime.internal.cflowstack.ThreadStack
        public Stack getThreadStack() {
            return (Stack) get();
        }

        @Override // org.mp4parser.aspectj.runtime.internal.cflowstack.ThreadStack
        public void removeThreadStack() {
            remove();
        }
    }

    @Override // org.mp4parser.aspectj.runtime.internal.cflowstack.ThreadStackFactory
    public ThreadStack getNewThreadStack() {
        return new ThreadStackImpl(null);
    }

    /* loaded from: classes3.dex */
    private static class ThreadCounterImpl extends ThreadLocal implements ThreadCounter {
        private ThreadCounterImpl() {
        }

        ThreadCounterImpl(AnonymousClass1 x0) {
            this();
        }

        @Override // java.lang.ThreadLocal
        public Object initialValue() {
            return new Counter();
        }

        public Counter getThreadCounter() {
            return (Counter) get();
        }

        @Override // org.mp4parser.aspectj.runtime.internal.cflowstack.ThreadCounter
        public void removeThreadCounter() {
            remove();
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

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes3.dex */
        public static class Counter {
            protected int value = 0;

            Counter() {
            }
        }
    }

    @Override // org.mp4parser.aspectj.runtime.internal.cflowstack.ThreadStackFactory
    public ThreadCounter getNewThreadCounter() {
        return new ThreadCounterImpl(null);
    }
}
