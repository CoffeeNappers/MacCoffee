package com.vkontakte.android.fragments.friends;

import com.vkontakte.android.UserProfile;
import com.vkontakte.android.functions.VoidF1Bool;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class FriendsListFragment$$Lambda$5 implements VoidF1Bool {
    private final FriendsListFragment arg$1;

    private FriendsListFragment$$Lambda$5(FriendsListFragment friendsListFragment) {
        this.arg$1 = friendsListFragment;
    }

    public static VoidF1Bool lambdaFactory$(FriendsListFragment friendsListFragment) {
        return new FriendsListFragment$$Lambda$5(friendsListFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF1Bool
    @LambdaForm.Hidden
    public void f(Object obj, boolean z) {
        this.arg$1.lambda$new$1((UserProfile) obj, z);
    }
}
