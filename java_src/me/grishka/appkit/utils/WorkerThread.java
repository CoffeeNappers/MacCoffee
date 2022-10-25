package me.grishka.appkit.utils;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
/* loaded from: classes3.dex */
public class WorkerThread extends Thread {
    public Handler handler;
    private Object handlerSyncObject;

    public WorkerThread(String threadName) {
        super(threadName);
        this.handlerSyncObject = new Object();
    }

    public void sendMessage(Message msg, int delay) {
        if (this.handler == null) {
            try {
                synchronized (this.handlerSyncObject) {
                    this.handlerSyncObject.wait();
                }
            } catch (Throwable t) {
                t.printStackTrace();
            }
        }
        if (this.handler != null) {
            if (delay <= 0) {
                this.handler.sendMessage(msg);
            } else {
                this.handler.sendMessageDelayed(msg, delay);
            }
        }
    }

    public void postRunnable(Runnable runnable, int delay) {
        if (this.handler != null) {
            if (delay <= 0) {
                this.handler.post(runnable);
            } else {
                this.handler.postDelayed(runnable, delay);
            }
        }
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        Looper.prepare();
        this.handler = new Handler();
        synchronized (this.handlerSyncObject) {
            this.handlerSyncObject.notify();
        }
        Looper.loop();
    }
}
