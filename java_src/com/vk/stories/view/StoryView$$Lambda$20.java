package com.vk.stories.view;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class StoryView$$Lambda$20 implements Runnable {
    private final StoryView arg$1;

    private StoryView$$Lambda$20(StoryView storyView) {
        this.arg$1 = storyView;
    }

    public static Runnable lambdaFactory$(StoryView storyView) {
        return new StoryView$$Lambda$20(storyView);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$10();
    }
}
