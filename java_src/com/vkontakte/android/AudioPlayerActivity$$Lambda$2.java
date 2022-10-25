package com.vkontakte.android;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class AudioPlayerActivity$$Lambda$2 implements Runnable {
    private final AudioPlayerActivity arg$1;
    private final boolean arg$2;

    private AudioPlayerActivity$$Lambda$2(AudioPlayerActivity audioPlayerActivity, boolean z) {
        this.arg$1 = audioPlayerActivity;
        this.arg$2 = z;
    }

    public static Runnable lambdaFactory$(AudioPlayerActivity audioPlayerActivity, boolean z) {
        return new AudioPlayerActivity$$Lambda$2(audioPlayerActivity, z);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$displayInfo$1(this.arg$2);
    }
}
