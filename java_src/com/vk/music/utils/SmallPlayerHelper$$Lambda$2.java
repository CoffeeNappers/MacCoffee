package com.vk.music.utils;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SmallPlayerHelper$$Lambda$2 implements Runnable {
    private final SmallPlayerHelper arg$1;

    private SmallPlayerHelper$$Lambda$2(SmallPlayerHelper smallPlayerHelper) {
        this.arg$1 = smallPlayerHelper;
    }

    public static Runnable lambdaFactory$(SmallPlayerHelper smallPlayerHelper) {
        return new SmallPlayerHelper$$Lambda$2(smallPlayerHelper);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.onDestroyView();
    }
}
