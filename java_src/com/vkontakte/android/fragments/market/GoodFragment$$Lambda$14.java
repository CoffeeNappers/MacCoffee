package com.vkontakte.android.fragments.market;

import android.view.MenuItem;
import android.widget.PopupMenu;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class GoodFragment$$Lambda$14 implements PopupMenu.OnMenuItemClickListener {
    private final GoodFragment arg$1;

    private GoodFragment$$Lambda$14(GoodFragment goodFragment) {
        this.arg$1 = goodFragment;
    }

    public static PopupMenu.OnMenuItemClickListener lambdaFactory$(GoodFragment goodFragment) {
        return new GoodFragment$$Lambda$14(goodFragment);
    }

    @Override // android.widget.PopupMenu.OnMenuItemClickListener
    @LambdaForm.Hidden
    public boolean onMenuItemClick(MenuItem menuItem) {
        return this.arg$1.lambda$null$3(menuItem);
    }
}
