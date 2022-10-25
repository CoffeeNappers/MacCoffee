package com.vk.stories;

import android.graphics.Bitmap;
import com.vk.stories.StoriesProcessor;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class StoriesProcessor$$Lambda$1 implements Runnable {
    private final Bitmap arg$1;
    private final Bitmap arg$2;
    private final int arg$3;
    private final int arg$4;
    private final boolean arg$5;
    private final StoriesProcessor.ImageProcessingCallback arg$6;

    private StoriesProcessor$$Lambda$1(Bitmap bitmap, Bitmap bitmap2, int i, int i2, boolean z, StoriesProcessor.ImageProcessingCallback imageProcessingCallback) {
        this.arg$1 = bitmap;
        this.arg$2 = bitmap2;
        this.arg$3 = i;
        this.arg$4 = i2;
        this.arg$5 = z;
        this.arg$6 = imageProcessingCallback;
    }

    public static Runnable lambdaFactory$(Bitmap bitmap, Bitmap bitmap2, int i, int i2, boolean z, StoriesProcessor.ImageProcessingCallback imageProcessingCallback) {
        return new StoriesProcessor$$Lambda$1(bitmap, bitmap2, i, i2, z, imageProcessingCallback);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        StoriesProcessor.lambda$processImage$2(this.arg$1, this.arg$2, this.arg$3, this.arg$4, this.arg$5, this.arg$6);
    }
}
