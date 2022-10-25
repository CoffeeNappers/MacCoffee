package com.vkontakte.android.media;

import android.graphics.SurfaceTexture;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ExoVideoPlayer$$Lambda$5 implements Runnable {
    private final ExoVideoPlayer arg$1;
    private final SurfaceTexture arg$2;

    private ExoVideoPlayer$$Lambda$5(ExoVideoPlayer exoVideoPlayer, SurfaceTexture surfaceTexture) {
        this.arg$1 = exoVideoPlayer;
        this.arg$2 = surfaceTexture;
    }

    public static Runnable lambdaFactory$(ExoVideoPlayer exoVideoPlayer, SurfaceTexture surfaceTexture) {
        return new ExoVideoPlayer$$Lambda$5(exoVideoPlayer, surfaceTexture);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onSurfaceTextureDestroyed$4(this.arg$2);
    }
}
