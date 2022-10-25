package com.vk.attachpicker.stickers;

import com.vk.attachpicker.stickers.StickersTabStrip;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class EditorStickerView$$Lambda$1 implements StickersTabStrip.ScrollSlidingTabStripDelegate {
    private final EditorStickerView arg$1;

    private EditorStickerView$$Lambda$1(EditorStickerView editorStickerView) {
        this.arg$1 = editorStickerView;
    }

    public static StickersTabStrip.ScrollSlidingTabStripDelegate lambdaFactory$(EditorStickerView editorStickerView) {
        return new EditorStickerView$$Lambda$1(editorStickerView);
    }

    @Override // com.vk.attachpicker.stickers.StickersTabStrip.ScrollSlidingTabStripDelegate
    @LambdaForm.Hidden
    public void onPageSelected(int i) {
        this.arg$1.lambda$new$0(i);
    }
}
