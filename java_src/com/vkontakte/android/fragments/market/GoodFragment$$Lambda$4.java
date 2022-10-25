package com.vkontakte.android.fragments.market;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GoodFragment$$Lambda$4 implements View.OnLongClickListener {
    private final GoodFragment arg$1;

    private GoodFragment$$Lambda$4(GoodFragment goodFragment) {
        this.arg$1 = goodFragment;
    }

    public static View.OnLongClickListener lambdaFactory$(GoodFragment goodFragment) {
        return new GoodFragment$$Lambda$4(goodFragment);
    }

    @Override // android.view.View.OnLongClickListener
    @LambdaForm.Hidden
    public boolean onLongClick(View view) {
        return this.arg$1.lambda$onCreateContentView$4(view);
    }
}
