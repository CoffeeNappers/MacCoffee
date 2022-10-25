package com.vk.attachpicker.stickers;

import android.view.View;
import com.vk.attachpicker.stickers.EditorStickerView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class EditorStickerView$StickerHolder$$Lambda$1 implements View.OnClickListener {
    private final EditorStickerView.StickerHolder arg$1;
    private final EditorStickerView.Listener arg$2;

    private EditorStickerView$StickerHolder$$Lambda$1(EditorStickerView.StickerHolder stickerHolder, EditorStickerView.Listener listener) {
        this.arg$1 = stickerHolder;
        this.arg$2 = listener;
    }

    public static View.OnClickListener lambdaFactory$(EditorStickerView.StickerHolder stickerHolder, EditorStickerView.Listener listener) {
        return new EditorStickerView$StickerHolder$$Lambda$1(stickerHolder, listener);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$1(this.arg$2, view);
    }
}
