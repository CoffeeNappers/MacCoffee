package com.vkontakte.android.fragments;

import com.vkontakte.android.UserProfile;
import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class FilterListFragment$$Lambda$2 implements VoidF1 {
    private final FilterListFragment arg$1;

    private FilterListFragment$$Lambda$2(FilterListFragment filterListFragment) {
        this.arg$1 = filterListFragment;
    }

    public static VoidF1 lambdaFactory$(FilterListFragment filterListFragment) {
        return new FilterListFragment$$Lambda$2(filterListFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.onItemClick((UserProfile) obj);
    }
}
