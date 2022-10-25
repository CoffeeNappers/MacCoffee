package com.vkontakte.android;

import java.lang.Thread;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VKApplication$$Lambda$1 implements Thread.UncaughtExceptionHandler {
    private final Thread.UncaughtExceptionHandler arg$1;

    private VKApplication$$Lambda$1(Thread.UncaughtExceptionHandler uncaughtExceptionHandler) {
        this.arg$1 = uncaughtExceptionHandler;
    }

    public static Thread.UncaughtExceptionHandler lambdaFactory$(Thread.UncaughtExceptionHandler uncaughtExceptionHandler) {
        return new VKApplication$$Lambda$1(uncaughtExceptionHandler);
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    @LambdaForm.Hidden
    public void uncaughtException(Thread thread, Throwable th) {
        VKApplication.lambda$onCreate$0(this.arg$1, thread, th);
    }
}
