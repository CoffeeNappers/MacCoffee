package com.vk.attachpicker.mediastore;

import java.lang.invoke.LambdaForm;
import java.util.Comparator;
/* loaded from: classes.dex */
final /* synthetic */ class MediaStoreController$$Lambda$3 implements Comparator {
    private static final MediaStoreController$$Lambda$3 instance = new MediaStoreController$$Lambda$3();

    private MediaStoreController$$Lambda$3() {
    }

    public static Comparator lambdaFactory$() {
        return instance;
    }

    @Override // java.util.Comparator
    @LambdaForm.Hidden
    public int compare(Object obj, Object obj2) {
        return MediaStoreController.lambda$static$0((MediaStoreEntry) obj, (MediaStoreEntry) obj2);
    }
}
