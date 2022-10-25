package com.vk.attachpicker.screen;

import com.vk.attachpicker.stickers.StickerStyle;
import com.vk.attachpicker.stickers.TextSticker;
import com.vk.attachpicker.stickers.TextStickerDialog;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class EditorScreen$$Lambda$40 implements TextStickerDialog.TextStickerDialogCallback {
    private final EditorScreen arg$1;
    private final TextSticker arg$2;

    private EditorScreen$$Lambda$40(EditorScreen editorScreen, TextSticker textSticker) {
        this.arg$1 = editorScreen;
        this.arg$2 = textSticker;
    }

    public static TextStickerDialog.TextStickerDialogCallback lambdaFactory$(EditorScreen editorScreen, TextSticker textSticker) {
        return new EditorScreen$$Lambda$40(editorScreen, textSticker);
    }

    @Override // com.vk.attachpicker.stickers.TextStickerDialog.TextStickerDialogCallback
    @LambdaForm.Hidden
    public void onApply(String str, int i, StickerStyle stickerStyle) {
        this.arg$1.lambda$null$13(this.arg$2, str, i, stickerStyle);
    }
}
