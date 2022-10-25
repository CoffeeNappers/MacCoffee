package com.vkontakte.android.attachments;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VideoAttachment$$Lambda$9 implements Runnable {
    private final VideoAttachment arg$1;
    private final int arg$2;

    private VideoAttachment$$Lambda$9(VideoAttachment videoAttachment, int i) {
        this.arg$1 = videoAttachment;
        this.arg$2 = i;
    }

    public static Runnable lambdaFactory$(VideoAttachment videoAttachment, int i) {
        return new VideoAttachment$$Lambda$9(videoAttachment, i);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onUpdatePlaybackPosition$9(this.arg$2);
    }
}
