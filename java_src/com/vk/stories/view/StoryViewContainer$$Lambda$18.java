package com.vk.stories.view;

import com.vk.stories.StoriesController;
import com.vk.stories.view.StoryViewContainer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class StoryViewContainer$$Lambda$18 implements StoryViewContainer.StoryViewCallback {
    private final StoriesController.StoryUpload arg$1;

    private StoryViewContainer$$Lambda$18(StoriesController.StoryUpload storyUpload) {
        this.arg$1 = storyUpload;
    }

    public static StoryViewContainer.StoryViewCallback lambdaFactory$(StoriesController.StoryUpload storyUpload) {
        return new StoryViewContainer$$Lambda$18(storyUpload);
    }

    @Override // com.vk.stories.view.StoryViewContainer.StoryViewCallback
    @LambdaForm.Hidden
    public void storyView(StoryView storyView) {
        storyView.setUploadDone(this.arg$1);
    }
}
