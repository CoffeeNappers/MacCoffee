package com.vk.stories.view;

import com.vk.stories.view.StoryViewContainer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class StoryViewContainer$$Lambda$16 implements StoryViewContainer.StoryViewCallback {
    private static final StoryViewContainer$$Lambda$16 instance = new StoryViewContainer$$Lambda$16();

    private StoryViewContainer$$Lambda$16() {
    }

    public static StoryViewContainer.StoryViewCallback lambdaFactory$() {
        return instance;
    }

    @Override // com.vk.stories.view.StoryViewContainer.StoryViewCallback
    @LambdaForm.Hidden
    public void storyView(StoryView storyView) {
        storyView.resetProgress();
    }
}
