package com.vkontakte.android.fragments.friends;

import com.vkontakte.android.UserProfile;
import java.lang.invoke.LambdaForm;
import java.util.Comparator;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class FriendsListFragment$$Lambda$6 implements Comparator {
    private final FriendsListFragment arg$1;

    private FriendsListFragment$$Lambda$6(FriendsListFragment friendsListFragment) {
        this.arg$1 = friendsListFragment;
    }

    public static Comparator lambdaFactory$(FriendsListFragment friendsListFragment) {
        return new FriendsListFragment$$Lambda$6(friendsListFragment);
    }

    @Override // java.util.Comparator
    @LambdaForm.Hidden
    public int compare(Object obj, Object obj2) {
        return this.arg$1.lambda$updateData$2((UserProfile) obj, (UserProfile) obj2);
    }
}
