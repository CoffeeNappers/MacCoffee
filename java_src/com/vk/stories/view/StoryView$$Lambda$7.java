package com.vk.stories.view;

import com.google.android.exoplayer2.SimpleExoPlayer;
import com.vk.core.view.SimpleVideoView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class StoryView$$Lambda$7 implements SimpleVideoView.OnFirstFrameRenderedListener {
    private final StoryView arg$1;

    private StoryView$$Lambda$7(StoryView storyView) {
        this.arg$1 = storyView;
    }

    public static SimpleVideoView.OnFirstFrameRenderedListener lambdaFactory$(StoryView storyView) {
        return new StoryView$$Lambda$7(storyView);
    }

    @Override // com.vk.core.view.SimpleVideoView.OnFirstFrameRenderedListener
    @LambdaForm.Hidden
    public void onFirstFrameRendered(SimpleExoPlayer simpleExoPlayer) {
        this.arg$1.lambda$init$6(simpleExoPlayer);
    }
}
