package com.vkontakte.android.fragments.friends;

import com.vkontakte.android.RequestUserProfile;
import com.vkontakte.android.functions.VoidF2Int;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class FriendRequestsFragment$$Lambda$2 implements VoidF2Int {
    private final FriendRequestsFragment arg$1;

    private FriendRequestsFragment$$Lambda$2(FriendRequestsFragment friendRequestsFragment) {
        this.arg$1 = friendRequestsFragment;
    }

    public static VoidF2Int lambdaFactory$(FriendRequestsFragment friendRequestsFragment) {
        return new FriendRequestsFragment$$Lambda$2(friendRequestsFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF2Int
    @LambdaForm.Hidden
    public void f(Object obj, Object obj2, int i) {
        this.arg$1.accept((RequestUserProfile) obj, ((Boolean) obj2).booleanValue(), i);
    }
}
