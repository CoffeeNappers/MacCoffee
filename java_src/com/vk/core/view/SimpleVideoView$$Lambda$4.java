package com.vk.core.view;

import android.net.Uri;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SimpleVideoView$$Lambda$4 implements Runnable {
    private final SimpleVideoView arg$1;
    private final Uri arg$2;

    private SimpleVideoView$$Lambda$4(SimpleVideoView simpleVideoView, Uri uri) {
        this.arg$1 = simpleVideoView;
        this.arg$2 = uri;
    }

    public static Runnable lambdaFactory$(SimpleVideoView simpleVideoView, Uri uri) {
        return new SimpleVideoView$$Lambda$4(simpleVideoView, uri);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$setVideoUri$3(this.arg$2);
    }
}
