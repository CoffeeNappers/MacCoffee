package com.vkontakte.android.media;

import android.media.MediaPlayer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NativeVideoPlayer$$Lambda$6 implements MediaPlayer.OnPreparedListener {
    private final NativeVideoPlayer arg$1;
    private final MediaPlayer arg$2;

    private NativeVideoPlayer$$Lambda$6(NativeVideoPlayer nativeVideoPlayer, MediaPlayer mediaPlayer) {
        this.arg$1 = nativeVideoPlayer;
        this.arg$2 = mediaPlayer;
    }

    public static MediaPlayer.OnPreparedListener lambdaFactory$(NativeVideoPlayer nativeVideoPlayer, MediaPlayer mediaPlayer) {
        return new NativeVideoPlayer$$Lambda$6(nativeVideoPlayer, mediaPlayer);
    }

    @Override // android.media.MediaPlayer.OnPreparedListener
    @LambdaForm.Hidden
    public void onPrepared(MediaPlayer mediaPlayer) {
        this.arg$1.lambda$doSetDataSource$5(this.arg$2, mediaPlayer);
    }
}
