package com.vk.core.simplescreen;

import android.view.View;
import android.view.ViewTreeObserver;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class WindowScreenContainer$$Lambda$1 implements ViewTreeObserver.OnGlobalLayoutListener {
    private final WindowScreenContainer arg$1;
    private final View arg$2;

    private WindowScreenContainer$$Lambda$1(WindowScreenContainer windowScreenContainer, View view) {
        this.arg$1 = windowScreenContainer;
        this.arg$2 = view;
    }

    public static ViewTreeObserver.OnGlobalLayoutListener lambdaFactory$(WindowScreenContainer windowScreenContainer, View view) {
        return new WindowScreenContainer$$Lambda$1(windowScreenContainer, view);
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    @LambdaForm.Hidden
    public void onGlobalLayout() {
        this.arg$1.lambda$new$0(this.arg$2);
    }
}
