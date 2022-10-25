package com.vkontakte.android.ui.navigation;

import com.vkontakte.android.ui.navigation.NavigationDelegateLeftMenu;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NavigationDelegateLeftMenu$1$$Lambda$1 implements Runnable {
    private final NavigationDelegateLeftMenu.AnonymousClass1 arg$1;

    private NavigationDelegateLeftMenu$1$$Lambda$1(NavigationDelegateLeftMenu.AnonymousClass1 anonymousClass1) {
        this.arg$1 = anonymousClass1;
    }

    public static Runnable lambdaFactory$(NavigationDelegateLeftMenu.AnonymousClass1 anonymousClass1) {
        return new NavigationDelegateLeftMenu$1$$Lambda$1(anonymousClass1);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onMenuClosed$0();
    }
}
