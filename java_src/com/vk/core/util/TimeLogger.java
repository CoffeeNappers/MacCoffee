package com.vk.core.util;

import android.os.SystemClock;
import com.vkontakte.android.Log;
/* loaded from: classes2.dex */
public class TimeLogger {
    private static final String TAG = "TimeLogger";
    private long timer;

    public void start() {
        this.timer = SystemClock.elapsedRealtime();
    }

    public void log(String name) {
        Log.d(TAG, name + ": " + (SystemClock.elapsedRealtime() - this.timer) + "ms");
    }

    public void logAndStartOver(String name) {
        log(name);
        start();
    }
}
