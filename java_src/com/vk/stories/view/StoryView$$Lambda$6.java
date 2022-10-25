package com.vk.stories.view;

import com.google.android.exoplayer2.SimpleExoPlayer;
import com.vk.core.view.SimpleVideoView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class StoryView$$Lambda$6 implements SimpleVideoView.OnEndListener {
    private final StoryView arg$1;

    private StoryView$$Lambda$6(StoryView storyView) {
        this.arg$1 = storyView;
    }

    public static SimpleVideoView.OnEndListener lambdaFactory$(StoryView storyView) {
        return new StoryView$$Lambda$6(storyView);
    }

    @Override // com.vk.core.view.SimpleVideoView.OnEndListener
    @LambdaForm.Hidden
    public void onEnd(SimpleExoPlayer simpleExoPlayer) {
        this.arg$1.lambda$init$5(simpleExoPlayer);
    }
}
