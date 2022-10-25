package com.vk.stories;

import android.graphics.Bitmap;
import java.lang.invoke.LambdaForm;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
final /* synthetic */ class StoriesProcessor$$Lambda$2 implements Callable {
    private final Bitmap arg$1;
    private final AtomicReference arg$2;

    private StoriesProcessor$$Lambda$2(Bitmap bitmap, AtomicReference atomicReference) {
        this.arg$1 = bitmap;
        this.arg$2 = atomicReference;
    }

    public static Callable lambdaFactory$(Bitmap bitmap, AtomicReference atomicReference) {
        return new StoriesProcessor$$Lambda$2(bitmap, atomicReference);
    }

    @Override // java.util.concurrent.Callable
    @LambdaForm.Hidden
    public Object call() {
        return StoriesProcessor.lambda$saveOverlayImage$3(this.arg$1, this.arg$2);
    }
}
