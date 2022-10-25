package com.vk.attachpicker.screen;

import com.vkontakte.android.functions.F0;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class EditorScreen$$Lambda$20 implements F0 {
    private final EditorScreen arg$1;

    private EditorScreen$$Lambda$20(EditorScreen editorScreen) {
        this.arg$1 = editorScreen;
    }

    public static F0 lambdaFactory$(EditorScreen editorScreen) {
        return new EditorScreen$$Lambda$20(editorScreen);
    }

    @Override // com.vkontakte.android.functions.F0
    @LambdaForm.Hidden
    public Object f() {
        return this.arg$1.lambda$renderAndFinish$19();
    }
}
