package org.mp4parser.aspectj.runtime.internal.cflowstack;
/* loaded from: classes3.dex */
public class ThreadStackFactoryImpl11 implements ThreadStackFactory {
    @Override // org.mp4parser.aspectj.runtime.internal.cflowstack.ThreadStackFactory
    public ThreadStack getNewThreadStack() {
        return new ThreadStackImpl11();
    }

    @Override // org.mp4parser.aspectj.runtime.internal.cflowstack.ThreadStackFactory
    public ThreadCounter getNewThreadCounter() {
        return new ThreadCounterImpl11();
    }
}
