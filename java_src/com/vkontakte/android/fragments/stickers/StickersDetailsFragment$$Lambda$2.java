package com.vkontakte.android.fragments.stickers;

import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.data.orm.StickerStockItem;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class StickersDetailsFragment$$Lambda$2 implements PurchasesManager.OnSuccessListener {
    private final StickersDetailsFragment arg$1;

    private StickersDetailsFragment$$Lambda$2(StickersDetailsFragment stickersDetailsFragment) {
        this.arg$1 = stickersDetailsFragment;
    }

    public static PurchasesManager.OnSuccessListener lambdaFactory$(StickersDetailsFragment stickersDetailsFragment) {
        return new StickersDetailsFragment$$Lambda$2(stickersDetailsFragment);
    }

    @Override // com.vkontakte.android.data.PurchasesManager.OnSuccessListener
    @LambdaForm.Hidden
    public void onSuccess(Object obj) {
        this.arg$1.lambda$onClick$1((StickerStockItem) obj);
    }
}
