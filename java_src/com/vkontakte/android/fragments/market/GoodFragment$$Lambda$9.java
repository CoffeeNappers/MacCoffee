package com.vkontakte.android.fragments.market;

import java.lang.invoke.LambdaForm;
import me.grishka.appkit.views.DividerItemDecoration;
/* loaded from: classes.dex */
final /* synthetic */ class GoodFragment$$Lambda$9 implements DividerItemDecoration.Provider {
    private final GoodFragment arg$1;

    private GoodFragment$$Lambda$9(GoodFragment goodFragment) {
        this.arg$1 = goodFragment;
    }

    public static DividerItemDecoration.Provider lambdaFactory$(GoodFragment goodFragment) {
        return new GoodFragment$$Lambda$9(goodFragment);
    }

    @Override // me.grishka.appkit.views.DividerItemDecoration.Provider
    @LambdaForm.Hidden
    public boolean needDrawDividerAfter(int i) {
        return this.arg$1.lambda$onViewCreated$9(i);
    }
}