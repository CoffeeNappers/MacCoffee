package com.vk.attachpicker.screen;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class EditorScreen$$Lambda$22 implements DialogInterface.OnClickListener {
    private static final EditorScreen$$Lambda$22 instance = new EditorScreen$$Lambda$22();

    private EditorScreen$$Lambda$22() {
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        dialogInterface.dismiss();
    }
}
