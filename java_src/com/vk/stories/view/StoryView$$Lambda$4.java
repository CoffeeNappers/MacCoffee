package com.vk.stories.view;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class StoryView$$Lambda$4 implements View.OnClickListener {
    private final StoryView arg$1;

    private StoryView$$Lambda$4(StoryView storyView) {
        this.arg$1 = storyView;
    }

    public static View.OnClickListener lambdaFactory$(StoryView storyView) {
        return new StoryView$$Lambda$4(storyView);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$init$3(view);
    }
}