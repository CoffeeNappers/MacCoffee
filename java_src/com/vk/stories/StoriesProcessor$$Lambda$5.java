package com.vk.stories;

import com.vk.stories.StoriesProcessor;
import java.io.File;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class StoriesProcessor$$Lambda$5 implements Runnable {
    private final StoriesProcessor.ImageProcessingCallback arg$1;
    private final File arg$2;

    private StoriesProcessor$$Lambda$5(StoriesProcessor.ImageProcessingCallback imageProcessingCallback, File file) {
        this.arg$1 = imageProcessingCallback;
        this.arg$2 = file;
    }

    public static Runnable lambdaFactory$(StoriesProcessor.ImageProcessingCallback imageProcessingCallback, File file) {
        return new StoriesProcessor$$Lambda$5(imageProcessingCallback, file);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.onSuccess(this.arg$2);
    }
}
