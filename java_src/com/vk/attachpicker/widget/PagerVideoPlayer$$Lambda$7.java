package com.vk.attachpicker.widget;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PagerVideoPlayer$$Lambda$7 implements Runnable {
    private final PagerVideoPlayer arg$1;

    private PagerVideoPlayer$$Lambda$7(PagerVideoPlayer pagerVideoPlayer) {
        this.arg$1 = pagerVideoPlayer;
    }

    public static Runnable lambdaFactory$(PagerVideoPlayer pagerVideoPlayer) {
        return new PagerVideoPlayer$$Lambda$7(pagerVideoPlayer);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$1();
    }
}
