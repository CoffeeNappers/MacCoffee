package com.vkontakte.android.fragments.friends;

import com.vkontakte.android.fragments.friends.FriendsImportFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class FriendsImportFragment$Legacy$$Lambda$7 implements Runnable {
    private final FriendsImportFragment.Legacy arg$1;

    private FriendsImportFragment$Legacy$$Lambda$7(FriendsImportFragment.Legacy legacy) {
        this.arg$1 = legacy;
    }

    public static Runnable lambdaFactory$(FriendsImportFragment.Legacy legacy) {
        return new FriendsImportFragment$Legacy$$Lambda$7(legacy);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$6();
    }
}
