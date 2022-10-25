package com.vkontakte.android.fragments.friends;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class FriendsListFragment$$Lambda$8 implements Runnable {
    private final FriendsListFragment arg$1;

    private FriendsListFragment$$Lambda$8(FriendsListFragment friendsListFragment) {
        this.arg$1 = friendsListFragment;
    }

    public static Runnable lambdaFactory$(FriendsListFragment friendsListFragment) {
        return new FriendsListFragment$$Lambda$8(friendsListFragment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$scrollToTop$4();
    }
}
