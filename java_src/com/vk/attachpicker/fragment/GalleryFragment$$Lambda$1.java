package com.vk.attachpicker.fragment;

import com.vk.attachpicker.events.NotificationListener;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GalleryFragment$$Lambda$1 implements NotificationListener {
    private final GalleryFragment arg$1;

    private GalleryFragment$$Lambda$1(GalleryFragment galleryFragment) {
        this.arg$1 = galleryFragment;
    }

    public static NotificationListener lambdaFactory$(GalleryFragment galleryFragment) {
        return new GalleryFragment$$Lambda$1(galleryFragment);
    }

    @Override // com.vk.attachpicker.events.NotificationListener
    @LambdaForm.Hidden
    public void onNotification(int i, int i2, Object obj) {
        this.arg$1.lambda$new$5(i, i2, (Void) obj);
    }
}
