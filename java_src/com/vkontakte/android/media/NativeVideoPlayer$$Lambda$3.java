package com.vkontakte.android.media;

import android.media.MediaPlayer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NativeVideoPlayer$$Lambda$3 implements MediaPlayer.OnErrorListener {
    private final NativeVideoPlayer arg$1;

    private NativeVideoPlayer$$Lambda$3(NativeVideoPlayer nativeVideoPlayer) {
        this.arg$1 = nativeVideoPlayer;
    }

    public static MediaPlayer.OnErrorListener lambdaFactory$(NativeVideoPlayer nativeVideoPlayer) {
        return new NativeVideoPlayer$$Lambda$3(nativeVideoPlayer);
    }

    @Override // android.media.MediaPlayer.OnErrorListener
    @LambdaForm.Hidden
    public boolean onError(MediaPlayer mediaPlayer, int i, int i2) {
        return this.arg$1.lambda$doSetDataSource$2(mediaPlayer, i, i2);
    }
}
