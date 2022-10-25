package com.vkontakte.android.ui.posts;

import android.support.v7.widget.PopupMenu;
import android.view.MenuItem;
import android.view.View;
import com.vkontakte.android.attachments.ShitAttachment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AdBlockPostDisplayItem$$Lambda$1 implements PopupMenu.OnMenuItemClickListener {
    private final AdBlockPostDisplayItem arg$1;
    private final View arg$2;
    private final ShitAttachment arg$3;

    private AdBlockPostDisplayItem$$Lambda$1(AdBlockPostDisplayItem adBlockPostDisplayItem, View view, ShitAttachment shitAttachment) {
        this.arg$1 = adBlockPostDisplayItem;
        this.arg$2 = view;
        this.arg$3 = shitAttachment;
    }

    public static PopupMenu.OnMenuItemClickListener lambdaFactory$(AdBlockPostDisplayItem adBlockPostDisplayItem, View view, ShitAttachment shitAttachment) {
        return new AdBlockPostDisplayItem$$Lambda$1(adBlockPostDisplayItem, view, shitAttachment);
    }

    @Override // android.support.v7.widget.PopupMenu.OnMenuItemClickListener
    @LambdaForm.Hidden
    public boolean onMenuItemClick(MenuItem menuItem) {
        return this.arg$1.lambda$onMenuClicked$0(this.arg$2, this.arg$3, menuItem);
    }
}
