package com.vk.attachpicker.screen;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class EditorScreen$$Lambda$27 implements Runnable {
    private final EditorScreen arg$1;

    private EditorScreen$$Lambda$27(EditorScreen editorScreen) {
        this.arg$1 = editorScreen;
    }

    public static Runnable lambdaFactory$(EditorScreen editorScreen) {
        return new EditorScreen$$Lambda$27(editorScreen);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onCropClick$26();
    }
}
