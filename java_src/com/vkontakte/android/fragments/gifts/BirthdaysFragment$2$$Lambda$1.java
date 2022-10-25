package com.vkontakte.android.fragments.gifts;

import com.vkontakte.android.fragments.gifts.BirthdaysFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BirthdaysFragment$2$$Lambda$1 implements Runnable {
    private final BirthdaysFragment.AnonymousClass2 arg$1;

    private BirthdaysFragment$2$$Lambda$1(BirthdaysFragment.AnonymousClass2 anonymousClass2) {
        this.arg$1 = anonymousClass2;
    }

    public static Runnable lambdaFactory$(BirthdaysFragment.AnonymousClass2 anonymousClass2) {
        return new BirthdaysFragment$2$$Lambda$1(anonymousClass2);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$run$0();
    }
}
