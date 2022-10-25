package com.vkontakte.android.fragments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GameCardFragment$$Lambda$2 implements View.OnClickListener {
    private final GameCardFragment arg$1;

    private GameCardFragment$$Lambda$2(GameCardFragment gameCardFragment) {
        this.arg$1 = gameCardFragment;
    }

    public static View.OnClickListener lambdaFactory$(GameCardFragment gameCardFragment) {
        return new GameCardFragment$$Lambda$2(gameCardFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onViewCreated$1(view);
    }
}
