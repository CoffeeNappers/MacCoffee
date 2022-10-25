package com.vk.attachpicker.screen;

import android.content.DialogInterface;
import com.vk.attachpicker.stickers.TextSticker;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class EditorScreen$$Lambda$41 implements DialogInterface.OnDismissListener {
    private final EditorScreen arg$1;
    private final TextSticker arg$2;

    private EditorScreen$$Lambda$41(EditorScreen editorScreen, TextSticker textSticker) {
        this.arg$1 = editorScreen;
        this.arg$2 = textSticker;
    }

    public static DialogInterface.OnDismissListener lambdaFactory$(EditorScreen editorScreen, TextSticker textSticker) {
        return new EditorScreen$$Lambda$41(editorScreen, textSticker);
    }

    @Override // android.content.DialogInterface.OnDismissListener
    @LambdaForm.Hidden
    public void onDismiss(DialogInterface dialogInterface) {
        this.arg$1.lambda$null$15(this.arg$2, dialogInterface);
    }
}
