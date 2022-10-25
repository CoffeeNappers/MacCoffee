package com.vkontakte.android.fragments;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NewsSearchFragment$$Lambda$1 implements Runnable {
    private final NewsSearchFragment arg$1;

    private NewsSearchFragment$$Lambda$1(NewsSearchFragment newsSearchFragment) {
        this.arg$1 = newsSearchFragment;
    }

    public static Runnable lambdaFactory$(NewsSearchFragment newsSearchFragment) {
        return new NewsSearchFragment$$Lambda$1(newsSearchFragment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$hideKeyboard$0();
    }
}
