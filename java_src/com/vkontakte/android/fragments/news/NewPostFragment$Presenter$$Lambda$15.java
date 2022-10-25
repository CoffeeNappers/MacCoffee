package com.vkontakte.android.fragments.news;

import android.app.AlertDialog;
import android.view.MotionEvent;
import android.view.View;
import com.vkontakte.android.fragments.news.NewPostFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NewPostFragment$Presenter$$Lambda$15 implements View.OnTouchListener {
    private final AlertDialog arg$1;
    private final boolean[] arg$2;

    private NewPostFragment$Presenter$$Lambda$15(AlertDialog alertDialog, boolean[] zArr) {
        this.arg$1 = alertDialog;
        this.arg$2 = zArr;
    }

    public static View.OnTouchListener lambdaFactory$(AlertDialog alertDialog, boolean[] zArr) {
        return new NewPostFragment$Presenter$$Lambda$15(alertDialog, zArr);
    }

    @Override // android.view.View.OnTouchListener
    @LambdaForm.Hidden
    public boolean onTouch(View view, MotionEvent motionEvent) {
        return NewPostFragment.Presenter.lambda$showOptions$15(this.arg$1, this.arg$2, view, motionEvent);
    }
}
