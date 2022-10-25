package com.vkontakte.android.fragments.news;

import android.view.ViewTreeObserver;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PollEditorFragment$$Lambda$1 implements ViewTreeObserver.OnPreDrawListener {
    private final PollEditorFragment arg$1;

    private PollEditorFragment$$Lambda$1(PollEditorFragment pollEditorFragment) {
        this.arg$1 = pollEditorFragment;
    }

    public static ViewTreeObserver.OnPreDrawListener lambdaFactory$(PollEditorFragment pollEditorFragment) {
        return new PollEditorFragment$$Lambda$1(pollEditorFragment);
    }

    @Override // android.view.ViewTreeObserver.OnPreDrawListener
    @LambdaForm.Hidden
    public boolean onPreDraw() {
        return this.arg$1.lambda$initAnimation$0();
    }
}
