package com.vk.attachpicker;

import android.view.ViewTreeObserver;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class AttachActivity$$Lambda$8 implements ViewTreeObserver.OnGlobalLayoutListener {
    private final AttachActivity arg$1;

    private AttachActivity$$Lambda$8(AttachActivity attachActivity) {
        this.arg$1 = attachActivity;
    }

    public static ViewTreeObserver.OnGlobalLayoutListener lambdaFactory$(AttachActivity attachActivity) {
        return new AttachActivity$$Lambda$8(attachActivity);
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    @LambdaForm.Hidden
    public void onGlobalLayout() {
        this.arg$1.lambda$initViews$7();
    }
}
