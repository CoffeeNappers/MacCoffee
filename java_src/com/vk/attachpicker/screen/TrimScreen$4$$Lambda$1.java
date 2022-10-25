package com.vk.attachpicker.screen;

import com.vk.attachpicker.screen.TrimScreen;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class TrimScreen$4$$Lambda$1 implements Runnable {
    private final TrimScreen.AnonymousClass4 arg$1;

    private TrimScreen$4$$Lambda$1(TrimScreen.AnonymousClass4 anonymousClass4) {
        this.arg$1 = anonymousClass4;
    }

    public static Runnable lambdaFactory$(TrimScreen.AnonymousClass4 anonymousClass4) {
        return new TrimScreen$4$$Lambda$1(anonymousClass4);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onAnimationEnd$0();
    }
}
