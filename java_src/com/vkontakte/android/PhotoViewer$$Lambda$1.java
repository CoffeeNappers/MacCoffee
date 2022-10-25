package com.vkontakte.android;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PhotoViewer$$Lambda$1 implements Runnable {
    private final PhotoViewer arg$1;

    private PhotoViewer$$Lambda$1(PhotoViewer photoViewer) {
        this.arg$1 = photoViewer;
    }

    public static Runnable lambdaFactory$(PhotoViewer photoViewer) {
        return new PhotoViewer$$Lambda$1(photoViewer);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        PhotoViewer.access$lambda$0(this.arg$1);
    }
}
