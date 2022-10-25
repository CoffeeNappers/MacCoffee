package com.vk.stories.view;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class StoryView$$Lambda$21 implements Runnable {
    private final StoryView arg$1;
    private final int arg$2;

    private StoryView$$Lambda$21(StoryView storyView, int i) {
        this.arg$1 = storyView;
        this.arg$2 = i;
    }

    public static Runnable lambdaFactory$(StoryView storyView, int i) {
        return new StoryView$$Lambda$21(storyView, i);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$11(this.arg$2);
    }
}
