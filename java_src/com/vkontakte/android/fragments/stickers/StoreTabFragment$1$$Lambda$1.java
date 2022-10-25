package com.vkontakte.android.fragments.stickers;

import android.view.View;
import com.vkontakte.android.fragments.stickers.StoreTabFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class StoreTabFragment$1$$Lambda$1 implements Runnable {
    private final View arg$1;

    private StoreTabFragment$1$$Lambda$1(View view) {
        this.arg$1 = view;
    }

    public static Runnable lambdaFactory$(View view) {
        return new StoreTabFragment$1$$Lambda$1(view);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        StoreTabFragment.AnonymousClass1.lambda$onClick$0(this.arg$1);
    }
}
