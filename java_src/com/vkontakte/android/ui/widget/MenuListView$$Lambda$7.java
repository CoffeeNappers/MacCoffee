package com.vkontakte.android.ui.widget;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class MenuListView$$Lambda$7 implements Runnable {
    private final MenuListView arg$1;

    private MenuListView$$Lambda$7(MenuListView menuListView) {
        this.arg$1 = menuListView;
    }

    public static Runnable lambdaFactory$(MenuListView menuListView) {
        return new MenuListView$$Lambda$7(menuListView);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$updateList$7();
    }
}
