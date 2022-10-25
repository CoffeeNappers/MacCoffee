package com.vk.stories.view;

import com.vk.attachpicker.events.NotificationListener;
import com.vk.stories.StoriesController;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class StoryViewContainer$$Lambda$3 implements NotificationListener {
    private final StoryViewContainer arg$1;

    private StoryViewContainer$$Lambda$3(StoryViewContainer storyViewContainer) {
        this.arg$1 = storyViewContainer;
    }

    public static NotificationListener lambdaFactory$(StoryViewContainer storyViewContainer) {
        return new StoryViewContainer$$Lambda$3(storyViewContainer);
    }

    @Override // com.vk.attachpicker.events.NotificationListener
    @LambdaForm.Hidden
    public void onNotification(int i, int i2, Object obj) {
        this.arg$1.lambda$new$2(i, i2, (StoriesController.StoryUpload) obj);
    }
}
