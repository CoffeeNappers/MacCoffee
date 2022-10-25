package com.vkontakte.android.fragments.friends;

import com.vkontakte.android.UserProfile;
import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class FriendsListFragment$$Lambda$4 implements VoidF1 {
    private final FriendsListFragment arg$1;

    private FriendsListFragment$$Lambda$4(FriendsListFragment friendsListFragment) {
        this.arg$1 = friendsListFragment;
    }

    public static VoidF1 lambdaFactory$(FriendsListFragment friendsListFragment) {
        return new FriendsListFragment$$Lambda$4(friendsListFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.lambda$new$0((UserProfile) obj);
    }
}
