package com.vkontakte.android.audio;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AudioStateListener$$Lambda$3 implements Runnable {
    private final AudioStateListener arg$1;

    private AudioStateListener$$Lambda$3(AudioStateListener audioStateListener) {
        this.arg$1 = audioStateListener;
    }

    public static Runnable lambdaFactory$(AudioStateListener audioStateListener) {
        return new AudioStateListener$$Lambda$3(audioStateListener);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$new$2();
    }
}
