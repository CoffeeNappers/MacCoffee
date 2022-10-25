package com.vkontakte.android.audio.player.proxy;

import java.io.File;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes2.dex */
public class LockFile {
    private static final Set<String> LOCKS = new HashSet();
    private final String mPath;

    public LockFile(File file) {
        this.mPath = file.getAbsolutePath();
    }

    public static LockFile lock(File file) {
        LockFile lock = new LockFile(file);
        lock.lock();
        return lock;
    }

    public void lock() {
        synchronized (LockFile.class) {
            while (LOCKS.contains(this.mPath)) {
                try {
                    LockFile.class.wait();
                } catch (InterruptedException e) {
                }
            }
            LOCKS.add(this.mPath);
        }
    }

    public void unlock() {
        synchronized (LockFile.class) {
            LOCKS.remove(this.mPath);
            LockFile.class.notifyAll();
        }
    }
}
