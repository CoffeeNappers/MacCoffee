package com.vkontakte.android.ui.widget;

import android.app.Activity;
import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MenuListView$$Lambda$1 implements View.OnClickListener {
    private final MenuListView arg$1;
    private final Activity arg$2;

    private MenuListView$$Lambda$1(MenuListView menuListView, Activity activity) {
        this.arg$1 = menuListView;
        this.arg$2 = activity;
    }

    public static View.OnClickListener lambdaFactory$(MenuListView menuListView, Activity activity) {
        return new MenuListView$$Lambda$1(menuListView, activity);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$init$0(this.arg$2, view);
    }
}
