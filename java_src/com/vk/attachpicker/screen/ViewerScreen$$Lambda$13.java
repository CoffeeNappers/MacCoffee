package com.vk.attachpicker.screen;

import com.vk.attachpicker.screen.EditorScreen;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ViewerScreen$$Lambda$13 implements EditorScreen.Delegate {
    private final ViewerScreen arg$1;

    private ViewerScreen$$Lambda$13(ViewerScreen viewerScreen) {
        this.arg$1 = viewerScreen;
    }

    public static EditorScreen.Delegate lambdaFactory$(ViewerScreen viewerScreen) {
        return new ViewerScreen$$Lambda$13(viewerScreen);
    }

    @Override // com.vk.attachpicker.screen.EditorScreen.Delegate
    @LambdaForm.Hidden
    public void startEditorCloseAnimation() {
        this.arg$1.lambda$null$5();
    }
}
