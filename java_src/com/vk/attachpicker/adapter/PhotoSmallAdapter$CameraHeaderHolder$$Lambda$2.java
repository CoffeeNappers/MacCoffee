package com.vk.attachpicker.adapter;

import android.view.View;
import com.vk.attachpicker.adapter.PhotoSmallAdapter;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PhotoSmallAdapter$CameraHeaderHolder$$Lambda$2 implements View.OnClickListener {
    private final PhotoSmallAdapter.CameraHeaderHolder arg$1;

    private PhotoSmallAdapter$CameraHeaderHolder$$Lambda$2(PhotoSmallAdapter.CameraHeaderHolder cameraHeaderHolder) {
        this.arg$1 = cameraHeaderHolder;
    }

    public static View.OnClickListener lambdaFactory$(PhotoSmallAdapter.CameraHeaderHolder cameraHeaderHolder) {
        return new PhotoSmallAdapter$CameraHeaderHolder$$Lambda$2(cameraHeaderHolder);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$1(view);
    }
}
