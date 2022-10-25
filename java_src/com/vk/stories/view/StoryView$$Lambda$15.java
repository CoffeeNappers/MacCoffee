package com.vk.stories.view;

import com.vk.stories.model.StoryEntry;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class StoryView$$Lambda$15 implements Runnable {
    private final StoryView arg$1;
    private final StoryEntry arg$2;
    private final int arg$3;

    private StoryView$$Lambda$15(StoryView storyView, StoryEntry storyEntry, int i) {
        this.arg$1 = storyView;
        this.arg$2 = storyEntry;
        this.arg$3 = i;
    }

    public static Runnable lambdaFactory$(StoryView storyView, StoryEntry storyEntry, int i) {
        return new StoryView$$Lambda$15(storyView, storyEntry, i);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$deleteStory$18(this.arg$2, this.arg$3);
    }
}
