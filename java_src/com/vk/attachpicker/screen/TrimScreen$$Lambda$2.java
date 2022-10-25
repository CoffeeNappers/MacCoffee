package com.vk.attachpicker.screen;

import android.media.MediaPlayer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class TrimScreen$$Lambda$2 implements MediaPlayer.OnCompletionListener {
    private final TrimScreen arg$1;

    private TrimScreen$$Lambda$2(TrimScreen trimScreen) {
        this.arg$1 = trimScreen;
    }

    public static MediaPlayer.OnCompletionListener lambdaFactory$(TrimScreen trimScreen) {
        return new TrimScreen$$Lambda$2(trimScreen);
    }

    @Override // android.media.MediaPlayer.OnCompletionListener
    @LambdaForm.Hidden
    public void onCompletion(MediaPlayer mediaPlayer) {
        this.arg$1.lambda$createView$3(mediaPlayer);
    }
}
