package com.vk.stories;

import android.graphics.Bitmap;
import java.lang.invoke.LambdaForm;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public final /* synthetic */ class StoriesProcessor$$Lambda$3 implements Callable {
    private final Bitmap arg$1;
    private final Bitmap arg$2;
    private final int arg$3;
    private final int arg$4;
    private final AtomicReference arg$5;

    private StoriesProcessor$$Lambda$3(Bitmap bitmap, Bitmap bitmap2, int i, int i2, AtomicReference atomicReference) {
        this.arg$1 = bitmap;
        this.arg$2 = bitmap2;
        this.arg$3 = i;
        this.arg$4 = i2;
        this.arg$5 = atomicReference;
    }

    public static Callable lambdaFactory$(Bitmap bitmap, Bitmap bitmap2, int i, int i2, AtomicReference atomicReference) {
        return new StoriesProcessor$$Lambda$3(bitmap, bitmap2, i, i2, atomicReference);
    }

    @Override // java.util.concurrent.Callable
    @LambdaForm.Hidden
    public Object call() {
        return StoriesProcessor.lambda$saveOverlayImage$4(this.arg$1, this.arg$2, this.arg$3, this.arg$4, this.arg$5);
    }
}
