package com.vkontakte.android.fragments.market;

import java.lang.invoke.LambdaForm;
import me.grishka.appkit.views.DividerItemDecoration;
/* loaded from: classes.dex */
final /* synthetic */ class MarketFragment$$Lambda$2 implements DividerItemDecoration.Provider {
    private static final MarketFragment$$Lambda$2 instance = new MarketFragment$$Lambda$2();

    private MarketFragment$$Lambda$2() {
    }

    @Override // me.grishka.appkit.views.DividerItemDecoration.Provider
    @LambdaForm.Hidden
    public boolean needDrawDividerAfter(int i) {
        return MarketFragment.lambda$onCreateView$1(i);
    }
}
