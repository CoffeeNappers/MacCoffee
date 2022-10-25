package com.vkontakte.android.ui.posts;

import android.support.v7.widget.PopupMenu;
import android.view.MenuItem;
import android.view.View;
import com.vkontakte.android.functions.F0;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class HeaderPostDisplayItem$$Lambda$3 implements PopupMenu.OnMenuItemClickListener {
    private final HeaderPostDisplayItem arg$1;
    private final View arg$2;
    private final F0 arg$3;

    private HeaderPostDisplayItem$$Lambda$3(HeaderPostDisplayItem headerPostDisplayItem, View view, F0 f0) {
        this.arg$1 = headerPostDisplayItem;
        this.arg$2 = view;
        this.arg$3 = f0;
    }

    public static PopupMenu.OnMenuItemClickListener lambdaFactory$(HeaderPostDisplayItem headerPostDisplayItem, View view, F0 f0) {
        return new HeaderPostDisplayItem$$Lambda$3(headerPostDisplayItem, view, f0);
    }

    @Override // android.support.v7.widget.PopupMenu.OnMenuItemClickListener
    @LambdaForm.Hidden
    public boolean onMenuItemClick(MenuItem menuItem) {
        return this.arg$1.lambda$showUnSubscribeMenu$2(this.arg$2, this.arg$3, menuItem);
    }
}
