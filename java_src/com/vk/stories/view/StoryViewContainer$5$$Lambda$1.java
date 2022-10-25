package com.vk.stories.view;

import com.vk.stories.view.StoryViewContainer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class StoryViewContainer$5$$Lambda$1 implements StoryViewContainer.StoryViewCallback {
    private static final StoryViewContainer$5$$Lambda$1 instance = new StoryViewContainer$5$$Lambda$1();

    private StoryViewContainer$5$$Lambda$1() {
    }

    public static StoryViewContainer.StoryViewCallback lambdaFactory$() {
        return instance;
    }

    @Override // com.vk.stories.view.StoryViewContainer.StoryViewCallback
    @LambdaForm.Hidden
    public void storyView(StoryView storyView) {
        storyView.externalPrevClick();
    }
}
