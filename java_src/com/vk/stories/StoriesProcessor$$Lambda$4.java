package com.vk.stories;

import bolts.Continuation;
import bolts.Task;
import com.vk.stories.StoriesProcessor;
import java.io.File;
import java.lang.invoke.LambdaForm;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public final /* synthetic */ class StoriesProcessor$$Lambda$4 implements Continuation {
    private final StoriesProcessor.ImageProcessingCallback2 arg$1;
    private final AtomicReference arg$2;
    private final AtomicReference arg$3;

    private StoriesProcessor$$Lambda$4(StoriesProcessor.ImageProcessingCallback2 imageProcessingCallback2, AtomicReference atomicReference, AtomicReference atomicReference2) {
        this.arg$1 = imageProcessingCallback2;
        this.arg$2 = atomicReference;
        this.arg$3 = atomicReference2;
    }

    public static Continuation lambdaFactory$(StoriesProcessor.ImageProcessingCallback2 imageProcessingCallback2, AtomicReference atomicReference, AtomicReference atomicReference2) {
        return new StoriesProcessor$$Lambda$4(imageProcessingCallback2, atomicReference, atomicReference2);
    }

    @Override // bolts.Continuation
    @LambdaForm.Hidden
    /* renamed from: then */
    public Object mo533then(Task task) {
        return this.arg$1.onSuccess((File) this.arg$2.get(), (File) this.arg$3.get());
    }
}
