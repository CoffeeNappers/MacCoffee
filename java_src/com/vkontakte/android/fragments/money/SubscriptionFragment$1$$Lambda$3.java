package com.vkontakte.android.fragments.money;

import com.vkontakte.android.data.Subscription;
import com.vkontakte.android.fragments.money.SubscriptionFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SubscriptionFragment$1$$Lambda$3 implements Runnable {
    private final SubscriptionFragment.AnonymousClass1 arg$1;
    private final Subscription arg$2;

    private SubscriptionFragment$1$$Lambda$3(SubscriptionFragment.AnonymousClass1 anonymousClass1, Subscription subscription) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = subscription;
    }

    public static Runnable lambdaFactory$(SubscriptionFragment.AnonymousClass1 anonymousClass1, Subscription subscription) {
        return new SubscriptionFragment$1$$Lambda$3(anonymousClass1, subscription);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$0(this.arg$2);
    }
}
