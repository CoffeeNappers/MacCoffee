package com.vkontakte.android.fragments;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class NewsFragment$$Lambda$1 implements Runnable {
    private final NewsFragment arg$1;

    private NewsFragment$$Lambda$1(NewsFragment newsFragment) {
        this.arg$1 = newsFragment;
    }

    public static Runnable lambdaFactory$(NewsFragment newsFragment) {
        return new NewsFragment$$Lambda$1(newsFragment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$preloadIfNeed$0();
    }
}
