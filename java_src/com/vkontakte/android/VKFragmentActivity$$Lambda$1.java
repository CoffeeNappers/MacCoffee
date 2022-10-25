package com.vkontakte.android;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VKFragmentActivity$$Lambda$1 implements Runnable {
    private final VKFragmentActivity arg$1;

    private VKFragmentActivity$$Lambda$1(VKFragmentActivity vKFragmentActivity) {
        this.arg$1 = vKFragmentActivity;
    }

    public static Runnable lambdaFactory$(VKFragmentActivity vKFragmentActivity) {
        return new VKFragmentActivity$$Lambda$1(vKFragmentActivity);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$setTitleMarquee$0();
    }
}
