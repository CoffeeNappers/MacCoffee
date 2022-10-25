package com.vkontakte.android.media;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NativeVideoPlayer$$Lambda$1 implements Runnable {
    private final NativeVideoPlayer arg$1;

    private NativeVideoPlayer$$Lambda$1(NativeVideoPlayer nativeVideoPlayer) {
        this.arg$1 = nativeVideoPlayer;
    }

    public static Runnable lambdaFactory$(NativeVideoPlayer nativeVideoPlayer) {
        return new NativeVideoPlayer$$Lambda$1(nativeVideoPlayer);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$new$0();
    }
}
