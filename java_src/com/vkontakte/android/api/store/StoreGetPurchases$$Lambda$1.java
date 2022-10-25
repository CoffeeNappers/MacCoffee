package com.vkontakte.android.api.store;

import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.functions.F1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class StoreGetPurchases$$Lambda$1 implements F1 {
    private static final StoreGetPurchases$$Lambda$1 instance = new StoreGetPurchases$$Lambda$1();

    private StoreGetPurchases$$Lambda$1() {
    }

    @Override // com.vkontakte.android.functions.F1
    @LambdaForm.Hidden
    public Object f(Object obj) {
        return StoreGetPurchases.lambda$parse$0((StickerStockItem) obj);
    }
}
