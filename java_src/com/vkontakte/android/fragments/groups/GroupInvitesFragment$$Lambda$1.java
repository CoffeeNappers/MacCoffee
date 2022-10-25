package com.vkontakte.android.fragments.groups;

import com.vkontakte.android.api.Group;
import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GroupInvitesFragment$$Lambda$1 implements VoidF1 {
    private final GroupInvitesFragment arg$1;

    private GroupInvitesFragment$$Lambda$1(GroupInvitesFragment groupInvitesFragment) {
        this.arg$1 = groupInvitesFragment;
    }

    public static VoidF1 lambdaFactory$(GroupInvitesFragment groupInvitesFragment) {
        return new GroupInvitesFragment$$Lambda$1(groupInvitesFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.openGroupDetails((Group) obj);
    }
}
