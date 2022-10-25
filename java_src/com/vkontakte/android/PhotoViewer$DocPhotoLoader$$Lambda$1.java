package com.vkontakte.android;

import com.vkontakte.android.PhotoViewer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PhotoViewer$DocPhotoLoader$$Lambda$1 implements Runnable {
    private final PhotoViewer arg$1;

    private PhotoViewer$DocPhotoLoader$$Lambda$1(PhotoViewer photoViewer) {
        this.arg$1 = photoViewer;
    }

    public static Runnable lambdaFactory$(PhotoViewer photoViewer) {
        return new PhotoViewer$DocPhotoLoader$$Lambda$1(photoViewer);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        PhotoViewer.DocPhotoLoader.lambda$run$0(this.arg$1);
    }
}
