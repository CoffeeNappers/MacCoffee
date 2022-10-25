package com.vkontakte.android.ui.drawables;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class DotsLoadingDrawable$$Lambda$1 implements Runnable {
    private final DotsLoadingDrawable arg$1;

    private DotsLoadingDrawable$$Lambda$1(DotsLoadingDrawable dotsLoadingDrawable) {
        this.arg$1 = dotsLoadingDrawable;
    }

    public static Runnable lambdaFactory$(DotsLoadingDrawable dotsLoadingDrawable) {
        return new DotsLoadingDrawable$$Lambda$1(dotsLoadingDrawable);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.invalidateSelf();
    }
}
