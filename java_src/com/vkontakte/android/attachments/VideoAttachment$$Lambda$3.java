package com.vkontakte.android.attachments;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VideoAttachment$$Lambda$3 implements Runnable {
    private final VideoAttachment arg$1;

    private VideoAttachment$$Lambda$3(VideoAttachment videoAttachment) {
        this.arg$1 = videoAttachment;
    }

    public static Runnable lambdaFactory$(VideoAttachment videoAttachment) {
        return new VideoAttachment$$Lambda$3(videoAttachment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$play$2();
    }
}
