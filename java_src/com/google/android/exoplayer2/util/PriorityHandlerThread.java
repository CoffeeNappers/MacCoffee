package com.google.android.exoplayer2.util;

import android.os.HandlerThread;
import android.os.Process;
/* loaded from: classes.dex */
public final class PriorityHandlerThread extends HandlerThread {
    private final int priority;

    public PriorityHandlerThread(String name, int priority) {
        super(name);
        this.priority = priority;
    }

    @Override // android.os.HandlerThread, java.lang.Thread, java.lang.Runnable
    public void run() {
        Process.setThreadPriority(this.priority);
        super.run();
    }
}
