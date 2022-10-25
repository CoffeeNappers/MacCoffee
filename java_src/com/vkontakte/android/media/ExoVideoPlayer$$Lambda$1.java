package com.vkontakte.android.media;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ExoVideoPlayer$$Lambda$1 implements Runnable {
    private final ExoVideoPlayer arg$1;

    private ExoVideoPlayer$$Lambda$1(ExoVideoPlayer exoVideoPlayer) {
        this.arg$1 = exoVideoPlayer;
    }

    public static Runnable lambdaFactory$(ExoVideoPlayer exoVideoPlayer) {
        return new ExoVideoPlayer$$Lambda$1(exoVideoPlayer);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$new$0();
    }
}
