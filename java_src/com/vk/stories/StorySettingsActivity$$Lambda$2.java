package com.vk.stories;

import android.support.v7.widget.SwitchCompat;
import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class StorySettingsActivity$$Lambda$2 implements View.OnClickListener {
    private final SwitchCompat arg$1;

    private StorySettingsActivity$$Lambda$2(SwitchCompat switchCompat) {
        this.arg$1 = switchCompat;
    }

    public static View.OnClickListener lambdaFactory$(SwitchCompat switchCompat) {
        return new StorySettingsActivity$$Lambda$2(switchCompat);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        StorySettingsActivity.lambda$onCreate$1(this.arg$1, view);
    }
}
