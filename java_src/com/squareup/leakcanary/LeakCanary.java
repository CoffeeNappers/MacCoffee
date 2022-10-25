package com.squareup.leakcanary;

import android.app.Application;
/* loaded from: classes.dex */
public final class LeakCanary {
    public static RefWatcher install(Application application) {
        return RefWatcher.DISABLED;
    }

    private LeakCanary() {
        throw new AssertionError();
    }
}
