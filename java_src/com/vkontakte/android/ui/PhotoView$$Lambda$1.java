package com.vkontakte.android.ui;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PhotoView$$Lambda$1 implements View.OnClickListener {
    private final PhotoView arg$1;

    private PhotoView$$Lambda$1(PhotoView photoView) {
        this.arg$1 = photoView;
    }

    public static View.OnClickListener lambdaFactory$(PhotoView photoView) {
        return new PhotoView$$Lambda$1(photoView);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$init$0(view);
    }
}
