package com.vkontakte.android.fragments.friends;

import com.vkontakte.android.UserProfile;
import com.vkontakte.android.fragments.friends.FriendsImportFragment;
import java.lang.invoke.LambdaForm;
import java.util.Comparator;
/* loaded from: classes.dex */
final /* synthetic */ class FriendsImportFragment$Legacy$1$$Lambda$1 implements Comparator {
    private static final FriendsImportFragment$Legacy$1$$Lambda$1 instance = new FriendsImportFragment$Legacy$1$$Lambda$1();

    private FriendsImportFragment$Legacy$1$$Lambda$1() {
    }

    @Override // java.util.Comparator
    @LambdaForm.Hidden
    public int compare(Object obj, Object obj2) {
        return FriendsImportFragment.Legacy.AnonymousClass1.lambda$success$0((UserProfile) obj, (UserProfile) obj2);
    }
}
