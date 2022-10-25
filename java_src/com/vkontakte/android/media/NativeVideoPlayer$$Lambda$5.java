package com.vkontakte.android.media;

import android.media.MediaPlayer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NativeVideoPlayer$$Lambda$5 implements MediaPlayer.OnBufferingUpdateListener {
    private final NativeVideoPlayer arg$1;
    private final MediaPlayer arg$2;

    private NativeVideoPlayer$$Lambda$5(NativeVideoPlayer nativeVideoPlayer, MediaPlayer mediaPlayer) {
        this.arg$1 = nativeVideoPlayer;
        this.arg$2 = mediaPlayer;
    }

    public static MediaPlayer.OnBufferingUpdateListener lambdaFactory$(NativeVideoPlayer nativeVideoPlayer, MediaPlayer mediaPlayer) {
        return new NativeVideoPlayer$$Lambda$5(nativeVideoPlayer, mediaPlayer);
    }

    @Override // android.media.MediaPlayer.OnBufferingUpdateListener
    @LambdaForm.Hidden
    public void onBufferingUpdate(MediaPlayer mediaPlayer, int i) {
        this.arg$1.lambda$doSetDataSource$4(this.arg$2, mediaPlayer, i);
    }
}
