package com.vk.stories;

import android.view.View;
import com.vk.stories.StoryPrivacySettingsActivity;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class StoryPrivacySettingsActivity$StorySettingsFragment$$Lambda$1 implements View.OnClickListener {
    private final StoryPrivacySettingsActivity.StorySettingsFragment arg$1;

    private StoryPrivacySettingsActivity$StorySettingsFragment$$Lambda$1(StoryPrivacySettingsActivity.StorySettingsFragment storySettingsFragment) {
        this.arg$1 = storySettingsFragment;
    }

    public static View.OnClickListener lambdaFactory$(StoryPrivacySettingsActivity.StorySettingsFragment storySettingsFragment) {
        return new StoryPrivacySettingsActivity$StorySettingsFragment$$Lambda$1(storySettingsFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onViewCreated$0(view);
    }
}
