package com.vk.stories.util;

import com.vk.stories.util.VideoCompressor;
import java.io.File;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VideoCompressor$1$$Lambda$4 implements Runnable {
    private final VideoCompressor.CompressDelegate arg$1;
    private final long arg$2;
    private final long arg$3;
    private final File arg$4;

    private VideoCompressor$1$$Lambda$4(VideoCompressor.CompressDelegate compressDelegate, long j, long j2, File file) {
        this.arg$1 = compressDelegate;
        this.arg$2 = j;
        this.arg$3 = j2;
        this.arg$4 = file;
    }

    public static Runnable lambdaFactory$(VideoCompressor.CompressDelegate compressDelegate, long j, long j2, File file) {
        return new VideoCompressor$1$$Lambda$4(compressDelegate, j, j2, file);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.onFinish(this.arg$2 - this.arg$3, this.arg$4);
    }
}
