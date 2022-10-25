package com.vk.attachpicker.stickers;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class TextStickerDialog$$Lambda$4 implements View.OnClickListener {
    private final TextStickerDialog arg$1;

    private TextStickerDialog$$Lambda$4(TextStickerDialog textStickerDialog) {
        this.arg$1 = textStickerDialog;
    }

    public static View.OnClickListener lambdaFactory$(TextStickerDialog textStickerDialog) {
        return new TextStickerDialog$$Lambda$4(textStickerDialog);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$3(view);
    }
}
