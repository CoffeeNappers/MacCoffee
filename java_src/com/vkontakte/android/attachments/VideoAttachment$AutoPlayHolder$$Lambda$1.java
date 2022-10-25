package com.vkontakte.android.attachments;

import com.vkontakte.android.attachments.VideoAttachment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VideoAttachment$AutoPlayHolder$$Lambda$1 implements Runnable {
    private final VideoAttachment.AutoPlayHolder arg$1;

    private VideoAttachment$AutoPlayHolder$$Lambda$1(VideoAttachment.AutoPlayHolder autoPlayHolder) {
        this.arg$1 = autoPlayHolder;
    }

    public static Runnable lambdaFactory$(VideoAttachment.AutoPlayHolder autoPlayHolder) {
        return new VideoAttachment$AutoPlayHolder$$Lambda$1(autoPlayHolder);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onViewAttachedToWindow$0();
    }
}
