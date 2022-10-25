package com.vkontakte.android.gifs;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GifViewer$3$1$$Lambda$1 implements Runnable {
    private final Runnable arg$1;

    private GifViewer$3$1$$Lambda$1(Runnable runnable) {
        this.arg$1 = runnable;
    }

    public static Runnable lambdaFactory$(Runnable runnable) {
        return new GifViewer$3$1$$Lambda$1(runnable);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.run();
    }
}
