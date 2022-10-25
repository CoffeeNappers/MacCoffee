package com.vkontakte.android.gifs;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GifViewer$$Lambda$2 implements Runnable {
    private final GifViewer arg$1;

    private GifViewer$$Lambda$2(GifViewer gifViewer) {
        this.arg$1 = gifViewer;
    }

    public static Runnable lambdaFactory$(GifViewer gifViewer) {
        return new GifViewer$$Lambda$2(gifViewer);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$finish$0();
    }
}
