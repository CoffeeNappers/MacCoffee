package com.vkontakte.android.fragments.friends;

import com.vkontakte.android.ui.SearchViewWrapper;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class FriendsFragment$$Lambda$2 implements SearchViewWrapper.ViewStateListener {
    private final FriendsFragment arg$1;

    private FriendsFragment$$Lambda$2(FriendsFragment friendsFragment) {
        this.arg$1 = friendsFragment;
    }

    public static SearchViewWrapper.ViewStateListener lambdaFactory$(FriendsFragment friendsFragment) {
        return new FriendsFragment$$Lambda$2(friendsFragment);
    }

    @Override // com.vkontakte.android.ui.SearchViewWrapper.ViewStateListener
    @LambdaForm.Hidden
    public void onViewExpansionStateChanged(boolean z) {
        this.arg$1.lambda$onViewCreated$1(z);
    }
}
