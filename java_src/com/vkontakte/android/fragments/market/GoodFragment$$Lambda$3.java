package com.vkontakte.android.fragments.market;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GoodFragment$$Lambda$3 implements View.OnClickListener {
    private final GoodFragment arg$1;

    private GoodFragment$$Lambda$3(GoodFragment goodFragment) {
        this.arg$1 = goodFragment;
    }

    public static View.OnClickListener lambdaFactory$(GoodFragment goodFragment) {
        return new GoodFragment$$Lambda$3(goodFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreateContentView$2(view);
    }
}
