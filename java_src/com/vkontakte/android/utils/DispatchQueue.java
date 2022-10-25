package com.vkontakte.android.utils;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.vkontakte.android.Log;
import java.util.concurrent.CountDownLatch;
/* loaded from: classes3.dex */
public class DispatchQueue extends Thread {
    private volatile Handler handler = null;
    private CountDownLatch syncLatch = new CountDownLatch(1);

    public DispatchQueue(String threadName) {
        setName(threadName);
        start();
    }

    private void sendMessage(Message msg, int delay) {
        try {
            this.syncLatch.await();
            if (delay <= 0) {
                this.handler.sendMessage(msg);
            } else {
                this.handler.sendMessageDelayed(msg, delay);
            }
        } catch (Exception e) {
            Log.e("vk", "send message failure", e);
        }
    }

    public void cancelRunnable(Runnable runnable) {
        try {
            this.syncLatch.await();
            this.handler.removeCallbacks(runnable);
        } catch (Exception e) {
            Log.e("vk", "cancel task failure", e);
        }
    }

    public void postRunnable(Runnable runnable) {
        postRunnable(runnable, 0L);
    }

    public void postRunnable(Runnable runnable, long delay) {
        try {
            this.syncLatch.await();
            if (delay <= 0) {
                this.handler.post(runnable);
            } else {
                this.handler.postDelayed(runnable, delay);
            }
        } catch (Exception e) {
            Log.e("vk", "post task failure", e);
        }
    }

    public void cleanupQueue() {
        try {
            this.syncLatch.await();
            this.handler.removeCallbacksAndMessages(null);
        } catch (Exception e) {
            Log.e("vk", "cleanup failure", e);
        }
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        Looper.prepare();
        this.handler = new Handler();
        this.syncLatch.countDown();
        Looper.loop();
    }
}
