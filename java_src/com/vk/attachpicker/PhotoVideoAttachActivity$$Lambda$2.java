package com.vk.attachpicker;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PhotoVideoAttachActivity$$Lambda$2 implements View.OnClickListener {
    private final PhotoVideoAttachActivity arg$1;

    private PhotoVideoAttachActivity$$Lambda$2(PhotoVideoAttachActivity photoVideoAttachActivity) {
        this.arg$1 = photoVideoAttachActivity;
    }

    public static View.OnClickListener lambdaFactory$(PhotoVideoAttachActivity photoVideoAttachActivity) {
        return new PhotoVideoAttachActivity$$Lambda$2(photoVideoAttachActivity);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreate$1(view);
    }
}
