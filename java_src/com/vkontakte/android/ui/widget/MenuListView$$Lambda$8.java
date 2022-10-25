package com.vkontakte.android.ui.widget;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class MenuListView$$Lambda$8 implements Runnable {
    private final MenuListView arg$1;
    private final CharSequence arg$2;

    private MenuListView$$Lambda$8(MenuListView menuListView, CharSequence charSequence) {
        this.arg$1 = menuListView;
        this.arg$2 = charSequence;
    }

    public static Runnable lambdaFactory$(MenuListView menuListView, CharSequence charSequence) {
        return new MenuListView$$Lambda$8(menuListView, charSequence);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$3(this.arg$2);
    }
}
