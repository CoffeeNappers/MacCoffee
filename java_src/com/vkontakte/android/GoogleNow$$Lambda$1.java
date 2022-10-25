package com.vkontakte.android;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GoogleNow$$Lambda$1 implements Runnable {
    private static final GoogleNow$$Lambda$1 instance = new GoogleNow$$Lambda$1();

    private GoogleNow$$Lambda$1() {
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        GoogleNow.lambda$updateTokenAsync$0();
    }
}
