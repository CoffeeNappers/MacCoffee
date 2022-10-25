package com.vkontakte.android.fragments.search;

import com.vkontakte.android.UserProfile;
import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class QuickSearchFragment$$Lambda$2 implements VoidF1 {
    private final QuickSearchFragment arg$1;

    private QuickSearchFragment$$Lambda$2(QuickSearchFragment quickSearchFragment) {
        this.arg$1 = quickSearchFragment;
    }

    public static VoidF1 lambdaFactory$(QuickSearchFragment quickSearchFragment) {
        return new QuickSearchFragment$$Lambda$2(quickSearchFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.openResult((UserProfile) obj);
    }
}
