package com.vkontakte.android.fragments;

import android.view.MenuItem;
import android.widget.PopupMenu;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ProfileFragment$$Lambda$44 implements PopupMenu.OnMenuItemClickListener {
    private final ProfileFragment arg$1;

    private ProfileFragment$$Lambda$44(ProfileFragment profileFragment) {
        this.arg$1 = profileFragment;
    }

    public static PopupMenu.OnMenuItemClickListener lambdaFactory$(ProfileFragment profileFragment) {
        return new ProfileFragment$$Lambda$44(profileFragment);
    }

    @Override // android.widget.PopupMenu.OnMenuItemClickListener
    @LambdaForm.Hidden
    public boolean onMenuItemClick(MenuItem menuItem) {
        return this.arg$1.lambda$null$10(menuItem);
    }
}
