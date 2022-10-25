package com.vkontakte.android.ui.holder.gamepage;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GameIconButtonHolder$$Lambda$2 implements Runnable {
    private final GameIconButtonHolder arg$1;
    private final boolean arg$2;

    private GameIconButtonHolder$$Lambda$2(GameIconButtonHolder gameIconButtonHolder, boolean z) {
        this.arg$1 = gameIconButtonHolder;
        this.arg$2 = z;
    }

    public static Runnable lambdaFactory$(GameIconButtonHolder gameIconButtonHolder, boolean z) {
        return new GameIconButtonHolder$$Lambda$2(gameIconButtonHolder, z);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$updateNotificationsStateDelayed$1(this.arg$2);
    }
}
