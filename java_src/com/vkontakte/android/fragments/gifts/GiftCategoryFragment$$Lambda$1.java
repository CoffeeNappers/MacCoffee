package com.vkontakte.android.fragments.gifts;

import com.vkontakte.android.api.models.CatalogedGift;
import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GiftCategoryFragment$$Lambda$1 implements VoidF1 {
    private final GiftCategoryFragment arg$1;

    private GiftCategoryFragment$$Lambda$1(GiftCategoryFragment giftCategoryFragment) {
        this.arg$1 = giftCategoryFragment;
    }

    public static VoidF1 lambdaFactory$(GiftCategoryFragment giftCategoryFragment) {
        return new GiftCategoryFragment$$Lambda$1(giftCategoryFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.sendGift((CatalogedGift) obj);
    }
}
