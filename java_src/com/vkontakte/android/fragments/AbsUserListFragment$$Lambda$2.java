package com.vkontakte.android.fragments;

import com.vkontakte.android.UserProfile;
import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AbsUserListFragment$$Lambda$2 implements VoidF1 {
    private final AbsUserListFragment arg$1;

    private AbsUserListFragment$$Lambda$2(AbsUserListFragment absUserListFragment) {
        this.arg$1 = absUserListFragment;
    }

    public static VoidF1 lambdaFactory$(AbsUserListFragment absUserListFragment) {
        return new AbsUserListFragment$$Lambda$2(absUserListFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.onItemClick((UserProfile) obj);
    }
}