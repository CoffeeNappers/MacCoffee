package com.vkontakte.android.fragments.market;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MarketFragment$$Lambda$1 implements View.OnClickListener {
    private final MarketFragment arg$1;

    private MarketFragment$$Lambda$1(MarketFragment marketFragment) {
        this.arg$1 = marketFragment;
    }

    public static View.OnClickListener lambdaFactory$(MarketFragment marketFragment) {
        return new MarketFragment$$Lambda$1(marketFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$0(view);
    }
}
