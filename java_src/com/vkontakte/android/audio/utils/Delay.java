package com.vkontakte.android.audio.utils;

import android.os.Handler;
/* loaded from: classes2.dex */
public class Delay {
    private final Handler mHandler = new Handler();
    private final Runnable mRunnable;

    public Delay(Runnable runnable) {
        this.mRunnable = runnable;
    }

    public static Delay newDelay(Runnable runnable, long delay) {
        Delay d = new Delay(runnable);
        d.delay(delay);
        return d;
    }

    public void delay(long delay) {
        cancel();
        if (delay > 0) {
            this.mHandler.postDelayed(this.mRunnable, delay);
        } else {
            this.mHandler.post(this.mRunnable);
        }
    }

    public void cancel() {
        this.mHandler.removeCallbacks(this.mRunnable);
    }

    public void run() {
        this.mRunnable.run();
    }
}
