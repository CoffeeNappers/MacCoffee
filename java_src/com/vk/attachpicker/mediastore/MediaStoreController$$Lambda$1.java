package com.vk.attachpicker.mediastore;

import com.vk.attachpicker.mediastore.MediaStoreController;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MediaStoreController$$Lambda$1 implements Runnable {
    private final int arg$1;
    private final long arg$2;
    private final MediaStoreController.MediaStoreCallback arg$3;

    private MediaStoreController$$Lambda$1(int i, long j, MediaStoreController.MediaStoreCallback mediaStoreCallback) {
        this.arg$1 = i;
        this.arg$2 = j;
        this.arg$3 = mediaStoreCallback;
    }

    public static Runnable lambdaFactory$(int i, long j, MediaStoreController.MediaStoreCallback mediaStoreCallback) {
        return new MediaStoreController$$Lambda$1(i, j, mediaStoreCallback);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        MediaStoreController.lambda$load$2(this.arg$1, this.arg$2, this.arg$3);
    }
}
