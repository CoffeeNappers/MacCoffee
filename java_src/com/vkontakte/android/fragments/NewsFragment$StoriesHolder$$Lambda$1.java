package com.vkontakte.android.fragments;

import com.vk.stories.model.StoriesContainer;
import com.vkontakte.android.fragments.NewsFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NewsFragment$StoriesHolder$$Lambda$1 implements Runnable {
    private final NewsFragment.StoriesHolder arg$1;
    private final StoriesContainer arg$2;

    private NewsFragment$StoriesHolder$$Lambda$1(NewsFragment.StoriesHolder storiesHolder, StoriesContainer storiesContainer) {
        this.arg$1 = storiesHolder;
        this.arg$2 = storiesContainer;
    }

    public static Runnable lambdaFactory$(NewsFragment.StoriesHolder storiesHolder, StoriesContainer storiesContainer) {
        return new NewsFragment$StoriesHolder$$Lambda$1(storiesHolder, storiesContainer);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onLongClick$0(this.arg$2);
    }
}
