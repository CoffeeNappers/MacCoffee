package com.vkontakte.android.ui;

import android.animation.TimeInterpolator;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AttachmentsEditorView$$Lambda$7 implements TimeInterpolator {
    private static final AttachmentsEditorView$$Lambda$7 instance = new AttachmentsEditorView$$Lambda$7();

    private AttachmentsEditorView$$Lambda$7() {
    }

    @Override // android.animation.TimeInterpolator
    @LambdaForm.Hidden
    public float getInterpolation(float f) {
        return AttachmentsEditorView.lambda$resetTransitionAnims$2(f);
    }
}
