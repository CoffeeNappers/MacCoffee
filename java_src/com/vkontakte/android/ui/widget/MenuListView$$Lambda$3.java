package com.vkontakte.android.ui.widget;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class MenuListView$$Lambda$3 implements View.OnClickListener {
    private final MenuListView arg$1;

    private MenuListView$$Lambda$3(MenuListView menuListView) {
        this.arg$1 = menuListView;
    }

    public static View.OnClickListener lambdaFactory$(MenuListView menuListView) {
        return new MenuListView$$Lambda$3(menuListView);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$init$2(view);
    }
}
