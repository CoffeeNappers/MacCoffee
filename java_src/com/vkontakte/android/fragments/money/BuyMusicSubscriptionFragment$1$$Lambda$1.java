package com.vkontakte.android.fragments.money;

import com.vkontakte.android.data.Subscription;
import com.vkontakte.android.functions.F1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BuyMusicSubscriptionFragment$1$$Lambda$1 implements F1 {
    private static final BuyMusicSubscriptionFragment$1$$Lambda$1 instance = new BuyMusicSubscriptionFragment$1$$Lambda$1();

    private BuyMusicSubscriptionFragment$1$$Lambda$1() {
    }

    @Override // com.vkontakte.android.functions.F1
    @LambdaForm.Hidden
    public Object f(Object obj) {
        return ((Subscription) obj).getMerchantProductId();
    }
}
