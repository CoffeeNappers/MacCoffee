package com.vk.attachpicker.screen;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class EditorScreen$$Lambda$25 implements DialogInterface.OnDismissListener {
    private final EditorScreen arg$1;

    private EditorScreen$$Lambda$25(EditorScreen editorScreen) {
        this.arg$1 = editorScreen;
    }

    public static DialogInterface.OnDismissListener lambdaFactory$(EditorScreen editorScreen) {
        return new EditorScreen$$Lambda$25(editorScreen);
    }

    @Override // android.content.DialogInterface.OnDismissListener
    @LambdaForm.Hidden
    public void onDismiss(DialogInterface dialogInterface) {
        this.arg$1.lambda$onTextClick$24(dialogInterface);
    }
}
