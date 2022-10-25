package com.vkontakte.android.fragments;

import android.view.MenuItem;
import android.view.View;
import android.widget.PopupMenu;
import com.vkontakte.android.fragments.ProfileFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ProfileFragment$4$$Lambda$1 implements PopupMenu.OnMenuItemClickListener {
    private final ProfileFragment.AnonymousClass4 arg$1;
    private final View arg$2;

    private ProfileFragment$4$$Lambda$1(ProfileFragment.AnonymousClass4 anonymousClass4, View view) {
        this.arg$1 = anonymousClass4;
        this.arg$2 = view;
    }

    public static PopupMenu.OnMenuItemClickListener lambdaFactory$(ProfileFragment.AnonymousClass4 anonymousClass4, View view) {
        return new ProfileFragment$4$$Lambda$1(anonymousClass4, view);
    }

    @Override // android.widget.PopupMenu.OnMenuItemClickListener
    @LambdaForm.Hidden
    public boolean onMenuItemClick(MenuItem menuItem) {
        return this.arg$1.lambda$onClick$0(this.arg$2, menuItem);
    }
}
