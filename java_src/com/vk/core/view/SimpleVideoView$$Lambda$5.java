package com.vk.core.view;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SimpleVideoView$$Lambda$5 implements Runnable {
    private final SimpleVideoView arg$1;

    private SimpleVideoView$$Lambda$5(SimpleVideoView simpleVideoView) {
        this.arg$1 = simpleVideoView;
    }

    public static Runnable lambdaFactory$(SimpleVideoView simpleVideoView) {
        return new SimpleVideoView$$Lambda$5(simpleVideoView);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$stop$4();
    }
}
