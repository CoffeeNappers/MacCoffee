package com.vk.attachpicker.stickers;

import android.view.View;
import com.vk.attachpicker.stickers.EditorStickerView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class EditorStickerView$EmojiHolder$$Lambda$1 implements View.OnClickListener {
    private final EditorStickerView.EmojiHolder arg$1;

    private EditorStickerView$EmojiHolder$$Lambda$1(EditorStickerView.EmojiHolder emojiHolder) {
        this.arg$1 = emojiHolder;
    }

    public static View.OnClickListener lambdaFactory$(EditorStickerView.EmojiHolder emojiHolder) {
        return new EditorStickerView$EmojiHolder$$Lambda$1(emojiHolder);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$0(view);
    }
}
