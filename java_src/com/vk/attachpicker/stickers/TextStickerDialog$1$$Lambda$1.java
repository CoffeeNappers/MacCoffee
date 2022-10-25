package com.vk.attachpicker.stickers;

import com.vk.attachpicker.stickers.TextStickerDialog;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class TextStickerDialog$1$$Lambda$1 implements Runnable {
    private final TextStickerDialog.AnonymousClass1 arg$1;

    private TextStickerDialog$1$$Lambda$1(TextStickerDialog.AnonymousClass1 anonymousClass1) {
        this.arg$1 = anonymousClass1;
    }

    public static Runnable lambdaFactory$(TextStickerDialog.AnonymousClass1 anonymousClass1) {
        return new TextStickerDialog$1$$Lambda$1(anonymousClass1);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onPreDraw$0();
    }
}
