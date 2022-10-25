package com.vk.attachpicker.screen;

import android.app.Activity;
import android.graphics.RectF;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class EditorScreen$$Lambda$29 implements Runnable {
    private final EditorScreen arg$1;
    private final RectF arg$2;
    private final Activity arg$3;

    private EditorScreen$$Lambda$29(EditorScreen editorScreen, RectF rectF, Activity activity) {
        this.arg$1 = editorScreen;
        this.arg$2 = rectF;
        this.arg$3 = activity;
    }

    public static Runnable lambdaFactory$(EditorScreen editorScreen, RectF rectF, Activity activity) {
        return new EditorScreen$$Lambda$29(editorScreen, rectF, activity);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$cropCloseAnimation$29(this.arg$2, this.arg$3);
    }
}
