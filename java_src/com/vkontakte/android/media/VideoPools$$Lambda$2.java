package com.vkontakte.android.media;

import com.vkontakte.android.api.VideoFile;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class VideoPools$$Lambda$2 implements Runnable {
    private final VideoFile arg$1;
    private final int arg$2;

    private VideoPools$$Lambda$2(VideoFile videoFile, int i) {
        this.arg$1 = videoFile;
        this.arg$2 = i;
    }

    public static Runnable lambdaFactory$(VideoFile videoFile, int i) {
        return new VideoPools$$Lambda$2(videoFile, i);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        VideoPools.lambda$detachAndReleasePlayer$2(this.arg$1, this.arg$2);
    }
}
