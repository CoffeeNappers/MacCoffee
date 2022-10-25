package com.vk.attachpicker.screen;

import com.vk.attachpicker.stickers.StickersDrawingView;
import com.vk.attachpicker.stickers.TextSticker;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class EditorScreen$$Lambda$17 implements StickersDrawingView.OnTextStickerClickListener {
    private final EditorScreen arg$1;

    private EditorScreen$$Lambda$17(EditorScreen editorScreen) {
        this.arg$1 = editorScreen;
    }

    public static StickersDrawingView.OnTextStickerClickListener lambdaFactory$(EditorScreen editorScreen) {
        return new EditorScreen$$Lambda$17(editorScreen);
    }

    @Override // com.vk.attachpicker.stickers.StickersDrawingView.OnTextStickerClickListener
    @LambdaForm.Hidden
    public void onClick(TextSticker textSticker) {
        this.arg$1.lambda$createView$16(textSticker);
    }
}
