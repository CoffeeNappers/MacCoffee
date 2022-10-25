package com.vkontakte.android.fragments.friends;

import com.vkontakte.android.ui.SearchViewWrapper;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class FriendsListFragment$$Lambda$10 implements SearchViewWrapper.ViewStateListener {
    private final FriendsListFragment arg$1;

    private FriendsListFragment$$Lambda$10(FriendsListFragment friendsListFragment) {
        this.arg$1 = friendsListFragment;
    }

    public static SearchViewWrapper.ViewStateListener lambdaFactory$(FriendsListFragment friendsListFragment) {
        return new FriendsListFragment$$Lambda$10(friendsListFragment);
    }

    @Override // com.vkontakte.android.ui.SearchViewWrapper.ViewStateListener
    @LambdaForm.Hidden
    public void onViewExpansionStateChanged(boolean z) {
        this.arg$1.lambda$setSearchView$6(z);
    }
}
