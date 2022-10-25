package com.vk.attachpicker.screen;

import android.view.View;
import com.vk.attachpicker.widget.ImageViewerImageView;
import com.vk.core.util.Screen;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ViewerScreen$$Lambda$6 implements Screen.ViewCallback {
    private final ViewerScreen arg$1;
    private final ImageViewerImageView[] arg$2;

    private ViewerScreen$$Lambda$6(ViewerScreen viewerScreen, ImageViewerImageView[] imageViewerImageViewArr) {
        this.arg$1 = viewerScreen;
        this.arg$2 = imageViewerImageViewArr;
    }

    public static Screen.ViewCallback lambdaFactory$(ViewerScreen viewerScreen, ImageViewerImageView[] imageViewerImageViewArr) {
        return new ViewerScreen$$Lambda$6(viewerScreen, imageViewerImageViewArr);
    }

    @Override // com.vk.core.util.Screen.ViewCallback
    @LambdaForm.Hidden
    public void view(View view) {
        this.arg$1.lambda$getCurrentZoomableImageView$12(this.arg$2, view);
    }
}
