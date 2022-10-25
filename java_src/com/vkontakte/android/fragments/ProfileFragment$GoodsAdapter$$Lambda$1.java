package com.vkontakte.android.fragments;

import com.vkontakte.android.fragments.ProfileFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ProfileFragment$GoodsAdapter$$Lambda$1 implements Runnable {
    private final ProfileFragment.GoodsAdapter arg$1;

    private ProfileFragment$GoodsAdapter$$Lambda$1(ProfileFragment.GoodsAdapter goodsAdapter) {
        this.arg$1 = goodsAdapter;
    }

    public static Runnable lambdaFactory$(ProfileFragment.GoodsAdapter goodsAdapter) {
        return new ProfileFragment$GoodsAdapter$$Lambda$1(goodsAdapter);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.onScrolledToLastItem();
    }
}
