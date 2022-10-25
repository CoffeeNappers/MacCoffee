package com.vk.attachpicker.screen;

import com.vk.attachpicker.stickers.StickerStyle;
import com.vk.attachpicker.stickers.TextStickerDialog;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class EditorScreen$$Lambda$24 implements TextStickerDialog.TextStickerDialogCallback {
    private final EditorScreen arg$1;

    private EditorScreen$$Lambda$24(EditorScreen editorScreen) {
        this.arg$1 = editorScreen;
    }

    public static TextStickerDialog.TextStickerDialogCallback lambdaFactory$(EditorScreen editorScreen) {
        return new EditorScreen$$Lambda$24(editorScreen);
    }

    @Override // com.vk.attachpicker.stickers.TextStickerDialog.TextStickerDialogCallback
    @LambdaForm.Hidden
    public void onApply(String str, int i, StickerStyle stickerStyle) {
        this.arg$1.lambda$onTextClick$23(str, i, stickerStyle);
    }
}
