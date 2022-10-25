package com.vkontakte.android.fragments.money;

import com.vkontakte.android.data.Subscription;
import com.vkontakte.android.fragments.money.SubscriptionFragment;
import com.vkontakte.android.functions.F2;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SubscriptionFragment$1$$Lambda$2 implements F2 {
    private final SubscriptionFragment.AnonymousClass1 arg$1;

    private SubscriptionFragment$1$$Lambda$2(SubscriptionFragment.AnonymousClass1 anonymousClass1) {
        this.arg$1 = anonymousClass1;
    }

    public static F2 lambdaFactory$(SubscriptionFragment.AnonymousClass1 anonymousClass1) {
        return new SubscriptionFragment$1$$Lambda$2(anonymousClass1);
    }

    @Override // com.vkontakte.android.functions.F2
    @LambdaForm.Hidden
    public Object f(Object obj, Object obj2) {
        return this.arg$1.lambda$success$1((Subscription) obj, (String) obj2);
    }
}
