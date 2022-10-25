package ru.mail.libverify.api;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
/* loaded from: classes3.dex */
public interface UncaughtExceptionListener {
    void uncaughtException(@Nullable Thread thread, @NonNull Throwable th);
}
