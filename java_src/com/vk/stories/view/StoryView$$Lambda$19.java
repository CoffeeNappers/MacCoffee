package com.vk.stories.view;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class StoryView$$Lambda$19 implements Runnable {
    private final StoryView arg$1;

    private StoryView$$Lambda$19(StoryView storyView) {
        this.arg$1 = storyView;
    }

    public static Runnable lambdaFactory$(StoryView storyView) {
        return new StoryView$$Lambda$19(storyView);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        StoryView.access$lambda$0(this.arg$1);
    }
}
