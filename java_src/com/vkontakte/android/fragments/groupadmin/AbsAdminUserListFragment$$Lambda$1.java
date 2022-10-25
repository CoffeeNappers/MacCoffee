package com.vkontakte.android.fragments.groupadmin;

import android.view.View;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.functions.VoidF2;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AbsAdminUserListFragment$$Lambda$1 implements VoidF2 {
    private final AbsAdminUserListFragment arg$1;

    private AbsAdminUserListFragment$$Lambda$1(AbsAdminUserListFragment absAdminUserListFragment) {
        this.arg$1 = absAdminUserListFragment;
    }

    public static VoidF2 lambdaFactory$(AbsAdminUserListFragment absAdminUserListFragment) {
        return new AbsAdminUserListFragment$$Lambda$1(absAdminUserListFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF2
    @LambdaForm.Hidden
    public void f(Object obj, Object obj2) {
        this.arg$1.onItemButtonClick((View) obj, (UserProfile) obj2);
    }
}
