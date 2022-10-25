package com.vk.attachpicker.stickers;

import android.view.View;
import com.vk.attachpicker.stickers.EditorStickerView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class EditorStickerView$MaskHolder$$Lambda$1 implements View.OnClickListener {
    private final EditorStickerView.MaskHolder arg$1;
    private final EditorStickerView.Listener arg$2;

    private EditorStickerView$MaskHolder$$Lambda$1(EditorStickerView.MaskHolder maskHolder, EditorStickerView.Listener listener) {
        this.arg$1 = maskHolder;
        this.arg$2 = listener;
    }

    public static View.OnClickListener lambdaFactory$(EditorStickerView.MaskHolder maskHolder, EditorStickerView.Listener listener) {
        return new EditorStickerView$MaskHolder$$Lambda$1(maskHolder, listener);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$0(this.arg$2, view);
    }
}
