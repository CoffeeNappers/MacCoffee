package com.vk.attachpicker.screen;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class EditorScreen$$Lambda$9 implements View.OnClickListener {
    private final EditorScreen arg$1;

    private EditorScreen$$Lambda$9(EditorScreen editorScreen) {
        this.arg$1 = editorScreen;
    }

    public static View.OnClickListener lambdaFactory$(EditorScreen editorScreen) {
        return new EditorScreen$$Lambda$9(editorScreen);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$createView$3(view);
    }
}
