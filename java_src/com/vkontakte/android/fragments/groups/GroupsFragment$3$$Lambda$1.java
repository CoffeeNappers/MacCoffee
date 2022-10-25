package com.vkontakte.android.fragments.groups;

import com.vkontakte.android.api.Group;
import com.vkontakte.android.fragments.groups.GroupsFragment;
import java.lang.invoke.LambdaForm;
import java.util.Comparator;
/* loaded from: classes.dex */
final /* synthetic */ class GroupsFragment$3$$Lambda$1 implements Comparator {
    private static final GroupsFragment$3$$Lambda$1 instance = new GroupsFragment$3$$Lambda$1();

    private GroupsFragment$3$$Lambda$1() {
    }

    @Override // java.util.Comparator
    @LambdaForm.Hidden
    public int compare(Object obj, Object obj2) {
        return GroupsFragment.AnonymousClass3.lambda$run$0((Group) obj, (Group) obj2);
    }
}
