package com.vkontakte.android.fragments.search;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class QuickSearchFragment$$Lambda$3 implements Runnable {
    private final QuickSearchFragment arg$1;

    private QuickSearchFragment$$Lambda$3(QuickSearchFragment quickSearchFragment) {
        this.arg$1 = quickSearchFragment;
    }

    public static Runnable lambdaFactory$(QuickSearchFragment quickSearchFragment) {
        return new QuickSearchFragment$$Lambda$3(quickSearchFragment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.loadData();
    }
}
