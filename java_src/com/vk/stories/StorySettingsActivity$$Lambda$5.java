package com.vk.stories;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class StorySettingsActivity$$Lambda$5 implements View.OnClickListener {
    private final StorySettingsActivity arg$1;
    private final boolean arg$2;

    private StorySettingsActivity$$Lambda$5(StorySettingsActivity storySettingsActivity, boolean z) {
        this.arg$1 = storySettingsActivity;
        this.arg$2 = z;
    }

    public static View.OnClickListener lambdaFactory$(StorySettingsActivity storySettingsActivity, boolean z) {
        return new StorySettingsActivity$$Lambda$5(storySettingsActivity, z);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreate$4(this.arg$2, view);
    }
}
