package com.vkontakte.android;

import com.vkontakte.android.GameCardActivity;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GameCardActivity$Adapter$$Lambda$1 implements Runnable {
    private final GameCardActivity.Adapter arg$1;

    private GameCardActivity$Adapter$$Lambda$1(GameCardActivity.Adapter adapter) {
        this.arg$1 = adapter;
    }

    public static Runnable lambdaFactory$(GameCardActivity.Adapter adapter) {
        return new GameCardActivity$Adapter$$Lambda$1(adapter);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$notifyDataSetChanged$0();
    }
}
