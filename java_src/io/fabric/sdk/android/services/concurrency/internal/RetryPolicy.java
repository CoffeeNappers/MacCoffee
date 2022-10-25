package io.fabric.sdk.android.services.concurrency.internal;
/* loaded from: classes3.dex */
public interface RetryPolicy {
    boolean shouldRetry(int i, Throwable th);
}
