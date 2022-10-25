package com.vkontakte.android.fragments;

import android.support.v7.widget.Toolbar;
import android.view.MenuItem;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MaterialPreferenceToolbarFragment$$Lambda$2 implements Toolbar.OnMenuItemClickListener {
    private final MaterialPreferenceToolbarFragment arg$1;

    private MaterialPreferenceToolbarFragment$$Lambda$2(MaterialPreferenceToolbarFragment materialPreferenceToolbarFragment) {
        this.arg$1 = materialPreferenceToolbarFragment;
    }

    public static Toolbar.OnMenuItemClickListener lambdaFactory$(MaterialPreferenceToolbarFragment materialPreferenceToolbarFragment) {
        return new MaterialPreferenceToolbarFragment$$Lambda$2(materialPreferenceToolbarFragment);
    }

    @Override // android.support.v7.widget.Toolbar.OnMenuItemClickListener
    @LambdaForm.Hidden
    public boolean onMenuItemClick(MenuItem menuItem) {
        return this.arg$1.onOptionsItemSelected(menuItem);
    }
}
