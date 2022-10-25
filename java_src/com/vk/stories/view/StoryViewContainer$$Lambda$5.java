package com.vk.stories.view;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class StoryViewContainer$$Lambda$5 implements View.OnClickListener {
    private final StoryViewContainer arg$1;

    private StoryViewContainer$$Lambda$5(StoryViewContainer storyViewContainer) {
        this.arg$1 = storyViewContainer;
    }

    public static View.OnClickListener lambdaFactory$(StoryViewContainer storyViewContainer) {
        return new StoryViewContainer$$Lambda$5(storyViewContainer);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$init$4(view);
    }
}
