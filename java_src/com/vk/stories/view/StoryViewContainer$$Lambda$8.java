package com.vk.stories.view;

import android.view.View;
import com.vk.stories.model.StoriesContainer;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class StoryViewContainer$$Lambda$8 implements View.OnClickListener {
    private final StoryViewContainer arg$1;
    private final StoriesContainer arg$2;

    private StoryViewContainer$$Lambda$8(StoryViewContainer storyViewContainer, StoriesContainer storiesContainer) {
        this.arg$1 = storyViewContainer;
        this.arg$2 = storiesContainer;
    }

    public static View.OnClickListener lambdaFactory$(StoryViewContainer storyViewContainer, StoriesContainer storiesContainer) {
        return new StoryViewContainer$$Lambda$8(storyViewContainer, storiesContainer);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$showStory$7(this.arg$2, view);
    }
}
