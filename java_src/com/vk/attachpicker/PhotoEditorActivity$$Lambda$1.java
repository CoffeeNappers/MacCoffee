package com.vk.attachpicker;

import android.view.View;
import android.view.ViewTreeObserver;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PhotoEditorActivity$$Lambda$1 implements ViewTreeObserver.OnGlobalLayoutListener {
    private final PhotoEditorActivity arg$1;
    private final View arg$2;

    private PhotoEditorActivity$$Lambda$1(PhotoEditorActivity photoEditorActivity, View view) {
        this.arg$1 = photoEditorActivity;
        this.arg$2 = view;
    }

    public static ViewTreeObserver.OnGlobalLayoutListener lambdaFactory$(PhotoEditorActivity photoEditorActivity, View view) {
        return new PhotoEditorActivity$$Lambda$1(photoEditorActivity, view);
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    @LambdaForm.Hidden
    public void onGlobalLayout() {
        this.arg$1.lambda$onCreate$0(this.arg$2);
    }
}
