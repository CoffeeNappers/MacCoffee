package com.vkontakte.android.audio.utils;

import android.content.Context;
import android.os.PowerManager;
import com.vkontakte.android.utils.L;
/* loaded from: classes2.dex */
public class WakeLockEx {
    private Delay mDelay;
    private final PowerManager.WakeLock mWakeLock;

    public WakeLockEx(Context context, String tag) {
        this.mWakeLock = Utils.getPowerManager(context).newWakeLock(1, tag);
    }

    public void acquire() {
        if (!this.mWakeLock.isHeld()) {
            L.e(new Object[0]);
            this.mWakeLock.acquire();
        }
        if (this.mDelay != null) {
            this.mDelay.cancel();
            this.mDelay = null;
        }
    }

    public void releaseSafety() {
        release(10000L);
    }

    public void release(long delay) {
        if (this.mWakeLock.isHeld()) {
            if (delay <= 0) {
                L.e(new Object[0]);
                this.mWakeLock.release();
                if (this.mDelay != null) {
                    this.mDelay.cancel();
                    this.mDelay = null;
                }
            } else if (this.mDelay == null) {
                this.mDelay = Delay.newDelay(new ReleaseRunnable(), delay);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class ReleaseRunnable implements Runnable {
        private ReleaseRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            WakeLockEx.this.mDelay = null;
            WakeLockEx.this.release(0L);
        }
    }
}
