package com.vkontakte.android;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class AudioMessagePlayerService$$Lambda$2 implements Runnable {
    private final AudioMessagePlayerService arg$1;

    private AudioMessagePlayerService$$Lambda$2(AudioMessagePlayerService audioMessagePlayerService) {
        this.arg$1 = audioMessagePlayerService;
    }

    public static Runnable lambdaFactory$(AudioMessagePlayerService audioMessagePlayerService) {
        return new AudioMessagePlayerService$$Lambda$2(audioMessagePlayerService);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$playOpusFile$1();
    }
}
