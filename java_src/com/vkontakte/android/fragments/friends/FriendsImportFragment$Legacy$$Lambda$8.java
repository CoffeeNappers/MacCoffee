package com.vkontakte.android.fragments.friends;

import com.vkontakte.android.fragments.friends.FriendsImportFragment;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class FriendsImportFragment$Legacy$$Lambda$8 implements Runnable {
    private final FriendsImportFragment.Legacy arg$1;

    private FriendsImportFragment$Legacy$$Lambda$8(FriendsImportFragment.Legacy legacy) {
        this.arg$1 = legacy;
    }

    public static Runnable lambdaFactory$(FriendsImportFragment.Legacy legacy) {
        return new FriendsImportFragment$Legacy$$Lambda$8(legacy);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$3();
    }
}
