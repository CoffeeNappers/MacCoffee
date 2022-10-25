package com.vkontakte.android.fragments.market;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MarketFilterPriceFragment$$Lambda$1 implements View.OnClickListener {
    private final MarketFilterPriceFragment arg$1;

    private MarketFilterPriceFragment$$Lambda$1(MarketFilterPriceFragment marketFilterPriceFragment) {
        this.arg$1 = marketFilterPriceFragment;
    }

    public static View.OnClickListener lambdaFactory$(MarketFilterPriceFragment marketFilterPriceFragment) {
        return new MarketFilterPriceFragment$$Lambda$1(marketFilterPriceFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onViewCreated$0(view);
    }
}
