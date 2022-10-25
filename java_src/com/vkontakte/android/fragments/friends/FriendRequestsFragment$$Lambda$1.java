package com.vkontakte.android.fragments.friends;

import com.vkontakte.android.UserProfile;
import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class FriendRequestsFragment$$Lambda$1 implements VoidF1 {
    private final FriendRequestsFragment arg$1;

    private FriendRequestsFragment$$Lambda$1(FriendRequestsFragment friendRequestsFragment) {
        this.arg$1 = friendRequestsFragment;
    }

    public static VoidF1 lambdaFactory$(FriendRequestsFragment friendRequestsFragment) {
        return new FriendRequestsFragment$$Lambda$1(friendRequestsFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.openUserDetails((UserProfile) obj);
    }
}
