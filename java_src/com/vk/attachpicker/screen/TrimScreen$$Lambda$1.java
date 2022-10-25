package com.vk.attachpicker.screen;

import android.media.MediaPlayer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class TrimScreen$$Lambda$1 implements MediaPlayer.OnPreparedListener {
    private final TrimScreen arg$1;

    private TrimScreen$$Lambda$1(TrimScreen trimScreen) {
        this.arg$1 = trimScreen;
    }

    public static MediaPlayer.OnPreparedListener lambdaFactory$(TrimScreen trimScreen) {
        return new TrimScreen$$Lambda$1(trimScreen);
    }

    @Override // android.media.MediaPlayer.OnPreparedListener
    @LambdaForm.Hidden
    public void onPrepared(MediaPlayer mediaPlayer) {
        this.arg$1.lambda$createView$2(mediaPlayer);
    }
}
