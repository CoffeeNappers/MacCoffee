package com.vk.attachpicker.screen;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class EditorScreen$$Lambda$7 implements Runnable {
    private final EditorScreen arg$1;

    private EditorScreen$$Lambda$7(EditorScreen editorScreen) {
        this.arg$1 = editorScreen;
    }

    public static Runnable lambdaFactory$(EditorScreen editorScreen) {
        return new EditorScreen$$Lambda$7(editorScreen);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.onAutoClick();
    }
}
