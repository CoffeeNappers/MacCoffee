package com.vkontakte.android.ui.util;

import android.graphics.drawable.TransitionDrawable;
import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class HightlightHelper$$Lambda$1 implements Runnable {
    private final TransitionDrawable arg$1;
    private final View arg$2;

    private HightlightHelper$$Lambda$1(TransitionDrawable transitionDrawable, View view) {
        this.arg$1 = transitionDrawable;
        this.arg$2 = view;
    }

    public static Runnable lambdaFactory$(TransitionDrawable transitionDrawable, View view) {
        return new HightlightHelper$$Lambda$1(transitionDrawable, view);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        HightlightHelper.lambda$highlight$0(this.arg$1, this.arg$2);
    }
}
