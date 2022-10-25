package com.vkontakte.android.fragments.stickers;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class StickersDetailsFragment$$Lambda$3 implements Runnable {
    private final StickersDetailsFragment arg$1;

    private StickersDetailsFragment$$Lambda$3(StickersDetailsFragment stickersDetailsFragment) {
        this.arg$1 = stickersDetailsFragment;
    }

    public static Runnable lambdaFactory$(StickersDetailsFragment stickersDetailsFragment) {
        return new StickersDetailsFragment$$Lambda$3(stickersDetailsFragment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$bindData$2();
    }
}
