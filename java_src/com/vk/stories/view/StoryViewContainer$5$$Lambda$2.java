package com.vk.stories.view;

import com.vk.stories.view.StoryViewContainer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class StoryViewContainer$5$$Lambda$2 implements StoryViewContainer.StoryViewCallback {
    private static final StoryViewContainer$5$$Lambda$2 instance = new StoryViewContainer$5$$Lambda$2();

    private StoryViewContainer$5$$Lambda$2() {
    }

    public static StoryViewContainer.StoryViewCallback lambdaFactory$() {
        return instance;
    }

    @Override // com.vk.stories.view.StoryViewContainer.StoryViewCallback
    @LambdaForm.Hidden
    public void storyView(StoryView storyView) {
        storyView.externalNextClick();
    }
}
