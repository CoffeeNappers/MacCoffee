package com.vk.stories;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class StorySettingsActivity$$Lambda$1 implements View.OnClickListener {
    private final StorySettingsActivity arg$1;

    private StorySettingsActivity$$Lambda$1(StorySettingsActivity storySettingsActivity) {
        this.arg$1 = storySettingsActivity;
    }

    public static View.OnClickListener lambdaFactory$(StorySettingsActivity storySettingsActivity) {
        return new StorySettingsActivity$$Lambda$1(storySettingsActivity);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreate$0(view);
    }
}
