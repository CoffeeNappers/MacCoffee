package com.vkontakte.android.fragments.groups;

import com.vkontakte.android.api.GroupInvitation;
import com.vkontakte.android.functions.VoidF2Int;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GroupInvitesFragment$$Lambda$2 implements VoidF2Int {
    private final GroupInvitesFragment arg$1;

    private GroupInvitesFragment$$Lambda$2(GroupInvitesFragment groupInvitesFragment) {
        this.arg$1 = groupInvitesFragment;
    }

    public static VoidF2Int lambdaFactory$(GroupInvitesFragment groupInvitesFragment) {
        return new GroupInvitesFragment$$Lambda$2(groupInvitesFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF2Int
    @LambdaForm.Hidden
    public void f(Object obj, Object obj2, int i) {
        this.arg$1.lambda$new$1((GroupInvitation) obj, (Boolean) obj2, i);
    }
}
