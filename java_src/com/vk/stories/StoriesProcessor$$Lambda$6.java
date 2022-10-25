package com.vk.stories;

import com.vk.stories.StoriesProcessor;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class StoriesProcessor$$Lambda$6 implements Runnable {
    private final StoriesProcessor.ImageProcessingCallback arg$1;

    private StoriesProcessor$$Lambda$6(StoriesProcessor.ImageProcessingCallback imageProcessingCallback) {
        this.arg$1 = imageProcessingCallback;
    }

    public static Runnable lambdaFactory$(StoriesProcessor.ImageProcessingCallback imageProcessingCallback) {
        return new StoriesProcessor$$Lambda$6(imageProcessingCallback);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.onFailure();
    }
}
