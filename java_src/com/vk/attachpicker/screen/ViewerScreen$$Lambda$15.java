package com.vk.attachpicker.screen;

import com.vk.attachpicker.screen.TrimScreen;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ViewerScreen$$Lambda$15 implements TrimScreen.Delegate {
    private final ViewerScreen arg$1;

    private ViewerScreen$$Lambda$15(ViewerScreen viewerScreen) {
        this.arg$1 = viewerScreen;
    }

    public static TrimScreen.Delegate lambdaFactory$(ViewerScreen viewerScreen) {
        return new ViewerScreen$$Lambda$15(viewerScreen);
    }

    @Override // com.vk.attachpicker.screen.TrimScreen.Delegate
    @LambdaForm.Hidden
    public void startEditorCloseAnimation() {
        this.arg$1.lambda$null$3();
    }
}
