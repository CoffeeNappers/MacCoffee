package com.vkontakte.android;

import android.view.MenuItem;
import android.widget.PopupMenu;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GameCardActivity$$Lambda$1 implements PopupMenu.OnMenuItemClickListener {
    private final GameCardActivity arg$1;

    private GameCardActivity$$Lambda$1(GameCardActivity gameCardActivity) {
        this.arg$1 = gameCardActivity;
    }

    public static PopupMenu.OnMenuItemClickListener lambdaFactory$(GameCardActivity gameCardActivity) {
        return new GameCardActivity$$Lambda$1(gameCardActivity);
    }

    @Override // android.widget.PopupMenu.OnMenuItemClickListener
    @LambdaForm.Hidden
    public boolean onMenuItemClick(MenuItem menuItem) {
        return this.arg$1.lambda$openActionMenu$1(menuItem);
    }
}
