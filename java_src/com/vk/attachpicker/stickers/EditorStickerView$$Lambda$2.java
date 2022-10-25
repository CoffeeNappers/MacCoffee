package com.vk.attachpicker.stickers;

import android.view.View;
import com.vk.attachpicker.stickers.EditorStickerView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class EditorStickerView$$Lambda$2 implements View.OnClickListener {
    private final EditorStickerView.Listener arg$1;

    private EditorStickerView$$Lambda$2(EditorStickerView.Listener listener) {
        this.arg$1 = listener;
    }

    public static View.OnClickListener lambdaFactory$(EditorStickerView.Listener listener) {
        return new EditorStickerView$$Lambda$2(listener);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        EditorStickerView.lambda$new$1(this.arg$1, view);
    }
}
