package com.vkontakte.android.fragments;

import com.vkontakte.android.fragments.NewsFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NewsFragment$StoriesHolder$$Lambda$2 implements Runnable {
    private final NewsFragment.StoriesHolder arg$1;
    private final int arg$2;

    private NewsFragment$StoriesHolder$$Lambda$2(NewsFragment.StoriesHolder storiesHolder, int i) {
        this.arg$1 = storiesHolder;
        this.arg$2 = i;
    }

    public static Runnable lambdaFactory$(NewsFragment.StoriesHolder storiesHolder, int i) {
        return new NewsFragment$StoriesHolder$$Lambda$2(storiesHolder, i);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onLongClick$1(this.arg$2);
    }
}
