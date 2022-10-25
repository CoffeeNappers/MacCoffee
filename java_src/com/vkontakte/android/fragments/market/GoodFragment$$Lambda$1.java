package com.vkontakte.android.fragments.market;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GoodFragment$$Lambda$1 implements View.OnLayoutChangeListener {
    private final GoodFragment arg$1;

    private GoodFragment$$Lambda$1(GoodFragment goodFragment) {
        this.arg$1 = goodFragment;
    }

    public static View.OnLayoutChangeListener lambdaFactory$(GoodFragment goodFragment) {
        return new GoodFragment$$Lambda$1(goodFragment);
    }

    @Override // android.view.View.OnLayoutChangeListener
    @LambdaForm.Hidden
    public void onLayoutChange(View view, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
        this.arg$1.lambda$onCreateContentView$0(view, i, i2, i3, i4, i5, i6, i7, i8);
    }
}
