package com.vk.attachpicker.screen;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class EditorScreen$$Lambda$30 implements View.OnClickListener {
    private final Runnable arg$1;

    private EditorScreen$$Lambda$30(Runnable runnable) {
        this.arg$1 = runnable;
    }

    public static View.OnClickListener lambdaFactory$(Runnable runnable) {
        return new EditorScreen$$Lambda$30(runnable);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.run();
    }
}
