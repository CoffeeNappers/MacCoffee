package com.vkontakte.android.fragments;

import android.view.MenuItem;
import android.widget.PopupMenu;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ProfileFragment$$Lambda$41 implements PopupMenu.OnMenuItemClickListener {
    private final ProfileFragment arg$1;

    private ProfileFragment$$Lambda$41(ProfileFragment profileFragment) {
        this.arg$1 = profileFragment;
    }

    public static PopupMenu.OnMenuItemClickListener lambdaFactory$(ProfileFragment profileFragment) {
        return new ProfileFragment$$Lambda$41(profileFragment);
    }

    @Override // android.widget.PopupMenu.OnMenuItemClickListener
    @LambdaForm.Hidden
    public boolean onMenuItemClick(MenuItem menuItem) {
        return this.arg$1.lambda$showChangeEventDecisionOptions$40(menuItem);
    }
}
