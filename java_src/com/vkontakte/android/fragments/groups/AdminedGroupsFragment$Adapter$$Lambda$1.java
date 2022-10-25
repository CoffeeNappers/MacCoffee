package com.vkontakte.android.fragments.groups;

import com.vkontakte.android.api.Group;
import com.vkontakte.android.fragments.groups.AdminedGroupsFragment;
import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AdminedGroupsFragment$Adapter$$Lambda$1 implements VoidF1 {
    private final AdminedGroupsFragment.Adapter arg$1;

    private AdminedGroupsFragment$Adapter$$Lambda$1(AdminedGroupsFragment.Adapter adapter) {
        this.arg$1 = adapter;
    }

    public static VoidF1 lambdaFactory$(AdminedGroupsFragment.Adapter adapter) {
        return new AdminedGroupsFragment$Adapter$$Lambda$1(adapter);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.lambda$new$0((Group) obj);
    }
}
