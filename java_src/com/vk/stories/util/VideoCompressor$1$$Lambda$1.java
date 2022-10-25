package com.vk.stories.util;

import com.vk.stories.util.VideoCompressor;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VideoCompressor$1$$Lambda$1 implements Runnable {
    private final VideoCompressor.CompressDelegate arg$1;

    private VideoCompressor$1$$Lambda$1(VideoCompressor.CompressDelegate compressDelegate) {
        this.arg$1 = compressDelegate;
    }

    public static Runnable lambdaFactory$(VideoCompressor.CompressDelegate compressDelegate) {
        return new VideoCompressor$1$$Lambda$1(compressDelegate);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        VideoCompressor.AnonymousClass1.lambda$run$0(this.arg$1);
    }
}
