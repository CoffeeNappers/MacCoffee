package com.crashlytics.android.core;

import io.fabric.sdk.android.Fabric;
import java.lang.Thread;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
class CrashlyticsUncaughtExceptionHandler implements Thread.UncaughtExceptionHandler {
    private final CrashListener crashListener;
    private final Thread.UncaughtExceptionHandler defaultHandler;
    private final AtomicBoolean isHandlingException = new AtomicBoolean(false);

    /* loaded from: classes.dex */
    interface CrashListener {
        void onUncaughtException(Thread thread, Throwable th);
    }

    public CrashlyticsUncaughtExceptionHandler(CrashListener crashListener, Thread.UncaughtExceptionHandler defaultHandler) {
        this.crashListener = crashListener;
        this.defaultHandler = defaultHandler;
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public void uncaughtException(Thread thread, Throwable ex) {
        this.isHandlingException.set(true);
        try {
            try {
                this.crashListener.onUncaughtException(thread, ex);
                Fabric.getLogger().d(CrashlyticsCore.TAG, "Crashlytics completed exception processing. Invoking default exception handler.");
                this.defaultHandler.uncaughtException(thread, ex);
                this.isHandlingException.set(false);
            } catch (Exception e) {
                Fabric.getLogger().e(CrashlyticsCore.TAG, "An error occurred in the uncaught exception handler", e);
                Fabric.getLogger().d(CrashlyticsCore.TAG, "Crashlytics completed exception processing. Invoking default exception handler.");
                this.defaultHandler.uncaughtException(thread, ex);
                this.isHandlingException.set(false);
            }
        } catch (Throwable th) {
            Fabric.getLogger().d(CrashlyticsCore.TAG, "Crashlytics completed exception processing. Invoking default exception handler.");
            this.defaultHandler.uncaughtException(thread, ex);
            this.isHandlingException.set(false);
            throw th;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isHandlingException() {
        return this.isHandlingException.get();
    }
}
