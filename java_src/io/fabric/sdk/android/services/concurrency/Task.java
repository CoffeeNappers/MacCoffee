package io.fabric.sdk.android.services.concurrency;
/* loaded from: classes3.dex */
public interface Task {
    Throwable getError();

    boolean isFinished();

    void setError(Throwable th);

    void setFinished(boolean z);
}
