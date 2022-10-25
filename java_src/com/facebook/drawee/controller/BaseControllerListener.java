package com.facebook.drawee.controller;

import android.graphics.drawable.Animatable;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class BaseControllerListener<INFO> implements ControllerListener<INFO> {
    private static final ControllerListener<Object> NO_OP_LISTENER = new BaseControllerListener();

    public static <INFO> ControllerListener<INFO> getNoOpListener() {
        return (ControllerListener<INFO>) NO_OP_LISTENER;
    }

    @Override // com.facebook.drawee.controller.ControllerListener
    public void onSubmit(String id, Object callerContext) {
    }

    @Override // com.facebook.drawee.controller.ControllerListener
    public void onFinalImageSet(String id, @Nullable INFO imageInfo, @Nullable Animatable animatable) {
    }

    @Override // com.facebook.drawee.controller.ControllerListener
    public void onIntermediateImageSet(String id, @Nullable INFO imageInfo) {
    }

    @Override // com.facebook.drawee.controller.ControllerListener
    public void onIntermediateImageFailed(String id, Throwable throwable) {
    }

    @Override // com.facebook.drawee.controller.ControllerListener
    public void onFailure(String id, Throwable throwable) {
    }

    @Override // com.facebook.drawee.controller.ControllerListener
    public void onRelease(String id) {
    }
}
