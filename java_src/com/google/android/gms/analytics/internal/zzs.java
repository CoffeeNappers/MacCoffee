package com.google.android.gms.analytics.internal;

import android.util.Log;
import com.google.android.gms.analytics.Logger;
/* loaded from: classes2.dex */
class zzs implements Logger {
    private boolean aM;
    private int ee = 2;

    @Override // com.google.android.gms.analytics.Logger
    public void error(Exception exc) {
    }

    @Override // com.google.android.gms.analytics.Logger
    public void error(String str) {
    }

    @Override // com.google.android.gms.analytics.Logger
    public int getLogLevel() {
        return this.ee;
    }

    @Override // com.google.android.gms.analytics.Logger
    public void info(String str) {
    }

    @Override // com.google.android.gms.analytics.Logger
    public void setLogLevel(int i) {
        this.ee = i;
        if (!this.aM) {
            String str = zzy.en.get();
            Log.i(zzy.en.get(), new StringBuilder(String.valueOf(str).length() + 91).append("Logger is deprecated. To enable debug logging, please run:\nadb shell setprop log.tag.").append(str).append(" DEBUG").toString());
            this.aM = true;
        }
    }

    @Override // com.google.android.gms.analytics.Logger
    public void verbose(String str) {
    }

    @Override // com.google.android.gms.analytics.Logger
    public void warn(String str) {
    }
}
