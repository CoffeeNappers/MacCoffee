package com.vk.attachpicker.screen;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class EditorScreen$$Lambda$31 implements Runnable {
    private final EditorScreen arg$1;
    private final boolean arg$2;

    private EditorScreen$$Lambda$31(EditorScreen editorScreen, boolean z) {
        this.arg$1 = editorScreen;
        this.arg$2 = z;
    }

    public static Runnable lambdaFactory$(EditorScreen editorScreen, boolean z) {
        return new EditorScreen$$Lambda$31(editorScreen, z);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$trackStickers$31(this.arg$2);
    }
}