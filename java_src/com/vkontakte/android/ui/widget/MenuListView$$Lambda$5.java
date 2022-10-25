package com.vkontakte.android.ui.widget;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MenuListView$$Lambda$5 implements Runnable {
    private final MenuListView arg$1;

    private MenuListView$$Lambda$5(MenuListView menuListView) {
        this.arg$1 = menuListView;
    }

    public static Runnable lambdaFactory$(MenuListView menuListView) {
        return new MenuListView$$Lambda$5(menuListView);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onAttachedToWindow$5();
    }
}
