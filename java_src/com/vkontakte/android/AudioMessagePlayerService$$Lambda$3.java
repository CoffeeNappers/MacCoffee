package com.vkontakte.android;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class AudioMessagePlayerService$$Lambda$3 implements Runnable {
    private final AudioMessagePlayerService arg$1;
    private final float arg$2;

    private AudioMessagePlayerService$$Lambda$3(AudioMessagePlayerService audioMessagePlayerService, float f) {
        this.arg$1 = audioMessagePlayerService;
        this.arg$2 = f;
    }

    public static Runnable lambdaFactory$(AudioMessagePlayerService audioMessagePlayerService, float f) {
        return new AudioMessagePlayerService$$Lambda$3(audioMessagePlayerService, f);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$seekOpusPlayer$2(this.arg$2);
    }
}
