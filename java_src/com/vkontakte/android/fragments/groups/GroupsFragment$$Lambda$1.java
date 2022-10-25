package com.vkontakte.android.fragments.groups;

import com.vkontakte.android.api.Group;
import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GroupsFragment$$Lambda$1 implements VoidF1 {
    private final GroupsFragment arg$1;

    private GroupsFragment$$Lambda$1(GroupsFragment groupsFragment) {
        this.arg$1 = groupsFragment;
    }

    public static VoidF1 lambdaFactory$(GroupsFragment groupsFragment) {
        return new GroupsFragment$$Lambda$1(groupsFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.lambda$onViewCreated$0((Group) obj);
    }
}
