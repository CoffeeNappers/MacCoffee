package com.vk.attachpicker;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class EditorAnalytics$$Lambda$1 implements Runnable {
    private final EditorAnalytics arg$1;

    private EditorAnalytics$$Lambda$1(EditorAnalytics editorAnalytics) {
        this.arg$1 = editorAnalytics;
    }

    public static Runnable lambdaFactory$(EditorAnalytics editorAnalytics) {
        return new EditorAnalytics$$Lambda$1(editorAnalytics);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$flush$0();
    }
}
