package com.vkontakte.android.fragments.groups;

import com.vkontakte.android.api.Group;
import com.vkontakte.android.fragments.groups.AllGroupsFragment;
import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AllGroupsFragment$Adapter$$Lambda$1 implements VoidF1 {
    private final AllGroupsFragment.Adapter arg$1;

    private AllGroupsFragment$Adapter$$Lambda$1(AllGroupsFragment.Adapter adapter) {
        this.arg$1 = adapter;
    }

    public static VoidF1 lambdaFactory$(AllGroupsFragment.Adapter adapter) {
        return new AllGroupsFragment$Adapter$$Lambda$1(adapter);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.lambda$new$0((Group) obj);
    }
}
