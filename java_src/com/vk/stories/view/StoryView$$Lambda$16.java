package com.vk.stories.view;

import com.vk.stories.StoryVideoCache;
import com.vk.stories.model.StoryEntry;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class StoryView$$Lambda$16 implements StoryVideoCache.UrlCallback {
    private final StoryView arg$1;
    private final StoryEntry arg$2;

    private StoryView$$Lambda$16(StoryView storyView, StoryEntry storyEntry) {
        this.arg$1 = storyView;
        this.arg$2 = storyEntry;
    }

    public static StoryVideoCache.UrlCallback lambdaFactory$(StoryView storyView, StoryEntry storyEntry) {
        return new StoryView$$Lambda$16(storyView, storyEntry);
    }

    @Override // com.vk.stories.StoryVideoCache.UrlCallback
    @LambdaForm.Hidden
    public void onLinkReady(String str) {
        this.arg$1.lambda$openStory$19(this.arg$2, str);
    }
}
