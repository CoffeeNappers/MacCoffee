package com.vk.attachpicker.screen;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class EditorScreen$$Lambda$21 implements DialogInterface.OnClickListener {
    private final EditorScreen arg$1;

    private EditorScreen$$Lambda$21(EditorScreen editorScreen) {
        this.arg$1 = editorScreen;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(EditorScreen editorScreen) {
        return new EditorScreen$$Lambda$21(editorScreen);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$finish$20(dialogInterface, i);
    }
}
