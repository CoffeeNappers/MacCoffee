package com.vkontakte.android.background;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
/* loaded from: classes2.dex */
public class WorkerThread extends Thread {
    private Handler mHandler;
    private final Object mLock;
    private boolean mReady;

    public WorkerThread(String threadName) {
        super(threadName);
        this.mLock = new Object();
        this.mReady = false;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        Looper.prepare();
        this.mHandler = new Handler();
        synchronized (this.mLock) {
            this.mLock.notifyAll();
            this.mReady = true;
        }
        Looper.loop();
    }

    public void sendMessage(Message message) {
        sendMessage(message, 0L);
    }

    public void postRunnable(Runnable runnable) {
        postRunnable(runnable, 0L);
    }

    public void sendMessage(Message message, long delayMillis) {
        synchronized (this.mLock) {
            while (!this.mReady) {
                try {
                    this.mLock.wait();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            if (this.mHandler != null) {
                if (delayMillis <= 0) {
                    this.mHandler.sendMessage(message);
                } else {
                    this.mHandler.sendMessageDelayed(message, delayMillis);
                }
            }
        }
    }

    public void postRunnable(Runnable runnable, long delayMillis) {
        synchronized (this.mLock) {
            while (!this.mReady) {
                try {
                    this.mLock.wait();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            if (this.mHandler != null) {
                if (delayMillis <= 0) {
                    this.mHandler.post(runnable);
                } else {
                    this.mHandler.postDelayed(runnable, delayMillis);
                }
            }
        }
    }

    @Override // java.lang.Thread
    public void interrupt() {
        synchronized (this.mLock) {
            if (this.mHandler != null) {
                this.mHandler.removeCallbacksAndMessages(null);
            }
        }
        try {
            if (isStarted() && !isInterrupted()) {
                super.interrupt();
            }
        } catch (Exception e) {
        }
    }

    public void removeCallbacks(Runnable runnable) {
        synchronized (this.mLock) {
            while (!this.mReady) {
                try {
                    this.mLock.wait();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            if (this.mHandler != null) {
                this.mHandler.removeCallbacks(runnable);
            }
        }
    }

    public boolean isStarted() {
        return this.mReady;
    }
}
