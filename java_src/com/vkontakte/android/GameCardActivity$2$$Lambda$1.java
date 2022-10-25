package com.vkontakte.android;

import com.vkontakte.android.GameCardActivity;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GameCardActivity$2$$Lambda$1 implements Runnable {
    private final GameCardActivity.AnonymousClass2 arg$1;

    private GameCardActivity$2$$Lambda$1(GameCardActivity.AnonymousClass2 anonymousClass2) {
        this.arg$1 = anonymousClass2;
    }

    public static Runnable lambdaFactory$(GameCardActivity.AnonymousClass2 anonymousClass2) {
        return new GameCardActivity$2$$Lambda$1(anonymousClass2);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onPreDraw$0();
    }
}
