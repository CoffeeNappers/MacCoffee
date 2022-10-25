package com.vkontakte.android.ui;

import android.app.Dialog;
import android.view.MotionEvent;
import android.view.View;
import com.vkontakte.android.ui.animation.RevealLinearLayout;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class ListDialog$$Lambda$1 implements View.OnTouchListener {
    private final RevealLinearLayout arg$1;
    private final Dialog arg$2;

    private ListDialog$$Lambda$1(RevealLinearLayout revealLinearLayout, Dialog dialog) {
        this.arg$1 = revealLinearLayout;
        this.arg$2 = dialog;
    }

    public static View.OnTouchListener lambdaFactory$(RevealLinearLayout revealLinearLayout, Dialog dialog) {
        return new ListDialog$$Lambda$1(revealLinearLayout, dialog);
    }

    @Override // android.view.View.OnTouchListener
    @LambdaForm.Hidden
    public boolean onTouch(View view, MotionEvent motionEvent) {
        return ListDialog.lambda$show$0(this.arg$1, this.arg$2, view, motionEvent);
    }
}
