package com.vkontakte.android.activities;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class YouTubeVideoPlayerActivity$$Lambda$1 implements Runnable {
    private final YouTubeVideoPlayerActivity arg$1;

    private YouTubeVideoPlayerActivity$$Lambda$1(YouTubeVideoPlayerActivity youTubeVideoPlayerActivity) {
        this.arg$1 = youTubeVideoPlayerActivity;
    }

    public static Runnable lambdaFactory$(YouTubeVideoPlayerActivity youTubeVideoPlayerActivity) {
        return new YouTubeVideoPlayerActivity$$Lambda$1(youTubeVideoPlayerActivity);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$hideUIDelayed$0();
    }
}
