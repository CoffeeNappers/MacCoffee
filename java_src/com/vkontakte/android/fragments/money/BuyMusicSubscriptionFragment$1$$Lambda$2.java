package com.vkontakte.android.fragments.money;

import com.vkontakte.android.data.Subscription;
import com.vkontakte.android.fragments.money.BuyMusicSubscriptionFragment;
import com.vkontakte.android.functions.F2;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BuyMusicSubscriptionFragment$1$$Lambda$2 implements F2 {
    private final BuyMusicSubscriptionFragment.AnonymousClass1 arg$1;

    private BuyMusicSubscriptionFragment$1$$Lambda$2(BuyMusicSubscriptionFragment.AnonymousClass1 anonymousClass1) {
        this.arg$1 = anonymousClass1;
    }

    public static F2 lambdaFactory$(BuyMusicSubscriptionFragment.AnonymousClass1 anonymousClass1) {
        return new BuyMusicSubscriptionFragment$1$$Lambda$2(anonymousClass1);
    }

    @Override // com.vkontakte.android.functions.F2
    @LambdaForm.Hidden
    public Object f(Object obj, Object obj2) {
        return this.arg$1.lambda$success$1((Subscription) obj, (String) obj2);
    }
}
