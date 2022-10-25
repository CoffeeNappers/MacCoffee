package com.vkontakte.android.activities;

import android.support.v7.widget.PopupMenu;
import android.view.MenuItem;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BaseVideoActivity$$Lambda$7 implements PopupMenu.OnMenuItemClickListener {
    private final BaseVideoActivity arg$1;

    private BaseVideoActivity$$Lambda$7(BaseVideoActivity baseVideoActivity) {
        this.arg$1 = baseVideoActivity;
    }

    public static PopupMenu.OnMenuItemClickListener lambdaFactory$(BaseVideoActivity baseVideoActivity) {
        return new BaseVideoActivity$$Lambda$7(baseVideoActivity);
    }

    @Override // android.support.v7.widget.PopupMenu.OnMenuItemClickListener
    @LambdaForm.Hidden
    public boolean onMenuItemClick(MenuItem menuItem) {
        return this.arg$1.lambda$showAddMenu$6(menuItem);
    }
}
