package com.vk.attachpicker.stickers;

import com.vk.attachpicker.widget.BackPressEditText;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class TextStickerDialog$$Lambda$2 implements BackPressEditText.OnBackPressedCallback {
    private final TextStickerDialog arg$1;

    private TextStickerDialog$$Lambda$2(TextStickerDialog textStickerDialog) {
        this.arg$1 = textStickerDialog;
    }

    public static BackPressEditText.OnBackPressedCallback lambdaFactory$(TextStickerDialog textStickerDialog) {
        return new TextStickerDialog$$Lambda$2(textStickerDialog);
    }

    @Override // com.vk.attachpicker.widget.BackPressEditText.OnBackPressedCallback
    @LambdaForm.Hidden
    public void onBackPressed() {
        this.arg$1.lambda$new$1();
    }
}
