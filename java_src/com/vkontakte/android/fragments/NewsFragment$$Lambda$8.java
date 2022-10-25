package com.vkontakte.android.fragments;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NewsFragment$$Lambda$8 implements Runnable {
    private final NewsFragment arg$1;

    private NewsFragment$$Lambda$8(NewsFragment newsFragment) {
        this.arg$1 = newsFragment;
    }

    public static Runnable lambdaFactory$(NewsFragment newsFragment) {
        return new NewsFragment$$Lambda$8(newsFragment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$doLoadData$8();
    }
}
