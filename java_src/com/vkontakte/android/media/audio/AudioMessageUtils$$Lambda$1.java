package com.vkontakte.android.media.audio;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AudioMessageUtils$$Lambda$1 implements Runnable {
    private final AudioMessageUtils arg$1;
    private final int arg$2;

    private AudioMessageUtils$$Lambda$1(AudioMessageUtils audioMessageUtils, int i) {
        this.arg$1 = audioMessageUtils;
        this.arg$2 = i;
    }

    public static Runnable lambdaFactory$(AudioMessageUtils audioMessageUtils, int i) {
        return new AudioMessageUtils$$Lambda$1(audioMessageUtils, i);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$stopRecording$0(this.arg$2);
    }
}
