package com.vk.stories.util;

import com.vk.stories.util.VideoCompressor;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VideoCompressor$1$1$$Lambda$1 implements Runnable {
    private final VideoCompressor.CompressDelegate arg$1;
    private final int arg$2;

    private VideoCompressor$1$1$$Lambda$1(VideoCompressor.CompressDelegate compressDelegate, int i) {
        this.arg$1 = compressDelegate;
        this.arg$2 = i;
    }

    public static Runnable lambdaFactory$(VideoCompressor.CompressDelegate compressDelegate, int i) {
        return new VideoCompressor$1$1$$Lambda$1(compressDelegate, i);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.onProgress(this.arg$2);
    }
}
