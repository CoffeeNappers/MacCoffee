package com.vkontakte.android.fragments.friends;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class FriendsListFragment$$Lambda$9 implements View.OnClickListener {
    private final FriendsListFragment arg$1;

    private FriendsListFragment$$Lambda$9(FriendsListFragment friendsListFragment) {
        this.arg$1 = friendsListFragment;
    }

    public static View.OnClickListener lambdaFactory$(FriendsListFragment friendsListFragment) {
        return new FriendsListFragment$$Lambda$9(friendsListFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$setSearchView$5(view);
    }
}
