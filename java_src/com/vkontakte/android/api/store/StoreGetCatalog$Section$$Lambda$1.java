package com.vkontakte.android.api.store;

import com.vkontakte.android.api.store.StoreGetCatalog;
import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.functions.F1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class StoreGetCatalog$Section$$Lambda$1 implements F1 {
    private static final StoreGetCatalog$Section$$Lambda$1 instance = new StoreGetCatalog$Section$$Lambda$1();

    private StoreGetCatalog$Section$$Lambda$1() {
    }

    public static F1 lambdaFactory$() {
        return instance;
    }

    @Override // com.vkontakte.android.functions.F1
    @LambdaForm.Hidden
    public Object f(Object obj) {
        return StoreGetCatalog.Section.lambda$new$0((StickerStockItem) obj);
    }
}
