package com.vk.attachpicker.screen;

import com.vk.attachpicker.screen.ViewerScreen;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ViewerScreen$2$$Lambda$1 implements Runnable {
    private final ViewerScreen.AnonymousClass2 arg$1;
    private final int arg$2;

    private ViewerScreen$2$$Lambda$1(ViewerScreen.AnonymousClass2 anonymousClass2, int i) {
        this.arg$1 = anonymousClass2;
        this.arg$2 = i;
    }

    public static Runnable lambdaFactory$(ViewerScreen.AnonymousClass2 anonymousClass2, int i) {
        return new ViewerScreen$2$$Lambda$1(anonymousClass2, i);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onPageSelected$0(this.arg$2);
    }
}
