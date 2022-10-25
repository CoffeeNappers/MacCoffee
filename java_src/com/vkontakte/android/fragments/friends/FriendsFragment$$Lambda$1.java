package com.vkontakte.android.fragments.friends;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class FriendsFragment$$Lambda$1 implements View.OnClickListener {
    private final FriendsFragment arg$1;

    private FriendsFragment$$Lambda$1(FriendsFragment friendsFragment) {
        this.arg$1 = friendsFragment;
    }

    public static View.OnClickListener lambdaFactory$(FriendsFragment friendsFragment) {
        return new FriendsFragment$$Lambda$1(friendsFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onViewCreated$0(view);
    }
}
