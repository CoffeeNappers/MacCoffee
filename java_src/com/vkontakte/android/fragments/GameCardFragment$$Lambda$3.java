package com.vkontakte.android.fragments;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class GameCardFragment$$Lambda$3 implements Runnable {
    private final GameCardFragment arg$1;

    private GameCardFragment$$Lambda$3(GameCardFragment gameCardFragment) {
        this.arg$1 = gameCardFragment;
    }

    public static Runnable lambdaFactory$(GameCardFragment gameCardFragment) {
        return new GameCardFragment$$Lambda$3(gameCardFragment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$startHidingRequest$2();
    }
}
