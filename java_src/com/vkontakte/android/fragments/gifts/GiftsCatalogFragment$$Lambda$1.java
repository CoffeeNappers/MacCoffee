package com.vkontakte.android.fragments.gifts;

import com.vkontakte.android.api.models.CatalogedGift;
import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GiftsCatalogFragment$$Lambda$1 implements VoidF1 {
    private final GiftsCatalogFragment arg$1;

    private GiftsCatalogFragment$$Lambda$1(GiftsCatalogFragment giftsCatalogFragment) {
        this.arg$1 = giftsCatalogFragment;
    }

    public static VoidF1 lambdaFactory$(GiftsCatalogFragment giftsCatalogFragment) {
        return new GiftsCatalogFragment$$Lambda$1(giftsCatalogFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.sendGift((CatalogedGift) obj);
    }
}
