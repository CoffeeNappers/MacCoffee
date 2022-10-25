package com.vk.attachpicker.screen;

import android.view.MotionEvent;
import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class EditorScreen$$Lambda$19 implements View.OnTouchListener {
    private final EditorScreen arg$1;

    private EditorScreen$$Lambda$19(EditorScreen editorScreen) {
        this.arg$1 = editorScreen;
    }

    public static View.OnTouchListener lambdaFactory$(EditorScreen editorScreen) {
        return new EditorScreen$$Lambda$19(editorScreen);
    }

    @Override // android.view.View.OnTouchListener
    @LambdaForm.Hidden
    public boolean onTouch(View view, MotionEvent motionEvent) {
        return this.arg$1.lambda$createView$18(view, motionEvent);
    }
}
