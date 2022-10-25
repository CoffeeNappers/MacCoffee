package com.vkontakte.android.fragments.friends;

import com.vkontakte.android.RequestUserProfile;
import com.vkontakte.android.functions.VoidF2Int;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class FriendsListFragment$$Lambda$2 implements VoidF2Int {
    private final FriendsListFragment arg$1;

    private FriendsListFragment$$Lambda$2(FriendsListFragment friendsListFragment) {
        this.arg$1 = friendsListFragment;
    }

    public static VoidF2Int lambdaFactory$(FriendsListFragment friendsListFragment) {
        return new FriendsListFragment$$Lambda$2(friendsListFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF2Int
    @LambdaForm.Hidden
    public void f(Object obj, Object obj2, int i) {
        this.arg$1.accept((RequestUserProfile) obj, ((Boolean) obj2).booleanValue(), i);
    }
}
