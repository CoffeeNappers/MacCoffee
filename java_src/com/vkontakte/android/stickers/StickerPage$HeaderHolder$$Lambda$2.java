package com.vkontakte.android.stickers;

import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.stickers.StickerPage;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class StickerPage$HeaderHolder$$Lambda$2 implements PurchasesManager.OnSuccessListener {
    private final StickerPage.HeaderHolder arg$1;

    private StickerPage$HeaderHolder$$Lambda$2(StickerPage.HeaderHolder headerHolder) {
        this.arg$1 = headerHolder;
    }

    public static PurchasesManager.OnSuccessListener lambdaFactory$(StickerPage.HeaderHolder headerHolder) {
        return new StickerPage$HeaderHolder$$Lambda$2(headerHolder);
    }

    @Override // com.vkontakte.android.data.PurchasesManager.OnSuccessListener
    @LambdaForm.Hidden
    public void onSuccess(Object obj) {
        this.arg$1.lambda$null$0((StickerStockItem) obj);
    }
}
