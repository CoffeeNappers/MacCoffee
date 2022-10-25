package com.vk.attachpicker.stickers;

import com.vk.attachpicker.stickers.EditorStickerView;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class EditorStickerView$StickerHolder$$Lambda$2 implements Runnable {
    private final EditorStickerView.StickerHolder arg$1;

    private EditorStickerView$StickerHolder$$Lambda$2(EditorStickerView.StickerHolder stickerHolder) {
        this.arg$1 = stickerHolder;
    }

    public static Runnable lambdaFactory$(EditorStickerView.StickerHolder stickerHolder) {
        return new EditorStickerView$StickerHolder$$Lambda$2(stickerHolder);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$0();
    }
}
