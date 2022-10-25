package com.vk.attachpicker.fragment;

import com.vk.attachpicker.mediastore.MediaStoreController;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class GalleryFragment$$Lambda$5 implements MediaStoreController.MediaStoreCallback {
    private final GalleryFragment arg$1;

    private GalleryFragment$$Lambda$5(GalleryFragment galleryFragment) {
        this.arg$1 = galleryFragment;
    }

    public static MediaStoreController.MediaStoreCallback lambdaFactory$(GalleryFragment galleryFragment) {
        return new GalleryFragment$$Lambda$5(galleryFragment);
    }

    @Override // com.vk.attachpicker.mediastore.MediaStoreController.MediaStoreCallback
    @LambdaForm.Hidden
    public void onLoaded(ArrayList arrayList) {
        this.arg$1.lambda$loadMediastore$3(arrayList);
    }
}
