package com.vkontakte.android.fragments.friends;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class FriendsListFragment$$Lambda$11 implements Runnable {
    private final FriendsListFragment arg$1;

    private FriendsListFragment$$Lambda$11(FriendsListFragment friendsListFragment) {
        this.arg$1 = friendsListFragment;
    }

    public static Runnable lambdaFactory$(FriendsListFragment friendsListFragment) {
        return new FriendsListFragment$$Lambda$11(friendsListFragment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        FriendsListFragment.access$lambda$0(this.arg$1);
    }
}
