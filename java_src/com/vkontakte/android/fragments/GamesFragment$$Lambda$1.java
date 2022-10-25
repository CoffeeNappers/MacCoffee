package com.vkontakte.android.fragments;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class GamesFragment$$Lambda$1 implements Runnable {
    private final GamesFragment arg$1;

    private GamesFragment$$Lambda$1(GamesFragment gamesFragment) {
        this.arg$1 = gamesFragment;
    }

    public static Runnable lambdaFactory$(GamesFragment gamesFragment) {
        return new GamesFragment$$Lambda$1(gamesFragment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$startHidingRequests$0();
    }
}
