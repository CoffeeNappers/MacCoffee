package com.vkontakte.android.fragments;

import java.lang.invoke.LambdaForm;
import me.grishka.appkit.views.DividerItemDecoration;
/* loaded from: classes.dex */
final /* synthetic */ class GamesFeedFragment$$Lambda$1 implements DividerItemDecoration.Provider {
    private final GamesFeedFragment arg$1;

    private GamesFeedFragment$$Lambda$1(GamesFeedFragment gamesFeedFragment) {
        this.arg$1 = gamesFeedFragment;
    }

    public static DividerItemDecoration.Provider lambdaFactory$(GamesFeedFragment gamesFeedFragment) {
        return new GamesFeedFragment$$Lambda$1(gamesFeedFragment);
    }

    @Override // me.grishka.appkit.views.DividerItemDecoration.Provider
    @LambdaForm.Hidden
    public boolean needDrawDividerAfter(int i) {
        return this.arg$1.lambda$onCreateContentView$0(i);
    }
}
