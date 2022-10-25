package com.vk.core.util;

import android.os.Handler;
import android.os.Looper;
/* loaded from: classes2.dex */
public class TimeoutLock {
    private static final int MSG_LOCK = 0;
    private long defaultLockTime;
    private final Handler lockHandler = new Handler(Looper.getMainLooper());

    public TimeoutLock(long defaultLockTime) {
        this.defaultLockTime = defaultLockTime;
    }

    public synchronized boolean checkAndMaybeLock() {
        boolean z;
        if (isLocked()) {
            z = true;
        } else {
            lock();
            z = false;
        }
        return z;
    }

    public synchronized boolean isLocked() {
        return this.lockHandler.hasMessages(0);
    }

    public synchronized void lock() {
        lock(this.defaultLockTime);
    }

    public synchronized void lock(long lockTime) {
        this.lockHandler.sendEmptyMessageDelayed(0, lockTime);
    }

    public synchronized void unlock() {
        this.lockHandler.removeMessages(0);
    }
}
