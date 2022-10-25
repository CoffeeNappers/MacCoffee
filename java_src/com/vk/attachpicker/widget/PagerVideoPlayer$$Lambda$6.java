package com.vk.attachpicker.widget;

import android.media.MediaPlayer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PagerVideoPlayer$$Lambda$6 implements MediaPlayer.OnCompletionListener {
    private final PagerVideoPlayer arg$1;

    private PagerVideoPlayer$$Lambda$6(PagerVideoPlayer pagerVideoPlayer) {
        this.arg$1 = pagerVideoPlayer;
    }

    public static MediaPlayer.OnCompletionListener lambdaFactory$(PagerVideoPlayer pagerVideoPlayer) {
        return new PagerVideoPlayer$$Lambda$6(pagerVideoPlayer);
    }

    @Override // android.media.MediaPlayer.OnCompletionListener
    @LambdaForm.Hidden
    public void onCompletion(MediaPlayer mediaPlayer) {
        this.arg$1.lambda$checkVideoView$3(mediaPlayer);
    }
}
