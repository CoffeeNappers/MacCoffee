package com.vkontakte.android.fragments.groups;

import com.vkontakte.android.api.Group;
import com.vkontakte.android.fragments.groups.GroupsFragment;
import java.lang.invoke.LambdaForm;
import java.util.Comparator;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class GroupsFragment$3$$Lambda$3 implements Comparator {
    private static final GroupsFragment$3$$Lambda$3 instance = new GroupsFragment$3$$Lambda$3();

    private GroupsFragment$3$$Lambda$3() {
    }

    @Override // java.util.Comparator
    @LambdaForm.Hidden
    public int compare(Object obj, Object obj2) {
        return GroupsFragment.AnonymousClass3.lambda$null$1((Group) obj, (Group) obj2);
    }
}
