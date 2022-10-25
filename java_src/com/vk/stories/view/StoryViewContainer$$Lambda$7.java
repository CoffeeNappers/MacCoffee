package com.vk.stories.view;

import io.reactivex.functions.Consumer;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class StoryViewContainer$$Lambda$7 implements Consumer {
    private final StoryViewContainer arg$1;

    private StoryViewContainer$$Lambda$7(StoryViewContainer storyViewContainer) {
        this.arg$1 = storyViewContainer;
    }

    public static Consumer lambdaFactory$(StoryViewContainer storyViewContainer) {
        return new StoryViewContainer$$Lambda$7(storyViewContainer);
    }

    @Override // io.reactivex.functions.Consumer
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$init$6((Throwable) obj);
    }
}
