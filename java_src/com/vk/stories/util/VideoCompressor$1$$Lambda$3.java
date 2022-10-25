package com.vk.stories.util;

import com.vk.stories.util.VideoCompressor;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VideoCompressor$1$$Lambda$3 implements Runnable {
    private final VideoCompressor.CompressDelegate arg$1;
    private final Exception arg$2;

    private VideoCompressor$1$$Lambda$3(VideoCompressor.CompressDelegate compressDelegate, Exception exc) {
        this.arg$1 = compressDelegate;
        this.arg$2 = exc;
    }

    public static Runnable lambdaFactory$(VideoCompressor.CompressDelegate compressDelegate, Exception exc) {
        return new VideoCompressor$1$$Lambda$3(compressDelegate, exc);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.onError(this.arg$2);
    }
}
