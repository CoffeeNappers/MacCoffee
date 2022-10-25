package com.vkontakte.android.media;

import android.media.MediaPlayer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NativeVideoPlayer$$Lambda$4 implements MediaPlayer.OnInfoListener {
    private final NativeVideoPlayer arg$1;
    private final MediaPlayer arg$2;

    private NativeVideoPlayer$$Lambda$4(NativeVideoPlayer nativeVideoPlayer, MediaPlayer mediaPlayer) {
        this.arg$1 = nativeVideoPlayer;
        this.arg$2 = mediaPlayer;
    }

    public static MediaPlayer.OnInfoListener lambdaFactory$(NativeVideoPlayer nativeVideoPlayer, MediaPlayer mediaPlayer) {
        return new NativeVideoPlayer$$Lambda$4(nativeVideoPlayer, mediaPlayer);
    }

    @Override // android.media.MediaPlayer.OnInfoListener
    @LambdaForm.Hidden
    public boolean onInfo(MediaPlayer mediaPlayer, int i, int i2) {
        return this.arg$1.lambda$doSetDataSource$3(this.arg$2, mediaPlayer, i, i2);
    }
}
