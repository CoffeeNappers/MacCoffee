package com.vkontakte.android.ui.holder.gamepage;

import android.widget.CompoundButton;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GameIconButtonHolder$$Lambda$1 implements CompoundButton.OnCheckedChangeListener {
    private final GameIconButtonHolder arg$1;

    private GameIconButtonHolder$$Lambda$1(GameIconButtonHolder gameIconButtonHolder) {
        this.arg$1 = gameIconButtonHolder;
    }

    public static CompoundButton.OnCheckedChangeListener lambdaFactory$(GameIconButtonHolder gameIconButtonHolder) {
        return new GameIconButtonHolder$$Lambda$1(gameIconButtonHolder);
    }

    @Override // android.widget.CompoundButton.OnCheckedChangeListener
    @LambdaForm.Hidden
    public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
        this.arg$1.lambda$new$0(compoundButton, z);
    }
}
