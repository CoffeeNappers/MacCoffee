package com.googlecode.mp4parser.util;

import android.util.Log;
/* loaded from: classes2.dex */
public class AndroidLogger extends Logger {
    private static final String TAG = "isoparser";
    String name;

    public AndroidLogger(String name) {
        this.name = name;
    }

    @Override // com.googlecode.mp4parser.util.Logger
    public void logDebug(String message) {
        Log.d(TAG, String.valueOf(this.name) + ":" + message);
    }

    @Override // com.googlecode.mp4parser.util.Logger
    public void logWarn(String message) {
        Log.w(TAG, String.valueOf(this.name) + ":" + message);
    }

    @Override // com.googlecode.mp4parser.util.Logger
    public void logError(String message) {
        Log.e(TAG, String.valueOf(this.name) + ":" + message);
    }
}
