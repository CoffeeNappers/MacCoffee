package com.vk.attachpicker.screen;

import com.vk.attachpicker.stickers.TextSticker;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class EditorScreen$$Lambda$39 implements Runnable {
    private final EditorScreen arg$1;
    private final TextSticker arg$2;

    private EditorScreen$$Lambda$39(EditorScreen editorScreen, TextSticker textSticker) {
        this.arg$1 = editorScreen;
        this.arg$2 = textSticker;
    }

    public static Runnable lambdaFactory$(EditorScreen editorScreen, TextSticker textSticker) {
        return new EditorScreen$$Lambda$39(editorScreen, textSticker);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$11(this.arg$2);
    }
}
