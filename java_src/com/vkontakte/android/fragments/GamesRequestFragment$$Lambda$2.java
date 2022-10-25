package com.vkontakte.android.fragments;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GamesRequestFragment$$Lambda$2 implements Runnable {
    private final GamesRequestFragment arg$1;

    private GamesRequestFragment$$Lambda$2(GamesRequestFragment gamesRequestFragment) {
        this.arg$1 = gamesRequestFragment;
    }

    public static Runnable lambdaFactory$(GamesRequestFragment gamesRequestFragment) {
        return new GamesRequestFragment$$Lambda$2(gamesRequestFragment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$startHidingRequests$1();
    }
}
