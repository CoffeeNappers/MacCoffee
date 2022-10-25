package com.vkontakte.android.ui.widget;

import java.lang.invoke.LambdaForm;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class MenuListView$$Lambda$6 implements Runnable {
    private final MenuListView arg$1;
    private final List arg$2;
    private final List arg$3;

    private MenuListView$$Lambda$6(MenuListView menuListView, List list, List list2) {
        this.arg$1 = menuListView;
        this.arg$2 = list;
        this.arg$3 = list2;
    }

    public static Runnable lambdaFactory$(MenuListView menuListView, List list, List list2) {
        return new MenuListView$$Lambda$6(menuListView, list, list2);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$update$6(this.arg$2, this.arg$3);
    }
}
