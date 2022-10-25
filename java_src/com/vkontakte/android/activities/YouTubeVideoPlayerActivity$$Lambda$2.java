package com.vkontakte.android.activities;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class YouTubeVideoPlayerActivity$$Lambda$2 implements View.OnClickListener {
    private final YouTubeVideoPlayerActivity arg$1;

    private YouTubeVideoPlayerActivity$$Lambda$2(YouTubeVideoPlayerActivity youTubeVideoPlayerActivity) {
        this.arg$1 = youTubeVideoPlayerActivity;
    }

    public static View.OnClickListener lambdaFactory$(YouTubeVideoPlayerActivity youTubeVideoPlayerActivity) {
        return new YouTubeVideoPlayerActivity$$Lambda$2(youTubeVideoPlayerActivity);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$createUI$1(view);
    }
}
