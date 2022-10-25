package com.vk.attachpicker.fragment;

import android.media.MediaScannerConnection;
import android.net.Uri;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GalleryFragment$$Lambda$6 implements MediaScannerConnection.OnScanCompletedListener {
    private final GalleryFragment arg$1;

    private GalleryFragment$$Lambda$6(GalleryFragment galleryFragment) {
        this.arg$1 = galleryFragment;
    }

    public static MediaScannerConnection.OnScanCompletedListener lambdaFactory$(GalleryFragment galleryFragment) {
        return new GalleryFragment$$Lambda$6(galleryFragment);
    }

    @Override // android.media.MediaScannerConnection.OnScanCompletedListener
    @LambdaForm.Hidden
    public void onScanCompleted(String str, Uri uri) {
        this.arg$1.lambda$onActivityResult$4(str, uri);
    }
}
