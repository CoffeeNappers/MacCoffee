package com.vkontakte.android.fragments.friends;

import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class FriendsFragment$$Lambda$4 implements VoidF1 {
    private final FriendsFragment arg$1;

    private FriendsFragment$$Lambda$4(FriendsFragment friendsFragment) {
        this.arg$1 = friendsFragment;
    }

    public static VoidF1 lambdaFactory$(FriendsFragment friendsFragment) {
        return new FriendsFragment$$Lambda$4(friendsFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.lambda$onViewCreated$3((ArrayList) obj);
    }
}
