package com.vk.attachpicker.screen;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class EditorScreen$$Lambda$14 implements View.OnLongClickListener {
    private final EditorScreen arg$1;

    private EditorScreen$$Lambda$14(EditorScreen editorScreen) {
        this.arg$1 = editorScreen;
    }

    public static View.OnLongClickListener lambdaFactory$(EditorScreen editorScreen) {
        return new EditorScreen$$Lambda$14(editorScreen);
    }

    @Override // android.view.View.OnLongClickListener
    @LambdaForm.Hidden
    public boolean onLongClick(View view) {
        return this.arg$1.lambda$createView$8(view);
    }
}
