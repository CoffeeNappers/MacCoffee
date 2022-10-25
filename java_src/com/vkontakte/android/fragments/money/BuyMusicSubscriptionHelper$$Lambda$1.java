package com.vkontakte.android.fragments.money;

import com.vkontakte.android.data.PurchasesManager;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BuyMusicSubscriptionHelper$$Lambda$1 implements PurchasesManager.OnSuccessListener {
    private final BuyMusicSubscriptionHelper arg$1;
    private final PurchasesManager.OnSuccessListener arg$2;

    private BuyMusicSubscriptionHelper$$Lambda$1(BuyMusicSubscriptionHelper buyMusicSubscriptionHelper, PurchasesManager.OnSuccessListener onSuccessListener) {
        this.arg$1 = buyMusicSubscriptionHelper;
        this.arg$2 = onSuccessListener;
    }

    public static PurchasesManager.OnSuccessListener lambdaFactory$(BuyMusicSubscriptionHelper buyMusicSubscriptionHelper, PurchasesManager.OnSuccessListener onSuccessListener) {
        return new BuyMusicSubscriptionHelper$$Lambda$1(buyMusicSubscriptionHelper, onSuccessListener);
    }

    @Override // com.vkontakte.android.data.PurchasesManager.OnSuccessListener
    @LambdaForm.Hidden
    public void onSuccess(Object obj) {
        this.arg$1.lambda$purchase$0(this.arg$2, (PurchasesManager.Product) obj);
    }
}
