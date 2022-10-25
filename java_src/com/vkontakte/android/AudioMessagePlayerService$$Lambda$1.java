package com.vkontakte.android;

import java.io.File;
import java.lang.invoke.LambdaForm;
import java.util.concurrent.Semaphore;
/* loaded from: classes.dex */
final /* synthetic */ class AudioMessagePlayerService$$Lambda$1 implements Runnable {
    private final AudioMessagePlayerService arg$1;
    private final Boolean[] arg$2;
    private final File arg$3;
    private final Semaphore arg$4;

    private AudioMessagePlayerService$$Lambda$1(AudioMessagePlayerService audioMessagePlayerService, Boolean[] boolArr, File file, Semaphore semaphore) {
        this.arg$1 = audioMessagePlayerService;
        this.arg$2 = boolArr;
        this.arg$3 = file;
        this.arg$4 = semaphore;
    }

    public static Runnable lambdaFactory$(AudioMessagePlayerService audioMessagePlayerService, Boolean[] boolArr, File file, Semaphore semaphore) {
        return new AudioMessagePlayerService$$Lambda$1(audioMessagePlayerService, boolArr, file, semaphore);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$playOpusFile$0(this.arg$2, this.arg$3, this.arg$4);
    }
}
