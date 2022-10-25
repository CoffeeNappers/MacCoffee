package com.vk.attachpicker.stickers;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class TextStickerDialog$$Lambda$3 implements View.OnClickListener {
    private final TextStickerDialog arg$1;
    private final boolean arg$2;

    private TextStickerDialog$$Lambda$3(TextStickerDialog textStickerDialog, boolean z) {
        this.arg$1 = textStickerDialog;
        this.arg$2 = z;
    }

    public static View.OnClickListener lambdaFactory$(TextStickerDialog textStickerDialog, boolean z) {
        return new TextStickerDialog$$Lambda$3(textStickerDialog, z);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$2(this.arg$2, view);
    }
}
