package com.vk.stories;

import android.animation.AnimatorSet;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class StoryViewDialog$$Lambda$2 implements Runnable {
    private final AnimatorSet arg$1;

    private StoryViewDialog$$Lambda$2(AnimatorSet animatorSet) {
        this.arg$1 = animatorSet;
    }

    public static Runnable lambdaFactory$(AnimatorSet animatorSet) {
        return new StoryViewDialog$$Lambda$2(animatorSet);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        StoryViewDialog.lambda$startOpenAnimation$1(this.arg$1);
    }
}
