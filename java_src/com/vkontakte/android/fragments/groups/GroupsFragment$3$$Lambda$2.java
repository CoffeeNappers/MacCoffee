package com.vkontakte.android.fragments.groups;

import com.vkontakte.android.fragments.groups.GroupsFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GroupsFragment$3$$Lambda$2 implements Runnable {
    private final GroupsFragment.AnonymousClass3 arg$1;

    private GroupsFragment$3$$Lambda$2(GroupsFragment.AnonymousClass3 anonymousClass3) {
        this.arg$1 = anonymousClass3;
    }

    public static Runnable lambdaFactory$(GroupsFragment.AnonymousClass3 anonymousClass3) {
        return new GroupsFragment$3$$Lambda$2(anonymousClass3);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$run$2();
    }
}
