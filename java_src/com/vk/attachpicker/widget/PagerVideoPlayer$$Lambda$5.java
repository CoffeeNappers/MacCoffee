package com.vk.attachpicker.widget;

import android.media.MediaPlayer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PagerVideoPlayer$$Lambda$5 implements MediaPlayer.OnPreparedListener {
    private final PagerVideoPlayer arg$1;

    private PagerVideoPlayer$$Lambda$5(PagerVideoPlayer pagerVideoPlayer) {
        this.arg$1 = pagerVideoPlayer;
    }

    public static MediaPlayer.OnPreparedListener lambdaFactory$(PagerVideoPlayer pagerVideoPlayer) {
        return new PagerVideoPlayer$$Lambda$5(pagerVideoPlayer);
    }

    @Override // android.media.MediaPlayer.OnPreparedListener
    @LambdaForm.Hidden
    public void onPrepared(MediaPlayer mediaPlayer) {
        this.arg$1.lambda$checkVideoView$2(mediaPlayer);
    }
}
