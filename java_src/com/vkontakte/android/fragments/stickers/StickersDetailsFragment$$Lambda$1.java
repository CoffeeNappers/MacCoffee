package com.vkontakte.android.fragments.stickers;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class StickersDetailsFragment$$Lambda$1 implements Runnable {
    private final View arg$1;

    private StickersDetailsFragment$$Lambda$1(View view) {
        this.arg$1 = view;
    }

    public static Runnable lambdaFactory$(View view) {
        return new StickersDetailsFragment$$Lambda$1(view);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        StickersDetailsFragment.lambda$onClick$0(this.arg$1);
    }
}
