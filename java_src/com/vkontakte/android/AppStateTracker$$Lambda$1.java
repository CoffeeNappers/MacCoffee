package com.vkontakte.android;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AppStateTracker$$Lambda$1 implements Runnable {
    private static final AppStateTracker$$Lambda$1 instance = new AppStateTracker$$Lambda$1();

    private AppStateTracker$$Lambda$1() {
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        AppStateTracker.lambda$processKeepScreenOn$0();
    }
}
