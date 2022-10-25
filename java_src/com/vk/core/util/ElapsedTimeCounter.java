package com.vk.core.util;

import android.os.SystemClock;
/* loaded from: classes2.dex */
public class ElapsedTimeCounter {
    private long totalTimeMs = 0;
    private long currentSliceStart = 0;
    private boolean started = false;

    public void start() {
        if (!this.started) {
            this.started = true;
            this.currentSliceStart = SystemClock.elapsedRealtime();
        }
    }

    public void stop() {
        if (this.started) {
            this.started = false;
            this.totalTimeMs += SystemClock.elapsedRealtime() - this.currentSliceStart;
            this.currentSliceStart = 0L;
        }
    }

    public long elapsedTime() {
        return this.started ? this.totalTimeMs + (SystemClock.elapsedRealtime() - this.currentSliceStart) : this.totalTimeMs;
    }

    public void reset() {
        this.totalTimeMs = 0L;
        this.currentSliceStart = 0L;
        this.started = false;
    }
}
