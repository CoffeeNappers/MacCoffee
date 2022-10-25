package com.vk.stories.view;

import com.vk.stories.view.StoryViewContainer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class StoryViewContainer$$Lambda$13 implements StoryViewContainer.StoryViewCallback {
    private static final StoryViewContainer$$Lambda$13 instance = new StoryViewContainer$$Lambda$13();

    private StoryViewContainer$$Lambda$13() {
    }

    public static StoryViewContainer.StoryViewCallback lambdaFactory$() {
        return instance;
    }

    @Override // com.vk.stories.view.StoryViewContainer.StoryViewCallback
    @LambdaForm.Hidden
    public void storyView(StoryView storyView) {
        storyView.destroy();
    }
}
