package com.vk.attachpicker.mediastore;

import com.vk.attachpicker.mediastore.MediaStoreController;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final /* synthetic */ class MediaStoreController$$Lambda$2 implements Runnable {
    private final int arg$1;
    private final ArrayList arg$2;
    private final MediaStoreController.MediaStoreCallback arg$3;
    private final ArrayList arg$4;

    private MediaStoreController$$Lambda$2(int i, ArrayList arrayList, MediaStoreController.MediaStoreCallback mediaStoreCallback, ArrayList arrayList2) {
        this.arg$1 = i;
        this.arg$2 = arrayList;
        this.arg$3 = mediaStoreCallback;
        this.arg$4 = arrayList2;
    }

    public static Runnable lambdaFactory$(int i, ArrayList arrayList, MediaStoreController.MediaStoreCallback mediaStoreCallback, ArrayList arrayList2) {
        return new MediaStoreController$$Lambda$2(i, arrayList, mediaStoreCallback, arrayList2);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        MediaStoreController.lambda$null$1(this.arg$1, this.arg$2, this.arg$3, this.arg$4);
    }
}
