package com.vkontakte.android.fragments.friends;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class FriendsFragment$$Lambda$5 implements Runnable {
    private final FriendsFragment arg$1;

    private FriendsFragment$$Lambda$5(FriendsFragment friendsFragment) {
        this.arg$1 = friendsFragment;
    }

    public static Runnable lambdaFactory$(FriendsFragment friendsFragment) {
        return new FriendsFragment$$Lambda$5(friendsFragment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        FriendsFragment.access$lambda$0(this.arg$1);
    }
}
