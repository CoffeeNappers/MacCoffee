package com.vk.attachpicker.stickers;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class EditorStickerView$$Lambda$3 implements View.OnClickListener {
    private final EditorStickerView arg$1;

    private EditorStickerView$$Lambda$3(EditorStickerView editorStickerView) {
        this.arg$1 = editorStickerView;
    }

    public static View.OnClickListener lambdaFactory$(EditorStickerView editorStickerView) {
        return new EditorStickerView$$Lambda$3(editorStickerView);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$2(view);
    }
}
