package com.vk.attachpicker.screen;

import android.animation.ValueAnimator;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class EditorScreen$$Lambda$38 implements ValueAnimator.AnimatorUpdateListener {
    private final EditorScreen arg$1;

    private EditorScreen$$Lambda$38(EditorScreen editorScreen) {
        this.arg$1 = editorScreen;
    }

    public static ValueAnimator.AnimatorUpdateListener lambdaFactory$(EditorScreen editorScreen) {
        return new EditorScreen$$Lambda$38(editorScreen);
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    @LambdaForm.Hidden
    public void onAnimationUpdate(ValueAnimator valueAnimator) {
        this.arg$1.lambda$null$27(valueAnimator);
    }
}
