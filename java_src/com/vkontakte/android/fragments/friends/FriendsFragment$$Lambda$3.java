package com.vkontakte.android.fragments.friends;

import com.vkontakte.android.UserProfile;
import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class FriendsFragment$$Lambda$3 implements VoidF1 {
    private final FriendsFragment arg$1;

    private FriendsFragment$$Lambda$3(FriendsFragment friendsFragment) {
        this.arg$1 = friendsFragment;
    }

    public static VoidF1 lambdaFactory$(FriendsFragment friendsFragment) {
        return new FriendsFragment$$Lambda$3(friendsFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.lambda$onViewCreated$2((UserProfile) obj);
    }
}
