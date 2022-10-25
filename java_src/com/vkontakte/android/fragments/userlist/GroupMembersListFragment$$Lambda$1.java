package com.vkontakte.android.fragments.userlist;

import com.vkontakte.android.UserProfile;
import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GroupMembersListFragment$$Lambda$1 implements VoidF1 {
    private final GroupMembersListFragment arg$1;

    private GroupMembersListFragment$$Lambda$1(GroupMembersListFragment groupMembersListFragment) {
        this.arg$1 = groupMembersListFragment;
    }

    public static VoidF1 lambdaFactory$(GroupMembersListFragment groupMembersListFragment) {
        return new GroupMembersListFragment$$Lambda$1(groupMembersListFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.openUserDetails((UserProfile) obj);
    }
}
