package com.vkontakte.android.fragments.money;

import com.vkontakte.android.fragments.money.BuyMusicSubscriptionFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BuyMusicSubscriptionFragment$1$$Lambda$3 implements Runnable {
    private final BuyMusicSubscriptionFragment.AnonymousClass1 arg$1;
    private final String arg$2;

    private BuyMusicSubscriptionFragment$1$$Lambda$3(BuyMusicSubscriptionFragment.AnonymousClass1 anonymousClass1, String str) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = str;
    }

    public static Runnable lambdaFactory$(BuyMusicSubscriptionFragment.AnonymousClass1 anonymousClass1, String str) {
        return new BuyMusicSubscriptionFragment$1$$Lambda$3(anonymousClass1, str);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$0(this.arg$2);
    }
}
