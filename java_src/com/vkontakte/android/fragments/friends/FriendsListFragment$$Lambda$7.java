package com.vkontakte.android.fragments.friends;

import com.vkontakte.android.UserProfile;
import com.vkontakte.android.ui.util.AlphabetSegmenter;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class FriendsListFragment$$Lambda$7 implements AlphabetSegmenter.Converter {
    private final FriendsListFragment arg$1;

    private FriendsListFragment$$Lambda$7(FriendsListFragment friendsListFragment) {
        this.arg$1 = friendsListFragment;
    }

    public static AlphabetSegmenter.Converter lambdaFactory$(FriendsListFragment friendsListFragment) {
        return new FriendsListFragment$$Lambda$7(friendsListFragment);
    }

    @Override // com.vkontakte.android.ui.util.AlphabetSegmenter.Converter
    @LambdaForm.Hidden
    public char getIndex(Object obj) {
        return this.arg$1.lambda$updateData$3((UserProfile) obj);
    }
}
