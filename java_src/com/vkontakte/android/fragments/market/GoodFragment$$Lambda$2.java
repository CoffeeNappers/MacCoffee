package com.vkontakte.android.fragments.market;

import android.view.KeyEvent;
import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GoodFragment$$Lambda$2 implements View.OnKeyListener {
    private final GoodFragment arg$1;

    private GoodFragment$$Lambda$2(GoodFragment goodFragment) {
        this.arg$1 = goodFragment;
    }

    public static View.OnKeyListener lambdaFactory$(GoodFragment goodFragment) {
        return new GoodFragment$$Lambda$2(goodFragment);
    }

    @Override // android.view.View.OnKeyListener
    @LambdaForm.Hidden
    public boolean onKey(View view, int i, KeyEvent keyEvent) {
        return this.arg$1.lambda$onCreateContentView$1(view, i, keyEvent);
    }
}
