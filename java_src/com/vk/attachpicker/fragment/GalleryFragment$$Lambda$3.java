package com.vk.attachpicker.fragment;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GalleryFragment$$Lambda$3 implements View.OnClickListener {
    private final GalleryFragment arg$1;

    private GalleryFragment$$Lambda$3(GalleryFragment galleryFragment) {
        this.arg$1 = galleryFragment;
    }

    public static View.OnClickListener lambdaFactory$(GalleryFragment galleryFragment) {
        return new GalleryFragment$$Lambda$3(galleryFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onViewCreated$1(view);
    }
}
