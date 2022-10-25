package com.vkontakte.android.fragments;

import java.lang.invoke.LambdaForm;
import me.grishka.appkit.views.DividerItemDecoration;
/* loaded from: classes.dex */
final /* synthetic */ class GamesRequestFragment$$Lambda$1 implements DividerItemDecoration.Provider {
    private final GamesRequestFragment arg$1;

    private GamesRequestFragment$$Lambda$1(GamesRequestFragment gamesRequestFragment) {
        this.arg$1 = gamesRequestFragment;
    }

    public static DividerItemDecoration.Provider lambdaFactory$(GamesRequestFragment gamesRequestFragment) {
        return new GamesRequestFragment$$Lambda$1(gamesRequestFragment);
    }

    @Override // me.grishka.appkit.views.DividerItemDecoration.Provider
    @LambdaForm.Hidden
    public boolean needDrawDividerAfter(int i) {
        return this.arg$1.lambda$onCreateContentView$0(i);
    }
}
