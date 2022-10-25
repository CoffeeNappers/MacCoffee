package com.vkontakte.android.fragments.gifts;

import com.vkontakte.android.UserProfile;
import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BirthdaysFragment$$Lambda$1 implements VoidF1 {
    private final BirthdaysFragment arg$1;

    private BirthdaysFragment$$Lambda$1(BirthdaysFragment birthdaysFragment) {
        this.arg$1 = birthdaysFragment;
    }

    public static VoidF1 lambdaFactory$(BirthdaysFragment birthdaysFragment) {
        return new BirthdaysFragment$$Lambda$1(birthdaysFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.showGiftsCatalog((UserProfile) obj);
    }
}
