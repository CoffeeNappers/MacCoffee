package com.vkontakte.android.audio.utils;
/* loaded from: classes2.dex */
public class Timer {
    private final Delay mDelay = new Delay(new TimerRunnable());
    private final long mPeriod;
    private final Runnable mRunnable;

    public Timer(Runnable runnable, long period) {
        this.mRunnable = runnable;
        this.mPeriod = period;
    }

    public static Timer startNewTimer(Runnable runnable, long delay, long period) {
        Timer timer = new Timer(runnable, period);
        timer.start(delay);
        return timer;
    }

    public void start(long delay) {
        this.mDelay.delay(delay);
    }

    public void stop() {
        this.mDelay.cancel();
    }

    /* loaded from: classes2.dex */
    private class TimerRunnable implements Runnable {
        private TimerRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            if (Timer.this.mPeriod > 0) {
                Timer.this.mDelay.delay(Timer.this.mPeriod);
            }
            Timer.this.mRunnable.run();
        }
    }
}
