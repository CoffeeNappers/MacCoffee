package com.facebook.imagepipeline.core;

import android.os.Process;
import java.util.concurrent.ThreadFactory;
/* loaded from: classes.dex */
public class PriorityThreadFactory implements ThreadFactory {
    private final int mThreadPriority;

    public PriorityThreadFactory(int threadPriority) {
        this.mThreadPriority = threadPriority;
    }

    @Override // java.util.concurrent.ThreadFactory
    public Thread newThread(final Runnable runnable) {
        Runnable wrapperRunnable = new Runnable() { // from class: com.facebook.imagepipeline.core.PriorityThreadFactory.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    Process.setThreadPriority(PriorityThreadFactory.this.mThreadPriority);
                } catch (Throwable th) {
                }
                runnable.run();
            }
        };
        return new Thread(wrapperRunnable);
    }
}
