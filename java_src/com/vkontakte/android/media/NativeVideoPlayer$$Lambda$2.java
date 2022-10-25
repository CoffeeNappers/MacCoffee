package com.vkontakte.android.media;

import android.media.MediaPlayer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NativeVideoPlayer$$Lambda$2 implements MediaPlayer.OnCompletionListener {
    private final NativeVideoPlayer arg$1;

    private NativeVideoPlayer$$Lambda$2(NativeVideoPlayer nativeVideoPlayer) {
        this.arg$1 = nativeVideoPlayer;
    }

    public static MediaPlayer.OnCompletionListener lambdaFactory$(NativeVideoPlayer nativeVideoPlayer) {
        return new NativeVideoPlayer$$Lambda$2(nativeVideoPlayer);
    }

    @Override // android.media.MediaPlayer.OnCompletionListener
    @LambdaForm.Hidden
    public void onCompletion(MediaPlayer mediaPlayer) {
        this.arg$1.lambda$doSetDataSource$1(mediaPlayer);
    }
}
